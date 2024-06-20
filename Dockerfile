FROM almalinux:9
RUN dnf install nginx -y
LABEL author="Harish" \
      course="DevOps" \
      duration="100hr"
ENV trainer="Siva" \
    course="docker" 
RUN rm -rf /user/share/nginx/html/index.html
COPY index.html /user/share/nginx/html/index.html
ADD https://raw.githubusercontent.com/BHarish07/backend/main/Jenkinsfile /tmp/sample.txt
ADD https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip /tmp/
ADD sample-1.tar /tmp/expense/
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]


     
