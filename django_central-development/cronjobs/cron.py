from django_cron import CronJobBase, Schedule
import requests
# from .models import HackerNewsID
import psycopg2
import datetime


import logging

logger = logging.getLogger(__name__)

from django.http import HttpResponse


def my_cron_job():
    print("Cron Job is running...")

    conn = psycopg2.connect(database="odoo1010_VVSLIVE", user="odoo", password="vvs@0710", host="erp.vvsugars.com", port="5432")
    cur = conn.cursor()

    curr_date = datetime.datetime.now()
    datetimeval1 = "2023-03-31 06:30:00"
    datetimeval2 = "2023-03-31 11:00:00"
    
    cur.execute('''select *
                FROM 
                mail_message where create_date BETWEEN '{0}' AND '{1}' ORDER BY create_date LIMIT 20'''.format(datetimeval1, datetimeval2))
    row = cur.fetchall()
    conn.close()

    f = open("/home/erpnext/djangoproject/django_central/loginapps/logfile2.txt", 'a')
    for rows in row:
        rows = str(rows)
        f.write(rows)
        f.write("\n")
    f.close()

def my_cron_job1():
    conn = psycopg2.connect(database="odoo1010_VVSLIVE", user="odoo", password="vvs@0710", host="erp.vvsugars.com", port="5432")
    cur = conn.cursor()
    cur.execute('''select column_name, data_type, character_maximum_length, column_default, is_nullable
                from INFORMATION_SCHEMA.COLUMNS where table_name = 'mail_message''')

    row = cur.fetchall()
    conn.close()

    f = open("/home/erpnext/djangoproject/django_central/loginapps/logfile3.txt", 'a')
    for rows in row:
        rows = str(rows)
        f.write(rows)
        f.write("\n")
    f.close()
