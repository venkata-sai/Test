#!/usr/bin/env python2.7

import os
import sys
import json
import yaml

def yaml_to_json(src, dest):
    """
    Converts the given source YAML files to JSON, writing it to the
    given destination.

    :param src:     Filepath to the source YAML file
    :param dest:    Filepath to the destination JSON file
    :return:
    """
    if not src.endswith('.yml') and not src.endswith('.yaml'):
        raise ValueError('YAML filename must end with '
                         '.yml or .yaml: {}'.format(src))

    with open(src, 'r') as src_fp, open(dest, 'w') as dest_fp:
        data = yaml.load(src_fp)
        dest_fp.write(json.dumps(data, indent=2))

    return dest

if __name__ == '__main__':
    source_file = sys.argv[1]
    dest_file = os.path.join(os.path.basename(source_file).replace('yml', 'json'))

    packer_file = yaml_to_json(source_file, dest_file)

