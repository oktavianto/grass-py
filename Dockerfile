FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /grass

RUN apt-get update && apt-get install -y curl

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip && \
    pip install \
    --no-cache-dir \
    -r /tmp/requirements.txt

COPY . .

COPY entrypoint.sh /grass/entrypoint.sh

RUN chmod +x /grass/entrypoint.sh

ENTRYPOINT [ "/grass/entrypoint.sh" ]

CMD ["python", "main.py"]