# 친구 정보 관리 시스템

이 프로젝트는 사용자가 친구의 이름, 전화번호, 이메일, 메모를 등록하고 관리할 수 있는 간단한 웹 애플리케이션입니다. 친구 정보의 CRUD(생성, 읽기, 업데이트, 삭제) 기능을 제공하며, 사용자 인터페이스는 HTML, CSS, JavaScript로 구현되어 있습니다. 또한, Ajax를 사용하여 비동기 방식으로 데이터를 처리하고, 동적으로 테이블을 갱신합니다.

## 핵심 기능

- **친구 추가**: 사용자가 이름, 전화번호, 이메일, 메모를 입력하여 친구 정보를 추가할 수 있습니다.
- **친구 수정**: 이미 등록된 친구의 정보를 수정할 수 있습니다.
- **친구 삭제**: 선택한 친구의 정보를 삭제할 수 있습니다.
- **중복 검사**: 전화번호와 이메일의 중복을 검사하여 사용자가 유효한 정보를 입력하도록 유도합니다.
- **동적 테이블 갱신**: 친구 목록은 Ajax를 사용하여 동적으로 갱신됩니다.

## 기술 스택

- **Java**: 서버 사이드 로직
- **JSP**: 동적인 HTML 페이지를 생성
- **OracleDB**: 데이터베이스
- **jQuery**: JavaScript 라이브러리, Ajax 요청 처리
- **CSS**: 기본적인 스타일링 및 애니메이션 효과
  라이브러리
- **AOS (Animate On Scroll)**: 스크롤 시 애니메이션 효과
- **Particle.js**: 뒷배경

## 프로젝트 구조




## 주요 코드

### 친구 목록 테이블 출력 (JSP 코드)

이 코드는 `getFriendsTable.jsp` 파일에서 친구 목록을 동적으로 출력합니다. 각 친구 항목은 테이블에 표시되며, 테이블에서 각 친구를 클릭하여 수정하거나 삭제할 수 있습니다.

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="main.java.com.javaex.dao.FriendDaoImpl" %>
<%@ page import="main.java.com.javaex.vo.FriendVo" %>
<%
    try {
        FriendDaoImpl dao = new FriendDaoImpl();
        List<FriendVo> list = dao.getList();

        for (FriendVo li : list) {
            String rowClass = (li.getId() % 2 == 0) ? "even" : "odd";
%>
<tr class="<%= rowClass %>">
    <td><input type="checkbox" name="selectedIds" value="<%= li.getId() %>"></td>
    <td><%= li.getName() %></td>
    <td><%= li.getPhone() %></td>
    <td><%= li.getEmail() %></td>
    <td><%= li.getMemo() %></td>
</tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
```

#### JavaScript 코드 (친구 정보 추가)

```javascript
$("#insert").on("click", function() {
    // 전화번호와 이메일 검사를 완료했는지 확인
    if (!isPhoneChecked || !isEmailChecked) {
        alert("휴대폰과 이메일 검사를 완료해주세요.");
        return;
    }

    // 입력 값 가져오기
    const name = $("#name").val();
    const phone = $("#phone").val();
    const email = $("#email").val();
    const memo = $("#memo").val();

    // 모든 입력 값이 채워졌는지 확인
    if (!name || !phone || !email || !memo) {
        alert("모든 항목을 입력해주세요.");
        return;
    }

    // 서버에 전송할 데이터
    const params = { name: name, phone: phone, email: email, memo: memo };

    // AJAX 요청
    $.ajax({
        url: "/friends/insertFriendsTable.jsp",  // 요청을 보낼 URL
        type: "post",  // HTTP 메서드 (POST)
        data: params,  // 서버로 전송할 데이터
        dataType: "json",  // 응답 데이터 형식
        success: function(result) {
            if (result) {
                alert("신규 등록 성공!");
                refreshTable();  // 테이블 갱신 함수 호출
            } else {
                alert("신규 등록 실패.");
            }
        },
        error: function(XHR, status, error) {
            alert("신규 등록 중 오류 발생.");
        }
    });
});
```

## 핵심 기능(CRUD 동작)

## 1. 메인 페이지 (친구 목록 조회)

메인 페이지에서는 친구 목록을 조회할 수 있습니다. 이 페이지에서는 친구들의 이름, 전화번호, 이메일 등의 정보를 확인할 수 있으며, 친구 정보를 추가하거나 수정할 수 있는 버튼도 제공합니다.

### 동영상 설명

[메인 페이지 조회 동영상 보기](https://www.youtube.com/watch?v=example)  
(위 링크는 동영상의 URL로 바꾸세요)

### 화면 구성

- 친구 목록 테이블
- 친구 추가 버튼
- 친구 수정 및 삭제 버튼

---

## 2. 친구 정보 추가

친구 정보를 추가하려면, 이름, 전화번호, 이메일 및 메모를 입력한 후 "추가" 버튼을 클릭합니다. 정보는 비동기적으로 서버에 전송되어 저장됩니다.

### 동영상 설명

[메인 페이지 조회 동영상 보기](https://www.youtube.com/watch?v=example)  
(위 링크는 동영상의 URL로 바꾸세요)

### 화면 구성

- 친구 목록 테이블
- 친구 추가 버튼
- 친구 수정 및 삭제 버튼

---


