

# **Welcome to AutoTrak API Documantation**
* Ruby version
__ruby 2.1.5p273__

* Introduction
* API Documantation
** Client
** Inventory Items
** Vehicles
** Repair Orders

## Introduction

AutoTrak is currently being developed by two Rails Engineers: https://github.com/juanr2001 and pwood1284.
Indeed, with our Front-End Engineer(https://github.com/mmarcinek) this app has a responsive and amazing web-design.


### **Base URL: https://rocky-hollows-1826.herokuapp.com**


### **Business User**

* [Register A New Business](#register-a-new-business)
`POST 'business_user/register'`
* [Login A Business](#login-a-business)
`POST 'business_user/login'`

### **Employee User**

* [Request All Employees By Business](#request-all-employees-by-business)
`GET 'employee_user/business_index'`
* [Register A Super Employee](#register-a-super-employee)
`POST 'employee_user/sregister'`
* [Register A New Employee](#register-a-new-employee)
`POST 'employee_user/register'`
* [Login A Employee](#login-a-employee)
`POST 'employee_user/login'`
* [Login A Employee With Pin](#login-a-employee-with-pin)
`POST 'employee_user/pin_login'`
* [Update Employee Information](#update-employee-information)
`PATCH 'employee_user/update/:id'`
* [Delete Employee Information](#delete-employee-information)
`DELETE 'employee_user/delete/:id'`
* [Show Employee Information](#show-employee-information)
`GET 'employee_user/show/:id'`


### **Clients**
* [Request all Clients By Business](#request-all-clients-by-business)
`GET '/clients/business_user'`
* [Request all Clients By Employee](#request-all-clients-by-employee)
`GET '/clients/employee_user/:id'`
* [Create Clients](#create-clients)
`POST '/clients'`
* [Show a Client](#show-a-client)
`GET '/client/:id'`
* [Update a Client](#update-a-client)
`PATCH '/client/:id'`
* [Delete a Client](#delete-a-client)
`DELETE '/client/:id'`

### **Repair Orders**
* [Request All Repair Orders](#request-all-repair-orders)
`GET '/repair_orders'`
* [Request All Repair Orders For A Business](#request-all-repair-orders-for-a-business)
`GET 'repair_orders/business_user'`
* [Request All Repair Orders For A Employee](#request-all-repair-orders-for-a-employee)
`'repair_orders/employee_user/:id'`
* [Create A Repair Order Number](#create-a-repair-order-number)
`POST 'repair_order'`
* [Attach Employee To Repair Order](#attach-employee-to-repair-order)
`POST` 'employee_users_repair_order/attach_employee'`
* [Repair Order Employees Show](#repair-order-employees-show)
`GET` 'employee_users_repair_order/show_employees/:id'`
* [Show A Repair Order](#show-a-repair-order)
`GET 'repair_order/:id'`
* [Update A Repair Order](#update-a-repair-order)
`PATCH 'repair_order/:id'`
* [Delete A Repair Order](#show-a-repair-order)
`DELETE 'repair_order/:id'`

### **Repair Items**
* [Show Repair Item](#show-repair-item)
`GET 'repair_item/:id'`
* [Show Repair Items](#show-repair-items)
`GET 'repair_items/:id'`
* [Add Repair Item](#add-repair-item)
`POST 'repair_item/:id'`
* [Add Repair Item Quantity](#add-repair-item-quantity)
`POST '/repair_item/quantity'`
* [Remove Repair Item](#remove-repair-item)
`DELETE 'repair_item/:id'`
* [Update Repair Item Quantity](#update-repair-item-quantity)
`PATCH 'repair_item/quantity'`
* [Checkout Repair Items](#check-out-repair-items)
`PATCH 'repair_items/checkout'`




### **Vehicles**
* [Request All Vehicles By Business](#request-all-vehicles-by-business)
`GET '/vehicles/business_user'`
* [Request All Vehicles By Employee](#request-all-vehicles-by-employee)
`GET '/vehicles/employee_user/:id'`
* [Create A Vehicle](#create-a-vehicle)
`POST 'vehicle/'`
* [Show Vehicle](#show-vehicle)
`GET 'vehicle/:id'`
* [Update Vehicle](#update-vehicle)
`PATCH 'vehicle/:id'`
* [Delete Vehicle](#delete-vehicle)
`DELETE 'vehicle/:id'`

### **InventoryItems**
* [Request All Inventory Items By Business](#request-all-inventory-items-by-business)
`GET '/inventory_items/business_user'`
* [Create Inventory Item](#create-inventory-item)
`POST '/inventory_items'`
* [Show Inventory Item](#show-inventory-item)
`GET '/inventory_item/:id'`
* [Update Inventory Item](#update-inventory-item)
`PATCH '/inventory_item/:id'`
* [Delete Inventory Item](#delete-inventory-item)
`DELETE '/inventory_item/:id'`


### **Register A New Business**

`POST 'business_user/register'`

Params:
 * business_username:sting
 * business_user_name:string
 * business_user_password:string
 * business_user_email:string
 * business_user_street:string
 * business_user_city:string
 * business_user_state:string
 * business_user_zipcode:string
 * business_logo_url:string
 * business_user_cap:integer
 * logo_file_name:string
 * logo_content_type:string
 * logo_file_size:string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "business_user": {
    "id": 47,
    "business_user_name": "AutoPlace30",
    "business_user_email": "autotrak20302@autotrak.com",
    "business_user_password": "91e16309f3078ebf9c02c0be641bdecd4f45bc55",
    "business_user_cap": 25,
    "business_user_street": "123 Main Street",
    "business_user_city": "Anywhere",
    "business_user_state": "GA",
    "business_user_zipcode": "30001",
    "business_logo_url": "www.google.com",
    "created_at": "2015-07-09T15:48:15.963Z",
    "updated_at": "2015-07-09T15:48:15.963Z",
    "access_token": "48bba144b206df3d5d0f296a66557687"
  }
}
```


### **Login A Business**

`POST 'business_user/login'`

Params:
  * business_username:string
  * business_user_password:string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "business_user": {
    "id": 43,
    "business_user_name": "AutoPlace30",
    "business_user_email": "autotrak2030@autotrak.com",
    "business_user_password": "c8cb9726c77f6c4e2db6fb1dda065b81e7c0e758",
    "business_user_cap": 25,
    "business_user_street": "123 Main Street",
    "business_user_city": "Anywhere",
    "business_user_state": "GA",
    "business_user_zipcode": "30001",
    "business_logo_url": "www.google.com",
    "created_at": "2015-07-09T10:56:17.310Z",
    "updated_at": "2015-07-09T10:56:17.310Z",
    "access_token": "88d6b5b3681aeb37d73da794002asfas"
  }
}
```


### **Request All Employees By Business**

`GET 'employee_user/business_index'`

Params:
  * none
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "id": 1,
      "employee_first_name": "Philip",
      "employee_last_name": "Marcinek",
      "employee_email": pmarcinek@autotrak.com,
      "employee_number": 34526
    },
    {
      "id": 2,
      "employee_first_name": "Mike",
      "employee_last_name": "Ordaz",
      "employee_email": mordaz@autotrak.com,
      "employee_number": 34525
    },
    {
      "id": 3,
      "employee_first_name": "Mike",
      "employee_last_name": "Wood",
      "employee_email": mwood@autotrak.com,
      "employee_number": 34524
    },
    {
      "id": 4,
      "employee_first_name": "Phil",
      "employee_last_name": "Ordaz",
      "employee_email": pordaz@autotrak.com,
      "employee_number": 34523
    },
    {
      "id": 5,
      "employee_first_name": "Juan",
      "employee_last_name": "Wood",
      "employee_email": jwood@autotrak.com,
      "employee_number": 34522
  }
 ]
}
```



### **Register A Super Employee**

`POST 'employee_user/sregister'`

Params:
  * employee_first_name:string
  * employee_last_name:string
  * employee_email:string
  * employee_password:string
  * employee_pin:string
  * role:string
  * employee_number:string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "employee_user": {
    "id": 52,
    "business_user_id": 46,
    "employee_first_name": "Philip",
    "employee_last_name": "Wood",
    "employee_email": "ppwood1204@gmail.com",
    "employee_password": "08cb824ba9ea8d8fe48f161b263cb68c36c712ed",
    "employee_pin": "1234",
    "role": level1,
    "created_at": "2015-07-09T15:53:14.610Z",
    "updated_at": "2015-07-09T15:53:14.610Z",
    "super_user": false,
    "access_token2": "3bbce7fc0e864169cfcb87e476067786",
    "employee_number": 46576
  }
}
```




### **Register A New Employee**

`POST 'employee_user/register'`

Params:
  * employee_first_name:string
  * employee_last_name:string
  * employee_email:string
  * employee_password:string
  * employee_pin:string
  * role:string
  * employee_number:string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": {
    "id": 41,
    "business_user_id": null,
    "employee_first_name": "Philip",
    "employee_last_name": "Wood",
    "employee_email": "pwood2098@gmail.com",
    "employee_password": "8a483dda053b68d3aeef878a3dd64dc2e04516f5",
    "employee_pin": "9930",
    "role": level3,
    "created_at": "2015-07-09T13:42:52.782Z",
    "updated_at": "2015-07-09T13:42:52.782Z",
    "super_user": false,
    "access_token2": "80fd2a2eb354b9d6810a396c6dde3454",
    "employee_number": 23423
  }
}
```


### **Login A Employee**

POST 'employee_user/login'

Params:
  * employee_email:string
  * employee_password:string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": {
    "id": 39,
    "business_user_id": 23,
    "employee_first_name": "Juan",
    "employee_last_name": "Marcinek",
    "employee_email": "jmarcinek2035@autotrak.com",
    "employee_password": "5d33b937a88b4fd6e610002425a3665550569ff3",
    "employee_pin": "9940",
    "employee_access_rights": level3,
    "created_at": "2015-07-09T11:24:55.023Z",
    "updated_at": "2015-07-09T11:24:55.023Z",
    "super_user": false,
    "access_token2": "570e68ad88a56d945aa1c4b9ea734543",
    "employee_number": "23432"
  }
}
```


### **Login A Employee With Pin**

POST 'employee_user/pin_login'

Params:
  * employee_pin:string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": {
    "id": 38,
    "business_user_id": 23,
    "employee_first_name": "Philip",
    "employee_last_name": "Wood",
    "employee_email": "pwood2033@autotrak.com",
    "employee_password": "4a689a40d5bee07f18896136ff6e1b803da58b61",
    "employee_pin": "9940",
    "employee_access_rights": level3,
    "created_at": "2015-07-09T11:22:40.964Z",
    "updated_at": "2015-07-09T11:22:40.964Z",
    "super_user": false,
    "access_token2": "baa413a0d6b4f84e7d2f19e0add3sdfa",
    "employee_number": 23433
  }
}
```



### **Request all Clients By Business**

`GET '/clients/business_user'`

Params:
  * none

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "client": [
    {
      "id": 7,
      "client_first_name": "Tom",
      "client_last_name": "Jackson",
      "client_street_address": "123 Long Street",
      "client_city": "Atlanta",
      "client_state": "Georgia",
      "client_zipcode": "30303",
      "client_primary_phone": 555-345-2345,
      "client_secondary_phone": 555-678-4856,
      "client_email": tjackson@blah.com,
      "created_at": "2015-07-14T21:10:23.327Z",
      "updated_at": "2015-07-14T21:10:23.327Z",
      "business_user_id": 50
    },
    {
      "id": 8,
      "client_first_name": "Harry",
      "client_last_name": "Jenkins",
      "client_street_address": "123 Main Street",
      "client_city": "Roswell",
      "client_state": "Georgia",
      "client_zipcode": "30005",
      "client_primary_phone": 555-364-4658,
      "client_secondary_phone": 555-345-5667,
      "client_email": hjenkins@blah.com,
      "created_at": "2015-07-14T21:15:55.928Z",
      "updated_at": "2015-07-14T21:15:55.928Z",
      "business_user_id": 50
    }
  ]
}
```

### **Request all Clients By Employee**

`GET '/clients/employee_user/:id'`

Params:
  * none

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "client": [
    {
      "id": 1,
      "client_first_name": "Juan",
      "client_last_name": "Woods",
      "client_street_address": "2210 Street Road",
      "client_city": "New York",
      "client_state": null,
      "client_zipcode": "20394",
      "client_primary_phone": "123-123-2123",
      "client_secondary_phone": "324-234-3234",
      "client_email": "juan_woods@yahoo.com",
      "created_at": "2015-07-08T23:09:38.000Z",
      "updated_at": "2015-07-08T23:09:38.000Z",
      "business_user_id": 1
    },
    {
      "id": 2,
      "client_first_name": "John",
      "client_last_name": "Madera",
      "client_street_address": "2200 Working Road",
      "client_city": "Mars",
      "client_state": "Pluto",
      "client_zipcode": "20394",
      "client_primary_phone": "123-123-2123",
      "client_secondary_phone": "324-234-3234",
      "client_email": "juan_woods@yahoo.com",
      "created_at": "2015-07-08T23:09:38.000Z",
      "updated_at": "2015-07-08T23:09:38.000Z",
      "business_user_id": 1
    }
  ]
}
```
### **Create Clients**

`POST '/clients'`

Params:
  * client_first_name:string
  * client_last_name:string
  * client_street_address:string
  * client_city:string
  * client_state:string
  * client_zipcode
  * client_primary_phone:string
  * client_secondary_phone:string
  * client_email:string


Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "client": {
    "id": 9,
    "client_first_name": "Jimmy",
    "client_last_name": "Page",
    "client_street_address": "123 Hello Street",
    "client_city": "Cape Coral",
    "client_state": "Florid",
    "client_zipcode": "23423",
    "client_primary_phone": 555-668-5885,
    "client_secondary_phone": 555-455-7567,
    "client_email": jpage@blah.com,
    "created_at": "2015-07-16T13:20:38.694Z",
    "updated_at": "2015-07-16T13:20:38.694Z",
    "business_user_id": 50
  }
}
```

### **Show a Client**

`GET '/client/:id'`

Params:
  * :id

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "client": {
    "id": 9,
    "client_first_name": "Jimmy",
    "client_last_name": "Page",
    "client_street_address": "123 Hello Street",
    "client_city": "Cape Coral",
    "client_state": "Florid",
    "client_zipcode": "23423",
    "client_primary_phone": 555-668-5885,
    "client_secondary_phone": 555-455-7567,
    "client_email": jpage@blah.com,
    "created_at": "2015-07-16T13:20:38.694Z",
    "updated_at": "2015-07-16T13:20:38.694Z",
    "business_user_id": 50
  }
}
```

### **Update a Client**

`PATCH '/client/:id'`

Params:
  * id

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "client": {
    "id": 1,
    "client_first_name": "Micha",
    "client_last_name": "Vela",
    "client_street_address": "5030 Albaro Uribe Road",
    "client_city": "San Pancho",
    "client_state": "Guadalajara",
    "client_zipcode": "12345",
    "client_primary_phone": "123-123-1212",
    "client_secondary_phone": "123-122-1322",
    "client_email": "micha@yahoo.com",
    "created_at": "2015-07-08T23:09:38.000Z",
    "updated_at": "2015-07-08T23:31:10.652Z",
    "business_user_id": 1
  }
}
```


### **Delete a Client**

`DELETE '/client/:id'`

Params:
  * id

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "message": "Client id: 8 has been removed from inventory"
}
```


### **Request All Repair Orders For A Business**

`GET 'repair_orders/business_user'`

Params:
  * none
  * Returns array of all repair orders for the currently logged in business user.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
      "id": 23,
      "business_user_id": 52,
      "employee_user_id": null,
      "client_id": null,
      "repair_order_number": "555557",
      "vehicle_id": null,
      "repair_type_id": null,
      "repair_status": false,
      "created_at": "2015-07-12T21:13:51.668Z",
      "updated_at": "2015-07-12T21:13:51.668Z",
      "employee_users_repair_order_id": null
    },
    {
      "id": 24,
      "business_user_id": 52,
      "employee_user_id": null,
      "client_id": null,
      "repair_order_number": null,
      "vehicle_id": null,
      "repair_type_id": null,
      "repair_status": false,
      "created_at": "2015-07-12T21:15:47.638Z",
      "updated_at": "2015-07-12T21:15:47.638Z",
      "employee_users_repair_order_id": null
    }
```


### **Request All Repair Orders For A Employee**

`GET 'repair_orders/employee_user/:id'`

Params:
  * id
  * Returns array of all employee users repair orders.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
      "id": 23,
      "business_user_id": 52,
      "employee_user_id": null,
      "client_id": null,
      "repair_order_number": "555557",
      "vehicle_id": null,
      "repair_type_id": null,
      "repair_status": false,
      "created_at": "2015-07-12T21:13:51.668Z",
      "updated_at": "2015-07-12T21:13:51.668Z",
      "employee_users_repair_order_id": null
    },
    {
      "id": 24,
      "business_user_id": 52,
      "employee_user_id": null,
      "client_id": null,
      "repair_order_number": null,
      "vehicle_id": null,
      "repair_type_id": null,
      "repair_status": false,
      "created_at": "2015-07-12T21:15:47.638Z",
      "updated_at": "2015-07-12T21:15:47.638Z",
      "employee_users_repair_order_id": null
    }
```


### **Create A Repair Order Number**

`POST 'repair_order'`

Params:
  * Repair_order_number:string
  * Create a repair order number

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "repair_order": {
    "id": 54,
    "business_user_id": 50,
    "employee_user_id": null,
    "client_id": null,
    "repair_order_number": null,
    "vehicle_id": null,
    "repair_type_id": null,
    "repair_status": false,
    "created_at": "2015-07-17T02:04:32.213Z",
    "updated_at": "2015-07-17T02:04:32.213Z",
    "employee_users_repair_order_id": null
  }
}
```


### **Attach Employee To Repair Order**

`POST` 'employee_users_repair_order/attach_employee'`

Params:
  * none
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "id": 1,
      "employee_first_name": "Philip",
      "employee_last_name": "Marcinek",
      "employee_email": pmarcinek@autotrak.com,
      "employee_number": 34526
    },
    {
      "id": 5,
      "employee_first_name": "Juan",
      "employee_last_name": "Wood",
      "employee_email": jwood@autotrak.com,
      "employee_number": 34522
  }
 ]
}
```


### **Repair Order Employees Show**

`GET` 'employee_users_repair_order/show_employees/:id'`

Params:
  * none
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "id": 1,
      "employee_first_name": "Philip",
      "employee_last_name": "Marcinek",
      "employee_email": pmarcinek@autotrak.com,
      "employee_number": 34526
    },
    {
      "id": 5,
      "employee_first_name": "Juan",
      "employee_last_name": "Wood",
      "employee_email": jwood@autotrak.com,
      "employee_number": 34522
  }
 ]
}
```


### **Show A Repair Order**

`GET 'repair_order/:id'`

Params:
  * id
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "id": 1,
      "employee_first_name": "Philip",
      "employee_last_name": "Marcinek",
      "employee_email": pmarcinek@autotrak.com,
      "employee_number": 34526
    },
    {
      "id": 5,
      "employee_first_name": "Juan",
      "employee_last_name": "Wood",
      "employee_email": jwood@autotrak.com,
      "employee_number": 34522
  }
 ]
}
```


### **Update A Repair Order**

`PATCH 'repair_order/:id'`

Params:
  * none
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "id": 1,
      "employee_first_name": "Philip",
      "employee_last_name": "Marcinek",
      "employee_email": pmarcinek@autotrak.com,
      "employee_number": 34526
    },
    {
      "id": 5,
      "employee_first_name": "Juan",
      "employee_last_name": "Wood",
      "employee_email": jwood@autotrak.com,
      "employee_number": 34522
  }
 ]
}
```


### **Delete A Repair Order**

`DELETE 'repair_order/:id'`

Params:
  * none
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "Repair Order 1 has been removed from the database"
    }
 ]
}
```


### **Show Repair Item**

`GET 'repair_item/:id'`


### **Show Repair Items**

`GET 'repair_items/:id'`


### **Add Repair Item**

`POST 'repair_item/:id'`


### **Add Repair Item Quantity**

`POST '/repair_item/quantity'`

### **Remove Repair Item**

`DELETE 'repair_item/:id'`


### **Update Repair Item Quantity**

`PATCH 'repair_item/quantity'`


### **Checkout Repair Items**

`PATCH 'repair_items/checkout'`


### **Request All Vehicles By Business**

`GET '/vehicles/business_user'`

Params:
  * Returns array of all vehicles associated with a business.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "vehicle": [
    {
      "id": 20,
      "client_id": 10,
      "vehicle_type": "Acura",
      "vehicle_year": "2010",
      "vehicle_model": "Integra",
      "vehicle_vin_number": "kjsdaflajsg34rt34",
      "vehicle_color": "gray",
      "vehicle_liscense_plate": "2334effds",
      "vehicle_comment": "Scrap on hood",
      "created_at": "2015-07-17T23:49:18.648Z",
      "updated_at": "2015-07-17T23:49:18.648Z",
      "invoice_id": null,
      "business_user_id": 50,
      "vehicle_sub_model": "lx",
      "repair_order_id": null
    }
  ]
}
```


### **Request All Vehicles By Employee**

`GET '/vehicles/employee_user/:id'`

Params:
  * id
  * Returns array of all vehicles assigned to employee.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "employee_user": [
    {
      "id": 1,
      "employee_first_name": "Philip",
      "employee_last_name": "Marcinek",
      "employee_email": pmarcinek@autotrak.com,
      "employee_number": 34526
    },
    {
      "id": 5,
      "employee_first_name": "Juan",
      "employee_last_name": "Wood",
      "employee_email": jwood@autotrak.com,
      "employee_number": 34522
  }
 ]
}
```


### **Create A Vehicle**

`POST 'vehicles'`

Params:
  * client_id:integer
  * business_user_id:integer
  * vehicle_type:string
  * vehicle_year:string
  * vehicle_model:string
  * vehicle_sub_model:string
  * vehicle_vin_number:string
  * vehicle_color:string
  * vehicle_liscense_plate:string
  * vehicle_comment:text

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "vehicle": {
    "id": 21,
    "client_id": 10,
    "vehicle_type": "Acura",
    "vehicle_year": "2010",
    "vehicle_model": "Integra",
    "vehicle_vin_number": "kjsdaflajsg34rt34",
    "vehicle_color": "gray",
    "vehicle_liscense_plate": "2334effds",
    "vehicle_comment": "Scrap on hood",
    "created_at": "2015-07-17T23:55:00.318Z",
    "updated_at": "2015-07-17T23:55:00.318Z",
    "invoice_id": null,
    "business_user_id": 50,
    "vehicle_sub_model": "lx",
    "repair_order_id": null
  }
}
```


### **Show Vehicle**

`GET 'vehicle/:id'`

Params:
  * id
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "vehicle": {
    "id": 20,
    "client_id": 10,
    "vehicle_type": "Acura",
    "vehicle_year": "2010",
    "vehicle_model": "Integra",
    "vehicle_vin_number": "kjsdaflajsg34rt34",
    "vehicle_color": "gray",
    "vehicle_liscense_plate": "2334effds",
    "vehicle_comment": "Scrap on hood",
    "created_at": "2015-07-17T23:49:18.648Z",
    "updated_at": "2015-07-17T23:49:18.648Z",
    "invoice_id": null,
    "business_user_id": 50,
    "vehicle_sub_model": "lx",
    "repair_order_id": null,
    "client": {
      "id": 10,
      "client_first_name": "Harry",
      "client_last_name": "Henderson",
      "client_street_address": "123 Main St",
      "client_city": "Nowhere",
      "client_state": "Georgia",
      "client_zipcode": "23423",
      "client_primary_phone": null,
      "client_secondary_phone": null,
      "client_email": null,
      "created_at": "2015-07-17T15:08:10.403Z",
      "updated_at": "2015-07-17T15:08:10.403Z",
      "business_user_id": 50
    }
  }
}
```


### **Update Vehicle**

`PATCH 'vehicle/:id'`

Params:
* vehicle_type:string
* vehicle_year:string
* vehicle_model:string
* vehicle_sub_model:string
* vehicle_vin_number:string
* vehicle_color:string
* vehicle_liscense_plate:string
* vehicle_comment:text

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "vehicle": {
    "id": 11,
    "client_id": 7,
    "vehicle_type": "Honda",
    "vehicle_year": "2010",
    "vehicle_model": "Accord",
    "vehicle_vin_number": "234j34k5jkl35lk235lk235jl23",
    "vehicle_color": "purple",
    "vehicle_liscense_plate": "RYDE1",
    "vehicle_comment": "There was a scratch on the bumper",
    "created_at": "2015-07-16T14:55:20.259Z",
    "updated_at": "2015-07-16T14:55:20.259Z",
    "invoice_id": null,
    "business_user_id": null,
    "vehicle_sub_model": "LX",
    "client": {
      "id": 9,
      "client_first_name": "Jimmy",
      "client_last_name": "Page",
      "client_street_address": "123 Hello Street",
      "client_city": "Cape Coral",
      "client_state": "Florida",
      "client_zipcode": "23423",
      "client_primary_phone": 555-668-5885,
      "client_secondary_phone": 555-455-7567,
      "client_email": jpage@blah.com,
      "created_at": "2015-07-16T13:20:38.694Z",
      "updated_at": "2015-07-16T13:20:38.694Z",
      "business_user_id": 50
    }
  }
}
```

### **Delete Vehicle**

`DELETE 'vehicle/:id'`

Params:
  * none
  * Returns array of all employee users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "message": "Vehicle 13 has been removed from client profile"
}
```


### **Request All Inventory Items By Business**

`GET '/inventory_items/business_user'`

Params:
  * id
  * Returns array of all inventory items for a business.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "inv_item": [
    {
      "id": 1,
      "business_user_id": 50,
      "part_number": "bh23456",
      "business_part_number": "xh45679944",
      "category": "Body Materials",
      "inventory_item_location": "A12",
      "inventory_item_supplier": "3M",
      "reorder_alert": 6,
      "order_to_quantity": 12,
      "inventory_item_billable": true,
      "inventory_item_taxable": true,
      "inventory_item_cost": 35.99,
      "inventory_item_markup": 0.25,
      "inventory_count": 6,
      "created_at": "2015-07-16T12:15:01.754Z",
      "updated_at": "2015-07-16T12:15:01.754Z",
      "tool": false,
      "part_name": "Seam Sealer"
    },
    {
      "id": 2,
      "business_user_id": 50,
      "part_number": "bh23457",
      "business_part_number": "xh456799444",
      "category": "Body Materials",
      "inventory_item_location": "A13",
      "inventory_item_supplier": "3M",
      "reorder_alert": 6,
      "order_to_quantity": 12,
      "inventory_item_billable": true,
      "inventory_item_taxable": true,
      "inventory_item_cost": 45.99,
      "inventory_item_markup": 0.25,
      "inventory_count": 6,
      "created_at": "2015-07-16T12:30:19.437Z",
      "updated_at": "2015-07-16T12:30:19.437Z",
      "tool": false,
      "part_name": "Sprayable Seam Sealer"
    }
  ]
}
```


### **Create Inventory Item**

`POST '/inventory_items'`

Params:
  * part_number:string
  * part_name:string
  * business_part_number:string
  * category:string
  * inventory_item_location:string
  * inventory_item_supplier:string
  * reorder_alert:integer
  * order_to_quantity:integer
  * inventory_item_billable:boolean
  * inventory_item_taxable:boolean
  * inventory_item_cost:float
  * inventory_item_markup:float
  * inventory_count:integer
  * tool:boolean


Response:
  Status Code: 201 if successful, 422 if unsuccessful

Response:
```json
  {
  "inv_item": {
    "id": 1,
    "business_user_id": 50,
    "part_number": "bh23456",
    "business_part_number": "xh45679944",
    "category": "Body Materials",
    "inventory_item_location": "A12",
    "inventory_item_supplier": "3M",
    "reorder_alert": 6,
    "order_to_quantity": 12,
    "inventory_item_billable": true,
    "inventory_item_taxable": true,
    "inventory_item_cost": 35.99,
    "inventory_item_markup": 0.25,
    "inventory_count": 6,
    "created_at": "2015-07-16T12:15:01.754Z",
    "updated_at": "2015-07-16T12:15:01.754Z",
    "tool": false,
    "part_name": "Seam Sealer"
  }
}
```


### **Show Inventory Item**

`GET '/inventory_item/:id'`

Params:
  * id
  * Returns inventory item.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "inv_item": {
    "id": 1,
    "business_user_id": 50,
    "part_number": "bh23456",
    "business_part_number": "xh45679944",
    "category": "Body Materials",
    "inventory_item_location": "A12",
    "inventory_item_supplier": "3M",
    "reorder_alert": 6,
    "order_to_quantity": 12,
    "inventory_item_billable": true,
    "inventory_item_taxable": true,
    "inventory_item_cost": 35.99,
    "inventory_item_markup": 0.25,
    "inventory_count": 6,
    "created_at": "2015-07-16T12:15:01.754Z",
    "updated_at": "2015-07-16T12:15:01.754Z",
    "tool": false,
    "part_name": "Seam Sealer"
  }
}
```


### **Update Inventory Item**

`PATCH '/inventory_item/:id'`

Params:
  * id:integer
  * part_number:string
  * part_name:string
  * business_part_number:string
  * category:string
  * inventory_item_location:string
  * inventory_item_supplier:string
  * reorder_alert:integer
  * order_to_quantity:integer
  * inventory_item_billable:boolean
  * inventory_item_taxable:boolean
  * inventory_item_cost:float
  * inventory_item_markup:float
  * inventory_count:integer
  * tool:boolean
  * Returns an update record for an inventory item.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "inv_item": {
    "id": 1,
    "business_user_id": 50,
    "part_number": "bh23457",
    "business_part_number": "xh456799444",
    "category": "Body Materials",
    "inventory_item_location": "A65",
    "inventory_item_supplier": "3M",
    "reorder_alert": 6,
    "order_to_quantity": 12,
    "inventory_item_billable": true,
    "inventory_item_taxable": true,
    "inventory_item_cost": 40.99,
    "inventory_item_markup": 0.25,
    "inventory_count": 6,
    "created_at": "2015-07-16T12:15:01.754Z",
    "updated_at": "2015-07-16T12:36:06.875Z",
    "tool": false,
    "part_name": "Sprayable Seam Sealer"
  }
}
```


### **Delete Inventory Item**

`DELETE '/inventory_item/:id'`


Params:
  * id


Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "message": "Inventory Item Self Etch Primer has been removed from inventory"
}
```
