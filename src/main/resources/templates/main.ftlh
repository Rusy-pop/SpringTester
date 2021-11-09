<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>

<div>
    <@l.logout />

    <span><a href="/user/"> User list</a></span>

</div>

<div>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="Введите текст">
        <input type="tag" name="tag" placeholder="Тег">
        <input type="file" name="file">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Добавить</button>
    </form>
</div>

<div>Список сообщений</div>
<form method="post" action="filter">
    <input type="text" name="filter" value="${filter?ifExists}">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <button type="submit">Найти</button>
</form>

<#list messages as message>
<div>
    <i>${message.id}</i>
    <span>${message.text}</span>
    <b>${message.tag}</b>
    <strong>${message.authorName}</strong>
    <div>
        <#if message.filename??>
            <img src="/img/${message.filename}">
        </#if>
    </div>
</div>
<#else>
No messages
</#list>

</@c.page>