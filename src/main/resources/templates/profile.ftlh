<#import "parts/common.ftlh" as c>

<@c.page>
<h5>${username}</h5>
${message?ifExists}
<form method="post" xmlns="http://www.w3.org/1999/html">
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
    <div class="row g-3 align-items-center">
        <label class="col-form-label"> Email: </label>
        <div class="col-auto">
            <input type="email" name="email" class="form-control" value="${email!''}"/>
        </div>
    </div>
<input type="hidden" name="_csrf" value="${_csrf.token}"/>
<button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>