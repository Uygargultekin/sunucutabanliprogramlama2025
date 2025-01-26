import mysql from 'mysql2/promise';

const pool = mysql.createPool({
  host: 'localhost', 
  user: 'your_username', 
  password: 'your_password', 
  database: 'seawise' 
});
export async function signIn(email, password) {
  try {
    const [rows] = await pool.query(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [email, password]
    );

    if (rows.length === 0) {
      throw new Error('Geçersiz e-posta veya şifre.');
    }

    return { data: rows[0], error: null };
  } catch (error) {
    console.error('Login error:', error.message);
    return { data: null, error };
  }
}
export async function signUp(email, password, companyName) {
  try {
    const [result] = await pool.query(
      'INSERT INTO users (email, password, company_name) VALUES (?, ?, ?)',
      [email, password, companyName]
    );

    const userId = result.insertId;

    return { data: { id: userId, email, company_name: companyName }, error: null };
  } catch (error) {
    console.error('Registration error:', error.message);
    return { data: null, error };
  }
}
export async function signOut() {
  try {
    
    return { error: null };
  } catch (error) {
    console.error('Logout error:', error.message);
    return { error };
  }
}
export function onAuthStateChange(callback) {
  console.warn('MySQL üzerinde oturum durumu izleme doğrudan desteklenmez.');
  callback(null); 
}
