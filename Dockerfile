FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html
LABEL author="Harish" \
      course="DevOps" \
      duration="100hr"
ENV trainer="Siva" \
    course="docker" 
ADD https://raw.githubusercontent.com/BHarish07/backend/main/Jenkinsfile /tmp/sample.txt
ADD https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip /tmp/
RUN dnf install zip -y && dnf install unzip -y
ADD expense-frontend-v2.zip  /tmp/expense/
WORKDIR /tmp/expense/
RUN unzip /tmp/expense/expense-frontend-v2.zip
ADD sample-1.tar /tmp/expense/ 
ADD expense-frontend-v2.zip  /tmp/frontend/
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]


     
