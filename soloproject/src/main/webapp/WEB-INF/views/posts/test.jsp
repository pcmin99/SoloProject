<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>경기 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function() {
            $('tr').click(function() {
                const homeTeamId = $(this).find('.homeTeamid').val();
                const awayTeamId = $(this).find('.awayTeamid').val();

                alert('Home Team ID: ' + homeTeamId);
                alert('Away Team ID: ' + awayTeamId);

                console.log('Home Team ID:', homeTeamId);
                console.log('Away Team ID:', awayTeamId);
            });
        });
    </script>
</head>
<body>
    <h1>경기 목록</h1>
    <table border="1">
        <tr>
            <th>시즌 시작 날짜</th>
            <th>시즌 종료 날짜</th>
            <th>경기 시작</th>
            <th>홈 팀</th>
            <th>원정 팀</th>
        </tr>
        <c:forEach items="${soccerList.matches}" var="match">
            <tr class="match-row">
                <td>${match.season.startDate}</td>
                <td>${match.season.endDate}</td>
                <td>${match.utcDate}</td>
                <td>${match.homeTeam.name}
                    <img src="${match.homeTeam.crest}" width="100" height="100" alt="홈팀 구단 이미지">
                </td>
                <td>${match.awayTeam.name}
                    <img src="${match.awayTeam.crest}" width="100" height="100" alt="어웨이팀 구단 이미지">
                </td>
                <td>
                    ${match.homeTeam.id}
                    <input type="hidden" value="${match.homeTeam.id}" class="homeTeamid"/>
                </td>
                <td>
                    ${match.awayTeam.id}
                    <input type="hidden" value="${match.awayTeam.id}" class="awayTeamid"/>
                </td>
                <td>${match.season.id}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
