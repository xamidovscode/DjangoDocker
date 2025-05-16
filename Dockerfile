# Python muhitini import qilamiz
FROM python:3.11-slim

#Docker ichida loyiha ishlashi uchun katalog
WORKDIR /app

# Konteyner ichiga requirements ni import qilmiz
COPY requirements.txt /app/

# Kerakli kutubhonalarni o'rnatish
RUN pip install --no-cache-dir -r requirements.txt

#Django loyihamizni konteynerga o'tkazamiz
COPY . /app/

ENV PYTHONUNBUFFERED=1

# Dasturchilar uchun ishora qaysi portda ishlashi to'g'risida
EXPOSE 8000

#Docker ichida ishga tushirish komandasi
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8010"]




