## BackEnd Repositories

https://github.com/SaiAshish9/linkedIn-api-clone-by-sai

## Hide debug banner

```
MateralApp(
    debugShowCheckedModeBanner:false
    ...
```

## Splash Screen Configuration

```
android -> app -> res -> values -> mipmap
-> splash.png

drawable -> launch_background ->

<item>
<bitmap
android:src="@mipmac/splash"
android:gravity="fill"
/>
</item>

```

## Portrait Orientation

```
<activity
  android:screenOrientation="portrait"
```

## Enabling Expandable BottomModalSheet

```
isScrollControlled: true,
```


## Connecting to Mysql Amazon RDS 

```
Region -> Asia Pacific (Mumbai)
RDS
Free Tier
MySQL 
Security -> VPC Security Group

Edit Inbound Rules
MYSQL/Aurora TCP 3306 Source -> Custom
Custom TCP 3000-4000 0.0.0.0/0 :/0 

RDS -> Modify -> Additional Configuration -> Public Access
```

## Configuring NestJS Project

```
sudo npm i -g @nestjs/cli
sudo nest n linkedIn
cd linked-in
npm i prisma --save-dev
npx prisma init 
npm run start
Go to http://localhost:3000/
```

## Save All Files In VS Code

```
Ctrl + K + W
```

## Database Configuration

```
sudo mysql -u root -p
create database linkedIn;
use linkedIn;
grant all privileges on *.* to 'saiashish'@'localhost';
alter user 'saiashish'@'localhost' identified with mysql_native_password by 'saiashish';
```

## DATABASE_URL

```
mysql://saiashish:saiashish@localhost:3306/linkedIn
```

## Migration

```
npx prisma migrate dev --name init --preview-feature
sudo apt  install tree
tree prisma
```

## Perform migration whenever something is changed in schema.prisma

```
npx prisma migrate dev --name init --preview-feature
```

## Fetch All Posts

```
query posts{
  posts{
    id
    content
    image
    userReaction
    userReactionText
    published
    videoUrl
    author{
      id
    }
    commentCount
    reactions
    liked
    clapped
    loved
    bright
    support
    curious
    variableReactionsCount
    }
}
```

## Fetch All Users

```
query users{
  users{
    id
    image
    headline
    name
  }
}
```

## Fetch All Notifications

```
query notifications{
  notifications{
    id
    image
    text1
    text2
    text3
    published
  }
}
```

## Fetch All Recommendations

```
query recommendations{
  recommendations{
    id
    image
    title
    company
    location
    easyApply
  }
}
```

## Fetch All Connections

```
query connections{
  connections{
    id
    title
    description
    count
    background
    avatar
  }
}
```

## Create User
```
mutation createUser{
  createUser(data:{
    image:"https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0/1519856215226?e=1622073600&v=beta&t=p9zXj2dj6BXsOGH65sw6Sw4iWqAg_h4q38ABubR4a2",
    headline:"20,701,240 followers",
    name:"Google"
  }){
    id
    image
    headline
    name
  }
}
```

## Create Post
```
mutation createPost{
  createPost(
  data:{
  content:null,
  authorId:1,
  image:"https://media-exp1.licdn.com/dms/image/C5622AQEcCkjOSS3xJg/feedshare-image-offsite-ads_350_624/0/1613995014067?e=1617235200&v=beta&t=ukgWOspqqx8TBnU99KhVnUL2f-EdbOkg_sVtRatoLyM",
  userReaction: "Sarthak celebrates this",
  userReactionText: null,
  published: "1w",
  videoUrl: null,
  commentCount: 28,
  reactions: "1,616",
  liked: true,
  clapped: true,
  loved: true,
  bright: false,
  support: false,
  curious: false,
  variableReactionsCount: 3
}
){
   id
    content
    image
    userReaction
    userReactionText
    published
    videoUrl
    author{
      id
      name
      headline
      image
    }
    commentCount
    reactions
    liked
    clapped
    loved
    bright
    support
    curious
    variableReactionsCount
} 
}
```

## Delete All Posts

```
mutation deletePosts{
  deleteAllPosts{
    content
  }
}
```

## Delete All Users

```
mutation deleteUsers{
  deleteAllUsers{
    name
  }
}
```

## SQL Command's

```
INSERT INTO linkedIn.User values(1,"Google","20,701,240 followers","https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0/1519856215226?e=1622073600&v=beta&t=p9zXj2dj6BXsOGH65sw6Sw4iWqAg_h4q38ABubR4a2A");

INSERT INTO linkedIn.Post values(1,null,"https://media-exp1.licdn.com/dms/image/C5622AQEcCkjOSS3xJg/feedshare-image-offsite-ads_350_624/0/1613995014067?e=1617235200&v=beta&t=ukgWOspqqx8TBnU99KhVnUL2f-EdbOkg_sVtRatoLyM","Sarthak celebrates this","1w",1,null,28,"1,616",true,true,true,false,false,false,3);SELECT * FROM linkedIn.Post;

```

## Curl Command

```
Copy Curl Operation Can Be Executed From The GUI.
```
