USER=$1

# El Blog de Humitos - http://elblogdehumitos.com.ar/
rsync -rav --delete-after --copy-links ~/Source/blog/nikola/output/* $USER@raspberrypi.redlibre:~/apps/elblogdehumitos.com.ar
# Argentina en Python - http://argentinaenpython.com.ar/
rsync -rav --delete-after --copy-links ~/Source/argentinaenpython.com.ar/web/output/* $USER@raspberrypi.redlibre:~/apps/argentinaenpython.com.ar

# El tutorial de Python - http://docs.python.org.ar/tutorial
rsync -rav --delete-after ~/Source/sprintpynea/tutorial/traducidos/web/* $USER@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial
rsync -rav --delete-after ~/Source/sprintpynea/tutorial/traducidos/_build/html/* $USER@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial/3
rsync -rav --delete-after ~/Source/sprintpynea/tutorial/traducidos/_build/pdf/TutorialPython.pdf  $USER@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial/pdfs/TutorialPython3.pdf

scp -r www-pyar@python.org.ar:/home/www-pyar/docs.python.org.ar/tutorial/2 /tmp
scp -r /tmp/2 $USER@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial

scp -r www-pyar@python.org.ar:/home/www-pyar/docs.python.org.ar/tutorial/pdfs/TutorialPython2.pdf /tmp
scp /tmp/TutorialPython2.pdf $USER@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial/pdfs
