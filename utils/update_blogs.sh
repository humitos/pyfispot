# El Blog de Humitos - http://elblogdehumitos.com.ar/
rsync -rav --delete-after --copy-links ~/Source/blog/nikola/output/* pi@raspberrypi.redlibre:~/apps/elblogdehumitos.com.ar
# Argentina en Python - http://argentinaenpython.com.ar/
rsync -rav --delete-after --copy-links ~/Source/argentinaenpython.com.ar/web/output/* pi@raspberrypi.redlibre:~/apps/argentinaenpython.com.ar

# El tutorial de Python - http://docs.python.org.ar/tutorial
rsync -rav --delete-after ~/Source/sprintpynea/tutorial/traducidos/web/* pi@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial
rsync -rav --delete-after ~/Source/sprintpynea/tutorial/traducidos/_build/html/* pi@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial/3
rsync -rav --delete-after ~/Source/sprintpynea/tutorial/traducidos/_build/pdf/TutorialPython.pdf  pi@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial/pdfs/TutorialPython3.pdf

scp -r www-pyar@python.org.ar:/home/www-pyar/docs.python.org.ar/tutorial/2 /tmp
scp -r /tmp/2 pi@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial

scp -r www-pyar@python.org.ar:/home/www-pyar/docs.python.org.ar/tutorial/pdfs/TutorialPython2.pdf /tmp
scp /tmp/TutorialPython2.pdf pi@raspberrypi.redlibre:~/apps/tutorial.python.org.ar/tutorial/pdfs
