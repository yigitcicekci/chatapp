FROM python:3.11.4
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install fastapi[all]
RUN apt-get update && apt-get install -y uvicorn
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./main.py /code/
CMD ["uvicorn", "main:app", "--reload","--host", "0.0.0.0", "--port","80"]