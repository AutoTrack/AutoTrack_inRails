
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
* [Request all Business Users](#request-all-business-users)
`GET 'business_user/index'`
* [Register A New Business](#register-a-new-business)
`POST 'business_user/register'`
* [Login A Business](#login-a-business)
`POST 'business_user/login'`

### **Employee User**
* [Request All Employee Users](#request-all-employee-users)
`GET 'employee_user/index'`
* [Register A Super Employee](#register-a-super-employee)
`POST 'employee_user/sregister'`
* [Register A New Employee](#register-a-new-employee)
`POST 'employee_user/register'`
* [Login A Employee](#login-a-employee)
`POST 'employee_user/login'`
* [Login A Employee With Pin](#login-a-employee-with-pin)
`POST 'employee_user/pin_login'`

### **Clients**
* [Request all Clients](#request-all-clients)
`GET '/clients'`
* [Create Clients](#create-clients)
`POST '/clients'`
* [Show a Client](#show-a-client)
`GET '/client/:id'`
* [Update a Client](#update-a-client)
`PATCH '/client/:id'`
* [Delete a Client](#delete-a-client)
`DELETE '/client/:id'`




### **Request all Business Users**

`GET 'business_user/index'`

Params:
  * none
  * Returns and array of all business users


Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:
```json
{
  "business_user": [
    {
      "id": 1,
      "business_user_email": "autotrak1@autotrak.com",
      "business_user_password": "350c7518f320c75a3c12f91030a499fc13676ff4"
    },
    {
      "id": 2,
      "business_user_email": "autotrak2@autotrak.com",
      "business_user_password": "350c7518f320c75a3c12f91030a499fc13676ff5"
    },
    {
      "id": 3,
      "business_user_email": "autotrak3@autotrak.com",
      "business_user_password": "350c7518f320c75a3c12f91030a499fc13676ff6"
    },
    {
      "id": 4,
      "business_user_email": "autotrak4@autotrak.com",
      "business_user_password": "350c7518f320c75a3c12f91030a499fc13676ff7"
    },
    {
      "id": 5,
      "business_user_email": "autotrak5@autotrak.com",
      "business_user_password": "350c7518f320c75a3c12f91030a499fc13676ff8"
    }
  ]
}
```


### **Register A New Business**

`POST 'business_user/register'`

Params:
 * business_user_name:string
 * business_user_email:string
 * business_user_password:string
 * business_user_cap:integer
 * business_user_street:string
 * business_user_city:string
 * business_user_state:string
 * business_user_zipcode:string
 * business_logo_url:string

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
  * business_user_email:string
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



### **Request All Employee Users**

`GET 'employee_user/index'`

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
  * employee_access_rights:string
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
    "employee_access_rights": level1,
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
  * employee_access_rights:string
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
    "employee_access_rights": level3,
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


### **Request all Clients**

`GET '/clients'`

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
    }
  ]
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
  "client": {
    "id": 3,
    "client_first_name": null,
    "client_last_name": null,
    "client_street_address": null,
    "client_city": null,
    "client_state": null,
    "client_zipcode": null,
    "client_primary_phone": null,
    "client_secondary_phone": null,
    "client_email": null,
    "created_at": "2015-07-08T23:23:51.272Z",
    "updated_at": "2015-07-08T23:23:51.272Z",
    "business_user_id": null
  }
}
```


#Inventory Items
##Reques all Inventory Items

Path: GET '/inventory_items'
Params: none
Status: 200 OK
Response:
```{
  "inv_item": [
    {
      "id": 2,
      "business_user_id": 1,
      "part_number": "1234567",
      "business_part_number": "24234762873468237",
      "category": "Motor",
      "inventory_item_location": "Hall 10",
      "inventory_item_supplier": "Distributor Inc",
      "reorder_alert": 3,
      "order_to_quantity": 10,
      "inventory_item_billable": true,
      "inventory_item_taxable": false,
      "inventory_item_cost": 12,
      "inventory_item_markup": 10,
      "inventory_count": 20,
      "created_at": "2015-07-09T11:59:41.669Z",
      "updated_at": "2015-07-09T11:59:41.669Z",
      "tool": false
    },
    {
      "id": 3,
      "business_user_id": 1,
      "part_number": "29874327",
      "business_part_number": "234872kjj243423",
      "category": "Transmission",
      "inventory_item_location": "Shelf 20, Bottom",
      "inventory_item_supplier": "Amazon Inc",
      "reorder_alert": 30,
      "order_to_quantity": 20,
      "inventory_item_billable": false,
      "inventory_item_taxable": false,
      "inventory_item_cost": 50,
      "inventory_item_markup": 6,
      "inventory_count": 10,
      "created_at": "2015-07-09T12:20:31.560Z",
      "updated_at": "2015-07-09T12:20:31.560Z",
      "tool": true
    }
  ]
}```

Path: POST '/inventory_items'
Params: none
Status: 201 Created
Response:
```{
  "inv_item": {
    "id": 14,
    "business_user_id": 1,
    "part_number": "\"234242342\"",
    "business_part_number": "\"2342423423424234\"",
    "category": "\"Sensor\"",
    "inventory_item_location": "\"3rd Hall\"",
    "inventory_item_supplier": "\"eBay\"",
    "reorder_alert": 4,
    "order_to_quantity": 2,
    "inventory_item_billable": true,
    "inventory_item_taxable": false,
    "inventory_item_cost": null,
    "inventory_item_markup": 10,
    "inventory_count": 40,
    "created_at": "2015-07-09T12:39:01.507Z",
    "updated_at": "2015-07-09T12:39:01.507Z",
    "tool": false
  }
}```



Path: GET '/inventory_items/:id'
Params: :id
Status: 200 OK
Response:
```{
  "inv_item": {
    "id": 2,
    "business_user_id": 2,
    "part_number": "1234567",
    "business_part_number": "24234762873468237",
    "category": "Motor",
    "inventory_item_location": "Hall 10",
    "inventory_item_supplier": "Distributor Inc",
    "reorder_alert": 3,
    "order_to_quantity": 10,
    "inventory_item_billable": true,
    "inventory_item_taxable": false,
    "inventory_item_cost": 12,
    "inventory_item_markup": 10,
    "inventory_count": 20,
    "created_at": "2015-07-09T11:59:41.669Z",
    "updated_at": "2015-07-09T11:59:41.669Z",
    "tool": false
  }
}```


Path: PATCH '/inventory_item/:id'
Params: :id
Status: 201 Created
Response:
```{
  "inv_item": {
    "id": 2,
    "business_user_id": 1,
    "part_number": "\"23a23323234\"",
    "business_part_number": "\"2342423423424234\"",
    "category": "\"Sensor\"",
    "inventory_item_location": "\"3rd Hall\"",
    "inventory_item_supplier": "\"eBay\"",
    "reorder_alert": 4,
    "order_to_quantity": 2,
    "inventory_item_billable": true,
    "inventory_item_taxable": false,
    "inventory_item_cost": null,
    "inventory_item_markup": 10,
    "inventory_count": 40,
    "created_at": "2015-07-09T12:29:59.038Z",
    "updated_at": "2015-07-09T13:00:33.532Z",
    "tool": false
  }
}```

Path: DELETE '/inventory_item/:id'
Params: :id
Status: 410 Gone
Response:
```{
  "inv_item": {
    "id": 5,
    "business_user_id": null,
    "part_number": "\"23a23323234\"",
    "business_part_number": "\"2342423423424234\"",
    "category": "\"Sensor\"",
    "inventory_item_location": "\"3rd Hall\"",
    "inventory_item_supplier": "\"eBay\"",
    "reorder_alert": 4,
    "order_to_quantity": 2,
    "inventory_item_billable": true,
    "inventory_item_taxable": false,
    "inventory_item_cost": null,
    "inventory_item_markup": 10,
    "inventory_count": 40,
    "created_at": "2015-07-09T12:29:23.836Z",
    "updated_at": "2015-07-09T12:57:50.802Z",
    "tool": false
  }
}```

#Vehicles

Path: GET '/vehicles
Params: none
Status:
Response:

Path: POST '/vehicles'
Params: none
Status:
Response:

Path: GET '/vehicle/:id'
Params: :id
Status:
Response:

Path: PATCH '/vehicle/:id'
Params: :id
Status:
Response:

Path: DELETE '/vehicle/:id'
Params: :id
Status:
Response:

#Repair Order

Path: GET '/repair_orders'
Params: none
Status:
Response:

Path: POST '/repair_orders'
Params: none
Status:
Response:

Path: GET '/repair_order/:id'
Params: :id
Status:
Response:

Path: PATCH '/repair_order/:id'
Params: :id
Status:
Response:

Path: DELETE '/repair_orders/:id'
Params: :id
Status:
Response:
