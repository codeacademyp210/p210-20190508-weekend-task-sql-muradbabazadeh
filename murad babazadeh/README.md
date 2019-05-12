# P210-20190508-Weekend-Task-SQL

Tapshiriq 2 hisseden ibaretdir.
1. Winforms
2. SQL

## Winforms Task
3 eded form hazirlayin. 

Form 1 - Login. Form 2 - Register. Form 3 - Products

Login formunda istifadeci Username ve Password daxil etdikden sonra eger User Listde uygun user tapilsa 3-cu form, yeni Products formu acilmalidir. Register linkine click etdikde Register Form acilmalidir. Istifadeci melumatlari duzgun shekilde daxil etdikden sonra Register button-una click etdikde yeni User yaradilib liste elave etmek lazimdir, ve Products formu acilmalidir.

Products formunda yeni mehsul elave etmek ucun textboxlar duzgun melumatlarla doldurulmalidir, bunun ucun VALIDATION mexanizmi tetbiq edin. 

Products formunda DataGridView-da Mehsulun Adi, Qiymeti, Categoriya Adi, Brand Adi, Rengi, Barkodu, Stockda neche eded qaldigi gosterilmelidir.


Login ve Register Formlarin olcusu sabit qalmalidir, maximize olmasin. 


## SQL Task

Ashagidaki table-lari yaradin. 

- Users:
    - ID
    - Name
    - Surname
    - Username
    - Email
    - Password

- Products
    - Id
    - Name
    - Price
    - CategoryID
    - BrandID
    - Color
    - Barcode

- Categories
    - Id
    - Name

- Brands
    - Id
    - Name
    - CategoryID

- Stock
    - Id
    - ProductID
    - Count

- Orders
    - Id
    - UserID
    - ProductID
    - ProductCount
    - OrderDate


