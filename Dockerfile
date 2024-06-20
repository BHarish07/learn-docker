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
RUN dnf install zip -y \
    unzip expense-frontend-v2.zip /tmp/expense/
ADD sample-1.tar /tmp/expense/
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]


     
