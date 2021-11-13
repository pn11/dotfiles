import json
import os
from os.path import join, dirname
import subprocess


HOME = os.getenv("HOME") + '/'
DIR = dirname(__file__) + '/'

def main():
    json_dict = json.load(open('dotfiles.json'))
    for dic in json_dict:
        s = dic['src']
        t = dic['tgt']
        mklink(s, t)


def replace_tilde(s: str):
    return s.replace('~/', HOME)


def mklink(src: str, tgt: str):
    src = replace_tilde(src)
    tgt = replace_tilde(tgt)
    if tgt == '':
        tgt = HOME + src
    src = DIR + src

    if not os.path.exists(src):
        print('Source file not exist:' + src)
        return -1
    if os.path.exists(tgt):
        print('Target file already exists:' + tgt)
        return -1
    
    res = subprocess.run(['ln', '-s',  src, tgt], capture_output=True)
    if res.returncode == 0:
        print(src + ' > ' + tgt)
    else:
        print(res.stdout.decode())
        print(res.stderr.decode())


if __name__ == '__main__':
    main()
