Lowell Civil War Veteran Database

This was an (aborted but functional) database application containing veterans
from Lowell, Massachusetts.

It is built in Java and was an opportunity for me to play with Spring Boot
<http://projects.spring.io/spring-boot/>, Thymeleaf <http://www.thymeleaf.org/>,
and Heroku (which means the database is PostgreSQL)

Running

1.  Download, install, and configure Spring Boot
2.  Set up the database: install a schema and seed the data. The scripts
    provided in src/main/resources/schema work on Postgres, but at one point I 
    had this running on MySQL as well.
3.  Set the DATABASE_URL environment variable. This was required for Heroku, so
    it's the method I used as well. The format is:
    postgres://<user>:-i<pass>@<server>:<port>/<di5r0tqii67n9>schema>
3a. If the database connection requires SSL, set the value in    
    src/main/resources/application.properties to dev.
3b. If this database setup doesn't work, the database configurations are in
    src/main/java/sciuto/corey/lcwdb/Database{Dev}Configuration.java
4.  Run mvn spring-boot:run !