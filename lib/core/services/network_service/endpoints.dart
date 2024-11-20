class EndPoints {
  static const baseUrl = "https://todo.iraqsapp.com";
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const logout = '/auth/logout';
  static const profile = '/auth/profile';
  static const createTask = '/todos';
  static const uploadImage = '/upload/image';
  static const imagesPath = 'https://todo.iraqsapp.com/images/';
  static String allTask(id) => '/todos?page=$id';
  static String deleteTask(id) => '/todos/$id';
  static String updateTask(id) => '/todos/$id';
}
