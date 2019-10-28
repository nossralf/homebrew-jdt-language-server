#!/usr/bin/env python3

import os.path

from pathlib import PurePath as Path
from string import Template
from urllib.request import urlopen, Request


def read_template():
    import os.path

    template = os.path.join(os.path.dirname(__file__), "jdt-language-server.template")
    with open(template, "r") as f:
        return Template(f.read())


def url(filename):
    return "/".join(["http://download.eclipse.org/jdtls/snapshots", filename])


def find_latest():
    with urlopen(url("latest.txt")) as f:
        return f.read().decode("utf-8").strip()


def fetch_sha256(filename, hash_function="sha256"):
    sha256_file = ".".join([filename, hash_function])
    with urlopen(url(sha256_file)) as f:
        return f.read().decode("utf-8").strip()


def extract_version_string(filename):
    a = "-".join(filename.rsplit("-")[-2:])
    return ".".join(a.split(".")[:-2])


def file_exists(filename):
    rq = Request(url(filename), method="HEAD")
    try:
        urlopen(rq)
    except:
        return False
    return True


if __name__ == "__main__":
    latest_snapshot_file = find_latest()
    if file_exists(latest_snapshot_file):
        urrrl = url(latest_snapshot_file)
        sha256 = fetch_sha256(latest_snapshot_file)
        version = extract_version_string(latest_snapshot_file)
        template = read_template()
        print(
            template.substitute({"url": urrrl, "sha256": sha256, "version": version}),
            end="",
        )
