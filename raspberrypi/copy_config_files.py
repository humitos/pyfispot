# WARNING: This script copies all the files in this repo into the root
# WARNING: tree of the RaspberryPi and saves a backup file (.bak).
# WARNING: Need to be ran with "sudo".

import os
import sys
import shutil


for root, dirnames, filenames in os.walk('etc'):
    for f in filenames:
        relative_path = os.path.abspath(os.path.join(root, f))
        root_path = os.path.join('/', root, f)
        print('Copying: {} to {}'.format(relative_path, root_path))
        answer = raw_input('Continue [Y/n]')
        if answer != 'Y':
            print('Exiting...')
            sys.exit(1)
        try:
            shutil.move(root_path, root_path + '.bak')
        except IOError as e:
            print('There was an error backuping this file')
            print('Exception: {}'.format(e))
        shutil.copy(relative_path, root_path)
