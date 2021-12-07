<#macro login path isRegisterForm>
<form action="${path}"  method="post" xmlns="http://www.w3.org/1999/html">
    <div class="row g-3 align-items-center">
        <label class="col-form-label"> User name: </label>
        <div class="col-auto">
            <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(userError??)?string('is-invalid', '')}"/>
            <#if userError??>
                <div class="invalid-feedback">
                    <#list userError as key, value>
                        <#if value?contains("user")>${value}</#if>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <label class="col-form-label"> Password: </label>
        <div class="col-auto">
            <input type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    <#list passwordError as key, value>
                        <#if value?contains("password")>${value}</#if>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>
    <div class="row g-3 align-items-center">
        <label class="col-form-label"> Retype password: </label>
        <div class="col-auto">
            <input type="password" name="password2"
                   class="form-control ${(password2Error??)?string('is-invalid', '')}"/>
            <#if password2Error??>
                <div class="invalid-feedback">
                    <#list passwordError as key, value>
                        <#if value?contains("password")>${value}</#if>
                    </#list>
                </div>
            </#if>
        </div>
    </div>

    <div class="row g-3 align-items-center">
        <label class="col-form-label"> Email: </label>
        <div class="col-auto">
            <input type="email" name="userMail" value="<#if user??>${user.userMail}</#if>"
                   class="form-control ${(emailError??)?string('is-invalid', '')}"/>
            <#if emailError??>
                <div class="invalid-feedback">
                    <#list emailError as key, value>
                        <#if value?contains("email")>${value}</#if>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
    </#if>
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
        <form action="/logout" method="post">
            <button class="btn btn-primary" type="submit">Sign Out</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
</#macro>