Introduction to Core Data
===
####Persistence (持續存在)
- make data that’s in your apps stay around between application launches
- lets users store persistent data and also retrieve it
	+ users don’t have to reenter(再進入) all their data each time they use their applications

####Core Data is not a Database!!!
```
Core Data is not a relational database. It is actually a framework that lets developers store (or retrieve) data in database in an object-oriented way. 
```

####Core Data Stack
#####Persistent Store Coordinator 
- manage different persistent object stores and save the objects to the stores

#####Managed Object Context 
- manage objects created and returned using Core Data

Question
---
Q: Error ... `use of undeclared identifier 'NSEntityDescription'`

A: adding this code `#import <CoreData/CoreData.h>` at the top