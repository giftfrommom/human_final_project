<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>

button {
    background-color: #008CBA;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

span, body, html, div, p, ul, li, h1, h2, ol, ul, h3 {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
div {
    display: block;
}
.layout-content {
    padding-top: 80px;
    padding-bottom: 80px;
} 
.layout-content .grid-center {
    width: 1184px;
    background: #fff;
    margin: 0 auto;
}
.layout-content .grid-center:first-child > .header:first-child {
    margin-top: 4px;
}
.layout-container .header-tit {
    font-size: 24px;
    color: #333;
    line-height: 28px;
    font-weight: 700;
}
.header + .module-tab.tab-card {
    margin-top: 20px;
}
.module-tab.tab-card .tab-nav {
    width: 100%;
}
.module-tab.tab-card .tab-nav ol {
    margin-left: -8px;
    margin-right: -8px;
}
ol, li{
    list-style: none;
}
ol {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.module-tab.tab-card .nav-item {
    float: left;
    width: 20%;
    padding-right: 8px;
    padding-left: 8px;
    padding-bottom: 16px;
}
li{
    display: list-item;
    text-align: -webkit-match-parent;
}
.card-accordion {
    position: relative;
}
.card-default {
    display: table;
    width: 100%;
    max-height: 161px;
    border-radius: 4px;
    border: solid 1px #d8d8d8;
    background-color: #ffffff;
    height: 161px;
}
.card-accordion .card-inner {
    height: 161px;
    padding-bottom: 32px;
}
.card-default .card-inner {
    position: relative;
    display: table-cell;
}
.card-default .card-inner {
    padding-top: 16px;
    padding-bottom: 16px;
}
.card-default .card-count {
    display: block;
    height: 31px;
    padding: 0 24px 0 24px;
    font-size: 20px;
    color: #ccc;
    line-height: normal;
    font-weight: bold;
}
.card-accordion .card-inner .card-txt {
    height: 81px;
    overflow: hidden;
}
.card-default .card-count + .card-txt {
    padding-top: 9px;
}
.card-default .card-txt {
    width: 100%;
    display: block;
    padding: 0 24px 0 24px;
    font-size: 16px;
    color: #333;
    line-height: 24px;
    font-weight: 600;
    -webkit-box-orient: vertical;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
    word-break: break-word;
    word-wrap: break-word !important;
    word-break: normal !important;
    white-space: pre-wrap !important;
}
.card-content {
    display: none;
        border-top: 1px solid #333; /* 추가한 디자인 */
        padding: 16px; /* 추가한 디자인 */
        font-size: 16px; /* 추가한 디자인 */
        color: #333; /* 추가한 디자인 */
        background-color: #f9f9f9; /* 추가한 디자인 */
}
.card-content p {
        margin-bottom: 8px; /* 추가한 디자인 */
    }

.module-card.card-default.card-accordion:hover {background-color: #0AC290;}



.module-card.card-default.card-accordion {
    position: relative;
    float: left;
    clear: left;
    margin-right: 8px;
    margin-bottom: 16px;
    cursor: pointer;
    border-bottom: 1px solid black;
}
.module-tab.tab-card .bottom-card {
    clear: both;
}
.list-item {
    width: 20%;
    float: none; /* Remove the float property */
    display: flex; /* Use flexbox for positioning */
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    margin: 0 auto; /* Center within the parent container */
    text-align: center;
    margin-top: 200px;
}



</style>
<body>
    <header class="layout-header"></header>
    <div class="layout-body">
        <div class="layout-container" id="serviceMain">
            <div class="layout-breadcrumb" style id="navigationDiv">
                <div class="center"></div>
                <div class="layout-container-top">
                    <div class="top-visual">
                        <img src="/resources/img/Userservicelogo.png" style="width: 1263px; height: 300px;">
                    </div>
                </div>
                <div class="layout-content" >
                    <div class="grid-center" style="display: block;">
                        <div class="header">
                            <h2 class="header-tit">자주 찾는 도움말</h2>
                        </div>
                        <div class="module-tab tab-card" id="hitsListDiv">
                            <div class="card1">
                            <div class="tab-nav" >
                                <ol class="first-card">
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">01</span>
                                                <span class="card-txt" id="faqText">띱 페이지</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">02</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">03</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">04</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">05</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                </ol>
                            </div>
                        </div>
                            <div class="tab-nav">
                                <ol class="bottom-card">
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">06</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">07</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">08</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">09</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="module-card card-default card-accordion">
                                            <span class="card-inner">
                                                <span class="card-count">10</span>
                                                <span class="card-txt" id="faqText">서버 목록이 보이지 않거나</span>
                                            </span>
                                        </div>
                                        <div class="card-content">안녕</div>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layout-content layout-gray">
                    <div class="grid-center" style="display: block;">
                        <div class="header">
                        </div>
                        <div class="module-card list group-col5">
                            <ol>
                                <li class="list-item">
                                    <button style="font-size: 24px;"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
                                        <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                      </svg>채팅상담</button>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function() {
        $(".module-card").click(function() {
            var content = $(this).siblings(".card-content");
            $(".card-content").not(content).hide();
            content.toggle();
        });
    });
</script>
</html>
