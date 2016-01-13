set -e

cd ~/apps
rm -rf tutorial.djangogirls.org docs.python.org.ar djangotutorial.readthedocs.org

# Tutorial Django Girls (Ingles)
wget --continue --timestamping --recursive \
     --no-clobber --page-requisites \
     --html-extension --convert-links \
     --restrict-file-names=windows \
     --no-parent \
     http://tutorial.djangogirls.org/en/index.html

# Tutorial Django Girls (Español)
wget --continue --timestamping --recursive \
     --no-clobber --page-requisites \
     --html-extension --convert-links \
     --restrict-file-names=windows \
     --no-parent \
     http://tutorial.djangogirls.org/es/index.html

# Tutorial Python
wget --continue --timestamping --recursive \
     --no-clobber --page-requisites \
     --html-extension --convert-links \
     --restrict-file-names=windows \
     --no-parent \
     http://docs.python.org.ar/tutorial/3/index.html

# Tutorial Django
wget --continue --timestamping --recursive \
     --no-clobber --page-requisites \
     --html-extension --convert-links \
     --restrict-file-names=windows \
     --no-parent \
    http://djangotutorial.readthedocs.org/es/1.8/
