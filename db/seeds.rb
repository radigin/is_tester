u = User.create(user_login: 'test', user_password: 'TEST', is_real_admin: 0, 
  email: 'test@test.ru')
u = User.create(user_login: 'admin', user_password: 'ADMINNIMDA', is_real_admin: 1, 
  email: 'admin@test.ru')
u = User.create(user_login: 'admin2', user_password: 'ADMINNIMDA', is_real_admin: 1, 
  email: 'admin2@test.ru')
u = User.create(user_login: 'admin3', user_password: 'ADMINNIMDA', is_real_admin: 1, 
  email: 'admin3@test.ru')
u = User.create(user_login: 'ivanov', user_password: 'fdjfhkjdsfkjs', is_real_admin: 0, 
  email: 'ivanov@test.ru')
ud = UserDesc.create(lname: 'Иванов', fname: 'Иван', sname: 'Иванович', 
  address: 'Каширское шоссе 131-306', user_id: u.id)
u = User.create(user_login: 'petrov', user_password: 'ffdshfkjhsdf', is_real_admin: 0, 
  email: 'petrov@test.ru')
ud = UserDesc.create(lname: 'Петров', fname: 'Иван', sname: 'Иванович', 
  address: 'Каширское шоссе 131-307', user_id: u.id)
u = User.create(user_login: 'sidorov', user_password: 'djfkljdsfjjdskl', is_real_admin: 0, 
  email: 'sidorov@test.ru')
ud = UserDesc.create(lname: 'Сидоров', fname: 'Иван', sname: 'Иванович', 
  address: 'Каширское шоссе 131-308', user_id: u.id)