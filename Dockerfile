FROM python:3.9.7
RUN pip install flask
CMD ["python","app.py"]
COPY app.py /app.py