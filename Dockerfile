FROM python:3.12-slim

MAINTAINER Gia Hung "hungb2111886@student.ctu.edu.vn"

# Cài đặt các gói hệ thống cần thiết
RUN apt update -y && \
    apt install -y gcc libffi-dev libssl-dev python3-dev

# Đặt thư mục làm việc
WORKDIR /flask_app

# Sao chép requirements.txt vào container
COPY requirements.txt .

# Cài đặt setuptools và wheel trước
RUN pip install --upgrade pip setuptools wheel

# Cài đặt các gói Python yêu cầu
RUN pip install -r requirements.txt --break-system-packages

# Sao chép mã ứng dụng vào container
COPY . .

# Đặt điểm vào và lệnh
ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]


