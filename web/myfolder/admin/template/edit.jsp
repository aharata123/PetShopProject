
                    <div class="modal fade" id="editModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Accessory</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                
                                    <form action="AdminController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="name">Acessory Name</label>
                                            <input type="text" class="form-control" id="name" placeholder="Enter name" name="txtName" required maxlength="50" value="${requestScope.item.name}"> 
                                        </div>
                                        <div class="form-group">
                                            <label for="price"></span>Price</label>
                                            <input type="number" class="form-control" id="price" placeholder="Enter price" name="txtPrice" required min="0" value="${requestScope.item.price}" step="1000">
                                        </div>
                                        <div class="form-group">
                                            <label for="des"></span>Description</label>
                                            <input type="text" class="form-control" id="des" placeholder="Enter description" name="txtDescription" required maxlength="50" value="${requestScope.item.description}">
                                        </div>
                                         <div class="form-group">
                                            <label for="quantity"></span>Quantity</label>
                                            <input type="number" class="form-control" id="quantity" placeholder="Enter quantity" name="txtQuantity" required min="0" value="${requestScope.item.quantity}">
                                        </div>
                                        <div class="form-group">
                                            <label for="img"></span>Image </label>
                                        </div>
                                        <input type="file" class="form-control" id="img" name="img" accept="image/*">

                                        <button type="submit" class="btn btn-default btn-success btn-block">Update</button>
                                        <input type="hidden" name="action" value="Update"/>
                                        <input type="hidden" name="updateID" value="${requestScope.item.accessoryID}"/>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
