# Python muhitini import qilamiz
FROM python:3.11-slim

#Docker ichida loyiha ishlashi uchun katalog
WORKDIR /shohjahon

# Konteyner ichiga requirements ni import qilmiz
COPY requirements.txt /shohjahon/

# Kerakli kutubhonalarni o'rnatish
RUN pip install --no-cache-dir -r requirements.txt

#Django loyihamizni konteynerga o'tkazamiz
COPY . /shohjahon/

ENV PYTHONUNBUFFERED=1

# Dasturchilar uchun ishora qaysi portda ishlashi to'g'risida
EXPOSE 8010

#Docker ichida ishga tushirish komandasi
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8010"]




