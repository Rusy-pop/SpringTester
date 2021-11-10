<#macro login path isRegisterForm>
<form action="${path}" , method="post" xmlns="http://www.w3.org/1999/html">
    <div class="row g-3 align-items-center">
        <label class="col-form-label"> User name: </label>
        <div class="col-auto">
            <input type="text" name="username" class="form-control"/>
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <label class="col-form-label"> Password: </label>
        <div class="col-auto">
            <input type="password" name="password" class="form-control"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="mt-1">
    <#if !isRegisterForm>
        <a href="/registration">Add new user</a>
    </#if>
    <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign in</#if></button>
    </div>
</form>
</#macro>

<#macro logout>
    <div>
        <form action="/logout", method="post">
            <button class="btn btn-primary" type="submit">Sign Out</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
</#macro>