#!/usr/bin/env python3

import os.path

from pathlib import PurePath as Path
from string import Template

import bs4
import requests


def read_template():
    import os.path
    template = os.path.join(os.path.dirname(__file__), 'jdt-language-server.template')
    with open(template, 'r') as f:
        return Template(f.read())

def url(filename):
    return '/'.join(['http://download.eclipse.org/jdtls/snapshots', filename])

def find_latest():
    r = requests.get(url('latest.txt'))
    r.raise_for_status()
    return r.text.strip()

def fetch_sha256(filename, hash_function='sha256'):
    sha256_file = '.'.join([filename, hash_function])
    r = requests.get(url(sha256_file))
    r.raise_for_status()
    return r.text.strip()

def extract_version_string(filename):
    a = '-'.join(filename.rsplit('-')[-2:])
    return '.'.join(a.split('.')[:-2])

def file_exists(filename):
    r = requests.head(url(filename))
    return r.status_code < 400

if __name__ == '__main__':
    latest_snapshot_file = find_latest()
    if file_exists(latest_snapshot_file):
        urrrl = url(latest_snapshot_file)
        sha256 = fetch_sha256(latest_snapshot_file)
        version = extract_version_string(latest_snapshot_file)
        template = read_template()
        print(template.substitute({
            'url': urrrl,
            'sha256': sha256,
            'version': version,
        }), end='')
