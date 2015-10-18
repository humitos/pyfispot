# WARNING: This script copies all the files in this repo into the root
# WARNING: tree of the RaspberryPi and saves a backup file (.bak).
# WARNING: Need to be ran with "sudo".

import os
import shutil


for directory in ('home', 'etc'):
    for root, dirnames, filenames in os.walk(directory):
        if 'home/pi/apps/' in root:
            # exclude all the apps
            continue

        for f in filenames:
            relative_path = os.path.abspath(os.path.join(root, f))
            root_path = os.path.join('/', root, f)
            print('Copying: {} to {}'.format(relative_path, root_path))
            answer = raw_input('Copy this file? [Y/n]')
            if answer != 'Y':
                print('Skipping...')
                continue
            try:
                shutil.move(root_path, root_path + '.bak')
            except IOError as e:
                print('There was an error backuping this file')
                print('Exception: {}'.format(e))
            shutil.copy(relative_path, root_path)

# Some specific-configuration commands
os.system('chown root:root /etc/wpa_supplicant/wpa_roam.conf')
os.system('chmod 600 /etc/wpa_supplicant/wpa_roam.conf')
