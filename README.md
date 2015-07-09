# **Zero Issue Game API**
* Ruby version
__ruby 2.1.5p273__

### **Base URL: https://evening-escarpment-7913.herokuapp.com/**


### **User**
* [Get All Users](#get-all-users)
`GET '/users'`
* [Register User](#register-user)
`POST '/users/register'`
* [Login User](#login-user)
`POST '/users/login'`

### **Comics**
* [Get All Comics](#get-all-comics)
`GET '/comics'`
* [Show Comic](#show-comic)
`GET'/comic/title'`
* [Create Comic](#create-comic)
`POST '/comics/create'`
* [Get All Of A Users Comics](#get-all-of-a-users-comics)
`GET 'comics/user'`

### **Photos**
* [Create Photo](#create-photo)
`POST 'photos/create'`
* [Get A Users Photos](#get-a-users-photos)
`GET 'photos/user'`
* [Get A Users Photo](#get-a-users-photo)
`GET 'photo/:id'`
* [Get All Photos From All Users](#get-all-users-photos)
`GET 'photos/users'`


### **Get All Users**

`GET '/users'`

Params:
  * none
  * Returns and array of all users


Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "user": [
    {
      "id": 1,
      "username": "jsmith1234",
      "access_token": "083a050c4b1556c5b8ca68612f2b5c9f",
      "email": "jsmith@tiy.com"
    },
    {
      "id": 2,
      "username": "BJohnson1234",
      "access_token": "c9d85bbde2fde34c1cab0e1995216043",
      "email": "BJohnson@tiy.com"
    },
    {
      "id": 3,
      "username": "TMcGraw1234",
      "access_token": "908ab2d13e18b6d436c2908f83fe9adf",
      "email": "TMcGraw@tiy.com"
    }
  ]
}```
Example failure:
```json
  {"errors": ["errors":["Email has already been taken"]]}
```


### **Register User**

`POST '/users/register'`

Params:
  * username: a string
  * email: a string
  * password: a string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "user": {
    "id": 1,
    "username": "jsmith1234",
    "access_token": "083a050c4b1556c5b8ca68612f2b5c9f",
    "email": "jsmith@tiy.com"
  }
}
```
Example failure:
```json
  {"errors": ["errors":["Email has already been taken"]]}
```


### **Login User**

`POST '/users/login'`

Params:
  * username: a string
  * password: a string

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "user": {
    "id": 3,
    "username": "TMcGraw1234",
    "access_token": "908ab2d13e18b6d436c2908f83fe9adf",
    "email": "TMcGraw@tiy.com"
  }
}
```
Example failure:
```json
{ "message":"Invalid Login" }
```



### **Get All Comics**

`GET 'comics'`

Params:
  * none
* Returns array of comics from all users.

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
[
  {
    "id": 3,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "Last Issue",
      "user_id": 2,
      "created_at": "2015-06-28T10:37:01.485Z",
      "updated_at": "2015-06-28T10:37:01.485Z"
    },
    "creator": {
      "username": "jkrowling1234",
      "email": "jkroweling@tiy.com"
    }
  },
  {
    "id": 2,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "Zero Issue",
      "user_id": 1,
      "created_at": "2015-06-27T23:18:40.137Z",
      "updated_at": "2015-06-27T23:18:40.137Z"
    },
    "creator": {
      "username": "jsmith1234",
      "email": "jsmith@tiy.com"
    }
  },
  {
    "id": 1,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "First Issue",
      "user_id": 1,
      "created_at": "2015-06-27T23:14:48.600Z",
      "updated_at": "2015-06-27T23:14:48.600Z"
    },
    "creator": {
      "username": "jsmith1234",
      "email": "jsmith@tiy.com"
    }
  }
]
```
Example failure:
```json
  {"errors": ["errors":["Error"]]}
```

### **Show Comic**

`GET 'comic/title'`

Params:
  * id
  * Returns the selected comic.


Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "id": 1,
  "comic_info": {
    "comic_url": "www.madeupurl.com",
    "title": "zero issue",
    "user_id": 1,
    "created_at": "2015-06-27T23:14:48.600Z",
    "updated_at": "2015-06-27T23:14:48.600Z"
  },
  "creator": {
    "username": "jsmith1234",
    "email": "jsmith@tiy.com"
  }
}
```
Example failure:
```json
  {"errors": ["errors":["Error when loading comic"]]}
```


### **Create Comic**

POST '/comics/create'

Params:
  * comic_url
  * title

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "id": 4,
  "comic_info": {
    "comic_url": "www.madeupurl.com",
    "title": "First Issue",
    "user_id": 1,
    "created_at": "2015-06-28T11:36:09.556Z",
    "updated_at": "2015-06-28T11:36:09.556Z"
  },
  "creator": {
    "username": "jsmith1234",
    "email": "jsmith@tiy.com"
  }
}
```
Example failure:
```json
{ "message":"Access Token Not Found" }
```



### **Get All Of A User's Comics**

`GET 'comics/user'`

Params:
  * none
  * Retrieves all of a user's comics.



Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
[
  {
    "id": 4,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "First Issue",
      "user_id": 1,
      "created_at": "2015-06-28T11:36:09.556Z",
      "updated_at": "2015-06-28T11:36:09.556Z"
    },
    "creator": {
      "username": "jsmith1234",
      "email": "jsmith@tiy.com"
    }
  },
  {
    "id": 3,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "Last Issue",
      "user_id": 1,
      "created_at": "2015-06-28T10:37:01.485Z",
      "updated_at": "2015-06-28T10:37:01.485Z"
    },
    "creator": {
      "username": "jsmith1234",
      "email": "jsmith@tiy.com"
    }
  },
  {
    "id": 2,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "Second Issue",
      "user_id": 1,
      "created_at": "2015-06-27T23:18:40.137Z",
      "updated_at": "2015-06-27T23:18:40.137Z"
    },
    "creator": {
      "username": "jsmith1234",
      "email": "jsmith@tiy.com"
    }
  },
  {
    "id": 1,
    "comic_info": {
      "comic_url": "www.madeupurl.com",
      "title": "Third Issue",
      "user_id": 1,
      "created_at": "2015-06-27T23:14:48.600Z",
      "updated_at": "2015-06-27T23:14:48.600Z"
    },
    "creator": {
      "username": "jsmith1234",
      "email": "jsmith@tiy.com"
    }
  }
]
```
Example failure:
```json
{ "message":"Access Token Not Found" }
```



### **Create Photo**

`POST 'photos/create'`

Params:
  * image_url:string
  * Removes validated users' post

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "photo_info": {
    "photo": 8,
    "image_url": "www.google.com/image",
    "comic_id": null,
    "user_id": 1
  }
}```
Example failure:
```json
{ "message":"ERROR" }
```


### **Get A User's Photos**

`GET 'photos/user'`

Params:
  * Retrieve photos by user

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
[
  {
    "photo_info": {
      "photo": 8,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 7,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 6,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 2,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  }
]
```
Example failure:
```json
{ "message":"User Does Not Have Any Photos" }
```

### **Get A User's Photo**

`GET 'photo/:id'`

Params:
  * :id
  * Allows user to select a single photo from a user by photo id

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
{
  "photo_info": {
    "photo": 2,
    "image_url": "www.google.com/image",
    "comic_id": null,
    "user_id": 1
  }
}
```
Example failure:
```json
{ "message":"This user does not have any photos." }
```
### **Get All Photos From All Users**

`GET 'photos/users'`

Params:
  * none

Response:
  Status Code: 201 if successful, 422 if unsuccessful

Example success:  
```json
[
  {
    "photo_info": {
      "photo": 8,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 7,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 6,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 5,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 2
    }
  },
  {
    "photo_info": {
      "photo": 4,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 2
    }
  },
  {
    "photo_info": {
      "photo": 3,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 3
    }
  },
  {
    "photo_info": {
      "photo": 2,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 1
    }
  },
  {
    "photo_info": {
      "photo": 1,
      "image_url": "www.google.com/image",
      "comic_id": null,
      "user_id": 2
    }
  }
]
```
Example failure:
```json
{ "message":"No photos exist" }
```




# Welcome to AutoTrak API Documantation

## CONTENT of this FILE

* Introduction
* API Documantation
** Client
** Inventory Items
** Vehicles
** Repair Orders

## Introduction

AutoTrak is currently being developed by two Rails Engineers: https://github.com/juanr2001 and pwood1284.
Indeed, with our Front-End Engineer(https://github.com/mmarcinek) this app has a responsive and amazing web-design.

## Website URL

https://rocky-hollows-1826.herokuapp.com

## API's

# Business User

### Request all Business Users
* Path: GET 'business_user/index'
* Params: none
Status: 200 OK
Response:
```{
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
}```


### Register A New Business & Super User
* Path: POST 'business_user/register'
* Params:
business_user_name:string
business_user_email:string
business_user_password:string
business_user_cap:integer
business_user_street:string
business_user_city:string
business_user_state:string
business_user_zipcode:string
business_logo_url:string
employee_first_name:string
employee_last_name:string
employee_email:string
employee_password:string
employee_pin:string
employee_access_rights:string
employee_number:string

Status: 200 OK
Response:
```{
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
    "access_token": "88d6b5b3681aeb37d73da7940023432432",
    "employee_users": [
      {
        "id": 36,
        "business_user_id": 43,
        "employee_first_name": "Philip",
        "employee_last_name": "Wood",
        "employee_email": "pwood2030@gmail.com",
        "employee_password": "c8cb9726c77f6c4e2db6fb1dda065b81e7c0e758",
        "employee_pin": "9930",
        "employee_access_rights": level1,
        "created_at": "2015-07-09T10:56:17.534Z",
        "updated_at": "2015-07-09T10:56:17.534Z",
        "super_user": false,
        "access_token2": "4fb7c3e3be1c72382889e7f38b8532452353",
        "employee_number": 2456
      }
    ]
  }
}```


### Login A Business
* Path: POST 'business_user/login'
* Params:
business_user_email:string
business_user_password:string

Status: 200 OK
Response:
```{
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
}```


#Employee User

### Request All Employee Users
* Path: GET 'employee_user/index'
* Params: none
Status: 200 OK
Response:
```{
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
    ```

### Register A New Employee
* Path: POST 'employee_user/register'
* Params:
employee_first_name:string
employee_last_name:string
employee_email:string
employee_password:string
employee_pin:string
employee_access_rights:string
employee_number:string

Status: 200 OK
Response:
```{
  "employee_user": {
    "id": 39,
    "employee_first_name": "Juan",
    "employee_last_name": "Marcinek",
    "employee_email": "jmarcinek2035@autotrak.com",
    "employee_password": "5d33b937a88b4fd6e610002425a3665550569ff3",
    "employee_pin": "3242",
    "employee_access_rights": level3,
    "access_token2": "570e68ad88a56d945aa1c4b9easadfasdf",
    "employee_number": "23432"
  }
}```

### Login A Employee
* Path: POST 'employee_user/login'
* Params:
employee_email:string
employee_password:string

Status: 200 OK
Response:
```{
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
}```



### Login A Employee With Pin
* Path: POST 'employee_user/pin_login'
* Params:
employee_pin:string

Status: 200 OK
Response:
```{
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
}```


# Clients

### Request all Clients

* Path: GET '/clients'
* Params: none
Status: 200 OK
Response:
```{
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
}```

### Create Clients

* Path: POST '/clients'
*Params: none
Status: 201 Created
Response:

```{
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
}```

### Show a Client

* Path: GET '/client/:id'
* Params: :id
Status: 200 OK
Response:
```{
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
}```

### Update a Client

* Path: PATCH '/client/:id'
* Params: :id
Status: 200 OK
Response:
```{
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
}```

### Delete a Client

* Path: DELETE '/client/:id'
* Params: :id
Status: 410 Gone
Response:

```{
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
}```

#Inventory Items

Path: GET '/inventory_items'
Params: none
Status:
Response:

Path: POST '/inventory_items'
Params: none
Status:
Response:

Path: GET '/inventory_items/:id'
Params: :id
Status:
Response:

Path: PATCH '/inventory_item/:id'
Params: :id
Status:
Response:

Path: DELETE '/inventory_item/:id'
Params: :id
Status:
Response:

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
