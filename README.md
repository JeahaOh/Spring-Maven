# Spring-Maven
Maven을 이용한 Spring Study

- - -
## 19.01.12 스프링 실행 과정
```
1. 클라이언트 요청(/, root 페이지 요청)
2. web.xml에서 dispatcherServlet이 클라이언트 요청을 핸들링(Model, View, Controller를 조합하여 브라우져로 출력해 주는 역할).
3. servlet-context.xml에서 해당 클래스의 웹 요청을 처리하는 컨트롤러를 사용.(HandlerMapping으로 Controller 검색)
4. 해당 Controller가 요청을 처리한 후, 주소 리턴.
5. View에 출력.
```
```
1. Client -> URL로 접근하여 정보를 요청 -> DispatcherServlet.
2. DispatcherServlet -> 해당 요청을 매핑한 컨트롤러가 있는지 검색 -> HandlerMapping.
3. HandlerMapping -> 처리 요청 -> Controller.
4. Controller -> 클라이언트의 요청을 처리하고 결과를 출력할 View의 이름을 리턴 -> DispatcherServlet.
5. DispatcherServlet -> 컨트롤러에서 보내온 view 이름을 토대로 처리 view를 검색.
6. ViewResolver -> 처리결과를 View에 송신 -> View.
7. View -> 처리 결과가 포함된 View를 DispatcherServlet에 송신. -> DispatcherServlet.
8. DispatcherServlet -> 최종결과 출력 -> Client.
```

/WEB-INF/web.xml
    - 웹 프로젝트의 배치 기술서(deploy descriptor).
    - 웹 프로젝트의 환경 설정 파일.
    - 스프링 프로젝트가 실행되면 가장 먼저 web.xml을 읽어 들이게 되고 위에서부터 차례로 태그를 해석함.
```
        <!-- 스프링의 환경 설정 파일 로딩. -->
        <context-param>
            <param-name>contextConfigLocation</param-name>
            <!-- 스프링의 환경 설정 파일인 root0context.xml을 가장 먼저 참조. -->
            <param-value>/WEB-INF/spring/root-context.xml</param-value>
        </context-param>
        <listener>
            <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
        </listener>

        <!-- 서블릿의 환경 설정. -->
        <servlet>
            <servlet-name>appServlet</servlet-name>
            <!-- 스프링에 내장된 DispatcherServlet 클래스를 디폴트 서블릿으로 설정. -->
            <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
            <!-- 모든 서블릿 요청은 DispatcherServlet에서 처리됨. -->
            <!-- DispatcherServlet : Model, View, Controller를 조합하여 브라우져로 출력하는 역할을 하는 클래스. -->
            <init-param>
                <param-name>contextConfigLocation</param-name>
                <param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
                <!-- servlet-context.xml 참조. -->
                <!-- servlet-context.xml 파일 안에 정의된 객체를 로딩. -->
            </init-param>
            <!-- 가장 첫번째 우선순위로 -->
            <load-on-startup>1</load-on-startup>
        </servlet>
        <servlet-mapping>
            <servlet-name>appServlet</servlet-name>
            <url-pattern>/</url-pattern>
            <!-- / (root) : DispatcherServlet이 모든 요청을 가로챌 수 있도록 함. -->
        </servlet-mapping>
        
        <!-- 한글 처리를 위한 인코딩 필터. -->	
        <filter>
            <filter-name>encoding</filter-name>
            <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
            <init-param>
                <param-name>encoding</param-name>
                <param-value>UTF-8</param-value>
            </init-param>
            <init-param>
                <param-name>forceEncoding</param-name>
                <param-value>true</param-value>
            </init-param>
        </filter>
        <filter-mapping>
            <filter-name>encoding</filter-name>
            <url-pattern>/*</url-pattern>
        </filter-mapping>
        
        <!-- 서버의 루트 주소만을 입력하여 접근했을 경우 보여줄 파일. -->
        <welcome-file-list>
            <welcome-file>home.jsp</welcome-file>
        </welcome-file-list>
```

/WEB-INF/spring/appServlet/servlet-context.xml
    - web.xml에서 DispatcherServlet로 이동하게 되고, serlet-conext.xml을 참조하게 됨.
