# WARNING: this script creates symlinks for the file in this repo into
# the root tree of the RaspberryPi. There are some files (like
# sudoers) that doesn't work if it's a symlink.

# WARNING: this script should be ran with "sudo"

import os
import shutil


for root, dirnames, filenames in os.walk('etc'):
    for f in filenames:
        relative_path = os.path.abspath(os.path.join(root, f))
        root_path = os.path.join('/', root, f)
        print('Creating symlink for:', root_path)
        shutil.move(root_path, root_path + '.bak')
        os.symlink(relative_path, root_path)
