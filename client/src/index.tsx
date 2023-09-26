import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import {createBrowserRouter, RouterProvider, Link} from 'react-router-dom';
import ErrorPage from './pages/error.page';

const router = createBrowserRouter([
  {
    path: '/',
    element: <App/>,
    errorElement: <ErrorPage/>,
    children: [
      {
        path: 'child/:id',
        element: <Link to={`/`}>child</Link>
      },  
      {
        path: 'contacts',
        element: <Link to={`/`}>Contacts</Link>
      },       
    ]
  }, 
  {
    path: '/play',
    element: <Link to={`/`}>Play</Link>
  }, 
  {
    path: '/offers',
    element: <Link to={`/`}>Offers</Link>
  },
  {
    path: '/offer/:id',
    element: <Link to={`/`}>OfferId</Link>
  }
])

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <RouterProvider router={router}/>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
