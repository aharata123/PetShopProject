    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar" data-color="white" data-active-color="danger">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          <div class="logo-image-small">
              <img src="<c:url value='/myfolder/admin/assets/img/logo-small.png' />">
          </div>
        </a>
        <a href="#" class="simple-text logo-normal">
            ${sessionScope.ADMIN.firstName}
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
              <a href="AdminController?action=Dashboard">
              <i class="nc-icon nc-bank"></i>
              <p>Home</p>
            </a>
          </li>
         
          <li>
            <a href="AdminController?action=SearchUser&&txtSearch=">
              <i class="nc-icon nc-single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li>
              <a href="AdminController?action=Search&&txtSearch=">
              <i class="nc-icon nc-tile-56"></i>
              <p>Accessories</p>
            </a>
          </li>
    
        </ul>
      </div>
    </div>
