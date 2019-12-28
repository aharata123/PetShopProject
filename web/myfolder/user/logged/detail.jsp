
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="viewModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Detail</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <table>
                    <thead>
                    </thead>
                    <tbody class="table">
                        <tr>
                            <td>Accessory Name </td>
                            <td>Price </td>
                            <td>Quantity </td>
                            <td>Image</td>
                            <td>Total </td>

                        </tr>
                        <c:forEach items="${requestScope.LIST}" var="item">
                            <tr>
                                <td>${item.dto.name} </td>
                                <td>${item.dto.price} VNĐ </td>
                                <td>${item.quantity} </td>
                                 <td class="column1"><img src="/project/images/${item.dto.image}" width="100" height="100">   </td>
                                 <td> ${priceTotal + (item.dto.price * item.quantity)} VNĐ</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
