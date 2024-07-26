- name: copy default html file for site
      tags: apache, apache2, httpd
      copy: 
        src: default_site.html
        dest: /var/www/html/index.html
        owner: root
        group: root
        mode: 0644


- mode - permission
- dest: destination path. File name not be same as source file
- src: source path


