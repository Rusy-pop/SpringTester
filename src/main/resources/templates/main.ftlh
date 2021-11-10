<#import "parts/common.ftlh" as c>

<@c.page>

<div class="mb-3">
    <form method="post" action="filter">
        <input type="text" name="filter" value="${filter?ifExists}">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Найти</button>
    </form>
</div>


<div>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="Введите текст">
        <input type="tag" name="tag" placeholder="Тег">
        <input type="file" name="file">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Добавить</button>
    </form>
</div>



<div >
    <#list messages as message>
    <#if message.filename??>
    <div class="card text-white bg-dark mb-3" style="max-width: 20rem;">
        <div class="card-body">
            <span class="card-text">${message.text}</span>
            <b class="card-subtitle">${message.tag}</b>
            <strong class="card-title">${message.authorName}</strong>
        </div>
        <img src="/img/${message.filename}">
    </div >
        <#if message.text??>
        <div class="card text-white bg-dark mb-3" style="max-width: 20rem;">
            <span class="card-text">${message.text}</span>
            <b class="card-subtitle">${message.tag}</b>
            <strong class="card-title">${message.authorName}</strong>
        </div>
        <#else>
        <div class="card text-white bg-dark mb-3" style="max-width: 20rem;">No messages</div>
        </#if>
    </#if>
    </#list>
</div>

</@c.page>