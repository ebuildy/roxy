#!/usr/bin/env python

from jinja2 import Environment
from jinja2.loaders import FileSystemLoader
import datetime
import argparse
import yaml
import os

parser = argparse.ArgumentParser(description='Parse YAML file to subs a template.')
parser.add_argument('yaml', type=str,
                   help='The YAML data file path')

parser.add_argument('template', type=str,
                   help='The Jinja2 template file path')

args = parser.parse_args()

with open(args.yaml, 'r') as stream:
    data = yaml.load(stream)

    data["build_date"] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    data["env"] = os.environ

    env = Environment(loader=FileSystemLoader('.'))

    templateEngine = env.get_template(args.template)

    print(templateEngine.render(data))