```
        <annotation-driven />
        <!-- @annotation을 사용 가능하게. -->

        <resources mapping="/resources/**" location="/resources/" />
        <!--  -->

        <beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <!-- ViewResolver : (뷰 해석기) 접두어, 접미어 설정으로 파일명만 작성할 수 있게 함. -->
            <beans:property name="prefix" value="/WEB-INF/views/" />
            <!-- 접두어 : 디렉토리. -->
            <beans:property name="suffix" value=".jsp" />
            <!-- 접미어 : 확장자. -->
        </beans:bean>
        
        <context:component-scan base-package="com.study.spring" />
        <!-- 위 패키지 아래의 파일(@Controller)들을 스프링에서 관리하는 컨트롤러로 자동으로 검색, 등록. -->
```
/WEB-INF/spring/root-context.xml
    - 스프링 프로젝트에서 사용하는 고정적인 데이터(DB정보 등)를 빈으로 생성함.
```
    일단은 비워둠.
```

## 19.01.12 스프링 주요 특징
- POJO (Plain Old Java Object) : 별도의 API가 필요하지 않은 일반적인 자바코드를 이용하여 개발 가능.
- 의존성 주입(DI)를 통한 객체간의 관계 구성.
- AOP(Aspect Oriented Programming) 지원 : 반복적인 코드를 줄이고, 개발자가 비지니스 로직에만 집중 할 수 있도록 지원.
- 편리한 MVC구조.
- WAS에 종속적이지 않은 개발 환경

1) IoC (Inversion of Control) - 객체에 대한 제어권.
    - new를 통한 객체 제어권을 스프링에게 넘김.
    - 따라서 instance의 라이프 사이클(생성-소멸)을 개발자가 아닌 스프링 프레임웤이 담당.
2) DI (Dependency Injection) - 의존관계 주입.
    - 객체 간의 의존성을 개발자가 설정하는 것이 아닌 스프링 컨테이너가 주입 시켜 주는 기능.
    - 객체 확장과 재 사용성 증대.
    - 의존관계?
        - 강한 결합은 유지 보수와 재활용을 힘들게 함.
        - 따라서 낮은 결합과 높은 응집도로 코딩해야함.

## 19.01.12 Maven Spring 구조
Spring : 셋팅이 반을 먹고 들어감...

    |- src/main/java            - 자바코드 디렉토리.(Controller, Model, Service)
    |- src/main/resources       - 자바 코드에서 참조하는 리소스 디렉토리.
    |    |- /mybatis-Config.xml, (mybatis의)mapper.xml
    |- src/test/java            - 테스트 관련 코드 디렉토리.
    |- src/test/resources       - 테스트 코드에서 참조하는 리소스 파일들 디렉토리.
    |- src/main/webapp          - 웹 서비스 루트 디렉토리.(외부에서 접근하는 곳.)
    |           |-  /resources  - js, css, image 등의 웹 리소스 파일들 디렉토리.
    |           |-  /WEB-INF    - 외부에서 접근 불가능, Controller를 통해 접근함. (jsp를 접근 하더라도.)
    |                   |-  /classes    - 컴파일된 클래스들 디렉토리.
    |                   |-  /spring     - spring 환경 설정 파일들 디렉토리.
    |                   |       |-  /appServlet/servlet-context.xml - 서블릿과 관련된 리소스에 대한 설정.
    |                   |       |-  /root-context.xml   - 서블릿과 관련되지 않은 모든 리소스에 대한 설정.
    |                   |-  /views      - html, jsp 디렉토리.
    |-  pom.xml     - 메이븐에서 참조하는 설정파일.

- - -
## 19.01.09 설정 잡기...
    Gradle과 Maven으로 build한 Spring의 구조가 달라서? 인지 뭐가 뭔지 잘 모르겠음...
    일단 책을 사도록 하자...

## 19.01.08 현업에서 sts를 사용한다고 하니 sts를 사용해 보도록 하자.
https://spring.io/tools

- [new]-[others]-[Spring]-[Spring Legacy Project]
    - Templates에서 Spring MVC Project 선택
(여기까지 엄청 헤맸음... 딮빡...)
(참고 https://hanazuou.tistory.com/158 )
- - -
## 19.01.08 Maven 설치와 환경변수 잡기

- terminal
    - brew install maven
        - mvn -version
    - sudo vi ~/.bash_profile
        - export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
            - (설치 경로와 버젼을 확인하고 잡아줘야함.)
        - export M2=$M2_HOME/bin
        - export PATH=$PATH:$M2_HOME/bin
    - source .bash_profile
    - 확인하기
        - ➜  ~ echo ${M2_HOME}
        - /usr/local/Cellar/maven/3.6.0/libexec
        - ➜  ~ echo ${M2}
        - /usr/local/Cellar/maven/3.6.0/libexec/bin

