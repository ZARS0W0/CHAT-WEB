# ChatApp - Real-time Messaging Application

A fully functional chat website with user authentication, real-time messaging, and a beautiful modern web interface.

## Features

### 🔐 Authentication System
- User registration with email validation
- Secure login/logout functionality
- Password hashing and session management
- Persistent login sessions

### 💬 Real-time Chat
- Instant messaging with live updates
- Message history and persistence
- User online/offline status tracking
- Clean, modern chat interface
- Message timestamps and user avatars

### 🎨 Beautiful UI/UX
- Responsive design for desktop and mobile
- Modern, clean interface with Tailwind CSS
- Dark/light theme support
- Smooth animations and transitions
- Professional chat layout with sidebar

### 👥 User Management
- User list with online status indicators
- User avatars with initials
- Real-time user status updates

## Technology Stack

### Backend
- **Flask** - Python web framework
- **SQLAlchemy** - Database ORM
- **SQLite** - Database
- **Flask-CORS** - Cross-origin resource sharing
- **Werkzeug** - Password hashing

### Frontend
- **React** - Frontend framework
- **Vite** - Build tool and dev server
- **Tailwind CSS** - Styling framework
- **shadcn/ui** - UI component library
- **Lucide React** - Icons

## Project Structure

```
chat-app/
├── chat-backend/          # Flask backend application
│   ├── src/
│   │   ├── models/        # Database models
│   │   │   ├── user.py    # User model with authentication
│   │   │   └── chat.py    # Chat message model
│   │   ├── routes/        # API endpoints
│   │   │   ├── user.py    # Authentication routes
│   │   │   └── chat.py    # Chat message routes
│   │   ├── database/      # SQLite database
│   │   ├── static/        # Static files
│   │   └── main.py        # Flask application entry point
│   ├── venv/              # Python virtual environment
│   └── requirements.txt   # Python dependencies
└── chat-frontend/         # React frontend application
    ├── src/
    │   ├── components/    # React components
    │   │   ├── ui/        # shadcn/ui components
    │   │   ├── AuthForm.jsx      # Login/Register form
    │   │   └── ChatInterface.jsx # Main chat interface
    │   ├── App.jsx        # Main application component
    │   └── main.jsx       # React entry point
    ├── public/            # Public assets
    └── package.json       # Node.js dependencies
```

## Setup Instructions

### Prerequisites
- Python 3.11+
- Node.js 20+
- pnpm (or npm)

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd chat-backend
   ```

2. Activate the virtual environment:
   ```bash
   source venv/bin/activate
   ```

3. Install dependencies (already installed):
   ```bash
   pip install -r requirements.txt
   ```

4. Start the Flask server:
   ```bash
   python src/main.py
   ```

   The backend will run on `http://localhost:5001`

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd chat-frontend
   ```

2. Install dependencies (already installed):
   ```bash
   pnpm install
   ```

3. Start the development server:
   ```bash
   pnpm run dev --host
   ```

   The frontend will run on `http://localhost:5174` (or next available port)

## Usage

1. **Access the Application**: Open your browser and go to the frontend URL (e.g., `http://localhost:5174`)

2. **Register a New Account**:
   - Click on the "Register" tab
   - Fill in username, email, and password
   - Click "Create Account"

3. **Login**:
   - Enter your username and password
   - Click "Sign In"

4. **Start Chatting**:
   - Type your message in the input field at the bottom
   - Press Enter or click the send button
   - See your messages appear in real-time
   - View other users in the sidebar

5. **Logout**:
   - Click the logout button in the top-right corner of the sidebar

## API Endpoints

### Authentication
- `POST /api/register` - Register a new user
- `POST /api/login` - Login user
- `POST /api/logout` - Logout user
- `GET /api/me` - Get current user info

### Users
- `GET /api/users` - Get all users with status

### Chat
- `GET /api/messages` - Get chat messages
- `POST /api/messages` - Send a new message
- `DELETE /api/messages/<id>` - Delete a message (own messages only)

## Database Schema

### Users Table
- `id` - Primary key
- `username` - Unique username
- `email` - Unique email address
- `password_hash` - Hashed password
- `created_at` - Account creation timestamp
- `last_seen` - Last activity timestamp
- `is_online` - Online status boolean

### Chat Messages Table
- `id` - Primary key
- `content` - Message text
- `timestamp` - Message timestamp
- `user_id` - Foreign key to users table
- `room_id` - Chat room identifier (default: 'general')

## Security Features

- Password hashing using Werkzeug
- Session-based authentication
- CORS protection
- Input validation and sanitization
- SQL injection prevention through ORM

## Deployment Options

### Local Development
- Already set up and running locally
- Backend on port 5001, frontend on port 5174

### Production Deployment
For production deployment, consider:

1. **Backend**:
   - Use a production WSGI server (e.g., Gunicorn)
   - Use PostgreSQL instead of SQLite
   - Set up environment variables for configuration
   - Enable HTTPS

2. **Frontend**:
   - Build the production bundle: `pnpm run build`
   - Serve static files through a web server (e.g., Nginx)
   - Update API endpoints to production URLs

3. **Infrastructure**:
   - Deploy to cloud platforms (AWS, Heroku, DigitalOcean)
   - Set up domain and SSL certificates
   - Configure database backups
   - Set up monitoring and logging

## Future Enhancements

- Real-time WebSocket implementation for instant messaging
- Multiple chat rooms/channels
- File and image sharing
- Message reactions and replies
- User profiles and avatars
- Push notifications
- Message search functionality
- Admin panel for user management

## Troubleshooting

### Common Issues

1. **Port conflicts**: If ports 5001 or 5174 are in use, the applications will automatically try the next available port.

2. **Database issues**: If you encounter database errors, delete the `chat-backend/src/database/app.db` file and restart the backend to recreate the database.

3. **CORS errors**: Make sure both frontend and backend are running and the backend has CORS enabled.

4. **Authentication issues**: Clear your browser cookies and try logging in again.

## License

This project is created for demonstration purposes. Feel free to use and modify as needed.

## Support

For any issues or questions, please refer to the troubleshooting section above or check the application logs for detailed error messages.

