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
- **MySQL**: 데이터베이스
- **jQuery**: JavaScript 라이브러리, Ajax 요청 처리
- **CSS**: 기본적인 스타일링 및 애니메이션 효과
- **AOS (Animate On Scroll)**: 스크롤 시 애니메이션 효과

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
