$(function(){
	// solving the active menu problem
	switch(menu) {
	  
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Services':
		$('#services').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'Machining':
		$('#machining').addClass('active');
		break;
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
		default:
			if(menu == "Home") break;
			$('#listProducts').addClass('active');
		    $('#a_'+menu).addClass('active');
		break;
	
	}
	//kaizen
	// code for jquery dataTable
	
	var jsonUrl = '';
	   if(window.categoryId == ''){
		   jsonUrl = window.contextRoot + '/json/data/all/products';
	   }
	   else{
		   jsonUrl = window.contextRoot + '/json/data/category/'+ window.categoryId+'/products';
	   }
	   
	var $table = $('#productListTable');
	
	  // execute the below code only when we have this table
	if($table.length){
		//console.log('inside the table');
		
		$table.DataTable( {
			
			aLengthMenu: [[3,5,10,-1], ['3 Records','5 Records', '10 Records', 'All']],
			pageLength: 5,
			
			ajax: {
	        	url: jsonUrl,
	        	dataSrc: ''
	        },
	        columns: [
	                  {
	                	data: 'code',
	                	bSortable: false,
	                	mRender: function(data, type,row){
	                		return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="dataTableImg"/>';  
	                	}
	                  },
	                  {
	                	  data: 'name'
	                  },
	                  {
	                	  data: 'material'
	                  },
	                  {
	                	  data: 'id',
	                	  bSortable: false,
	                	  mRender: function(data, type, row){
	                		  
	                		  var str = '';
	                		  str += '<a href="'+window.contextRoot+ '/show/'+data+'/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></a>';
	                		  
	                	  return str;
	                	  }
	                  }
	                  
	                  ]
		});
		
		
	}
	
	// dismissing the alert after 3 second
	var $alert = $('.alert');
	
	if($alert.length){
		
		setTimeout(function(){
			$alert.fadeOut('slow');
		} , 3000)
	}
	
	//--------------------------------------
	
	
	
	//--------------------------------
	// data table for admin
	//--------------------------------
	     
	var $adminProductsTable = $('#adminProductsTable');
	
	  // execute the below code only when we have this table
	if($adminProductsTable.length){
		//console.log('inside the table!');
	
		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
		
		$adminProductsTable.DataTable( {
			
			aLengthMenu: [[10,30,50,-1], ['10 Records','30 Records', '50 Records', 'All']],
			pageLength: 30,
			
			ajax: {
	        	url: jsonUrl,
	        	dataSrc: ''
	        },
	        columns: [
	                  {
	                	  data:'id'
	                  },
	                  {
	                	data: 'code',
	                	bSortable: false,
	                	mRender: function(data, type,row){
	                		return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="adminDataTableImg"/>';  
	                	}
	                  },
	                  {
	                	  data: 'name'
	                  },
	                  {
	                	  data: 'material'
	                  },
	                  {
	                	  data: 'active',
	                	  bSortable: false,
	                	  mRender: function(data, type, row){
	                		  
	                		  var str = '';
	                		  
	                		  str += '<label class="switch">';
	                		if(data){
	                		  str += '<input type="checkbox" checked="checked" value="'+row.id+'" />';
	                		}
	                		else{
	                			str += '<input type="checkbox"  value="'+row.id+'" />';
	                		}
	                		 
	                		str += '<div class="slider"></div></label>';
	                		  
	                	  return str;
	                	  }
	                  },
	                  {
	                	  data: 'id',
	                	  bSortable: false,
	                	  mRender: function(data, type,row){
	                		  
	                		  var str = '';
	                		  
	                		  str += '<a href="${contextRoot}/manage/'+data+'/product" class="btn btn-warning">';
	                		  str += '<span class="glyphicon glyphicon-pencil"></span></a>';
	                		  
	                		  return str;
	                	  }
	                  }
	                  
	                  ],
	                  
	                  initComplete: function(){
	                	  
	                	  var api = this.api();
	                	  api.$('.switch input[type="checkbox"]').on('change',function(){
	                			
	                			var checkbox = $(this);
	                			var checked = checkbox.prop('checked');
	                			var dMsg = (checked)? 'You want to activate the product?':
	                	                              'You want to deactivate the product?';
	                			var value = checkbox.prop('value');
	                			
	                			bootbox.confirm({
	                				size: 'medium',
	                				title: 'Product Activation & Deactivation',
	                				message: dMsg,
	                				callback: function(confirmed){
	                					
	                					if(confirmed){
	                						
	                						console.log(value);
	                						
	                						 var activationUrl = window.contextRoot + '/manage/product/' + value +'/activation';
	       		      					  
	       		      					  $.post(activationUrl, function(data){
	                						
	                						bootbox.alert({
	                							size:'medium',
	                							title:'Information',
	                							message:data
	                						});
	       		      					});
	                					}
	                					else{
	                						checkbox.prop('checked',!checked);
	                					}
	                				}
	                				
	                			});	
	                		});
	                	  }
	                	
		});
			
	}
	
	//--------------------------------
	// validation code for category
	
	var $categoryForm = $('#categoryForm');
	
	if($categoryForm.length){
		
		$categoryForm.validate({
			
			rules : {
				
				name : {
					
					required: true,
					minlength: 2
					
				},
				
				description: {
					required: true
				}
			},
			
			messages : {
				
				name: {
					required: 'Please add the category name!',
					minlength: 'The category name should not be less than 2 characters'
				},
				description : {
					required: 'Please add a description for this category!'
					
				}
			}, 
			
			errorElement: 'em',
			errorPlacement: function(error, element){
				// add the class of help-block
				error.addClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);
			}
			
		});
		
	}
	//------------------------
	
});