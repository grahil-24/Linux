
For eg: in Centos after installing apache/httpd package, we need to start the httpd service using systemctl. 

    - name: start httpd package
      tags: apache, amazon, httpd
      service: 
        name: httpd
        state: started
        enabled: yes
      when: ansible_distribution == "Amazon"


- service - name of service we want to manage
- state-  whether to stop, or start it
- enabled- if enabled, service is automatically started, when server is rebooted


