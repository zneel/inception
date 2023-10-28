import React, { useEffect, useState } from 'react';
import { FaLocationPin, FaEnvelope, FaPhone, FaGithub, FaLinkedin } from 'react-icons/fa6';
import { CiDark, CiLight } from 'react-icons/ci';

function App() {

  const [theme, setTheme] = useState('dark');
  const toggleTheme = () => {
    setTheme(theme === 'dark' ? 'light' : 'dark');
  };

  useEffect(() => {
    document.querySelector('html')?.setAttribute('data-theme', theme);
  }, [theme]);

  return (
    <div className='container mx-auto max-w-screen-lg py-10'>
      <div className='flex justify-end'>
        <label className='swap swap-rotate'>
          <input onClick={toggleTheme} type='checkbox' />
          <CiDark size={30} className='swap-on' />
          <CiLight size={30} className='swap-off' />
        </label>
      </div>
      <div className='flex flex-row'>
        <div className='bg-base-200 w-1/3 pl-5 py-5'>
          <h1 className='text-4xl font-bold'>Elliot Bouvier</h1>
          <div className='avatar'>
            <div className='w-24 rounded-full'>
              <img src='./profile.jpg' alt='' />
            </div>
          </div>
          <h2 className='text-2xl font-semibold py-2'>Software Engineer</h2>
          <div className='flex flex-col my-6 space-y-3'>
            <div className='flex items-center'>
              <FaLocationPin className='mr-2' />Paris, France
            </div>
            <div className='flex items-center'>
              <FaEnvelope className='mr-2' /> <a href='mailto:ebouvier@student.42.fr'>ebouvier@student.42.fr</a>
            </div>
            <div className='flex items-center'>
              <FaPhone className='mr-2' /> <a href='tel:+33600000000'>+33 6 00 00 00 00</a>
            </div>
          </div>
          <h2 className='text-1xl font-bold'>Who am i</h2>
          <p>
            Im 31, I'm currently studying at school in Paris.
          </p>
          <h2 className='text-1xl font-bold'>Dev stack</h2>
          <ul className='list-disc'>
            <li className='list-inside'>C</li>
            <li className='list-inside'>C++</li>
            <li className='list-inside'>Go</li>
            <li className='list-inside'>Typescript</li>
            <li className='list-inside'>Javascript</li>
          </ul>
          <h2 className='text-1xl font-bold'>Skills</h2>
          <ul className='list-disc'>
            <li className='list-inside'>Web</li>
            <li className='list-inside'>Mobile</li>
            <li className='list-inside'>DevOps</li>
            <li className='list-inside'>Reverse Engineering</li>
          </ul>
          <h2 className='text-1xl font-bold'>Socials</h2>
          <ul>
            <li className='flex items-center space-x-2'><FaGithub /><a href='https://github.com/zneel'>Github</a></li>
            <li className='flex items-center space-x-2'><FaLinkedin /><a href='https://www.linkedin.com/in/elliotbouvier/'>Linkedin</a></li>
          </ul>
        </div>
        <div className='flex flex-col pl-10 w-2/3 bg-base-300 text-base-content py-5 justify-around'>
          <h1 className='text-3xl font-bold '>Experience</h1>
          <ul className='list-disc'>
            <li className='list-outside'>
              <div className="flex flex-col">
                <h2 className='text-xl font-bold'>Bankin' - Backend software engineer</h2>
                <h2 className='font-bold'>Feb 2021 - Jun 2022</h2>
                <p className='text-base'>
                  Development of new features on a worker-based architecture (using SQS queues) <br />
                </p>
              </div>
            </li>
            <li className='list-outside'>
              <div className="flex flex-col">
                <h2 className='text-xl font-bold'>MakeMeReach - Fullstack software engineer</h2>
                <h2 className='font-bold'>Jul 2019 - Feb 2021</h2>
                <p className='text-base'>
                  Development of new features <br />
                  Debugging and improving graph traversal pathways (A*). <br />
                  Refactoring of legacy code (hack, CoffeeScript) to TypeScript <br />
                </p>
              </div>
            </li>
            <li className='list-outside'>
              <div className="flex flex-col">
                <h2 className='text-xl font-bold'>SeaTrust - Research/Development Engineer</h2>
                <h2 className='font-bold'>Jun 2018 - Jul 2019</h2>
                <p className='text-base'>
                  Serverless NodeJs server (AWS Lambda) <br />
                  Redis, PostgreSQL <br />
                  CI/CD GitLab + Semvers <br />
                  React-Native / Redux <br />
                </p>
              </div>
            </li>
            <li className='list-outside'>
              <div className="flex flex-col">
                <h2 className='text-xl font-bold'>Recommande.com - Fullstack Apprenticeship</h2>
                <h2 className='font-bold'>Sep 2016 - Nov 2017</h2>
                <p className='text-base'>
                  Symfony3 framework and PHP7. <br />
                  Development of a backend solution using MySQL with LDAP authentication + LDAP management. <br />
                  Cluster deployment of Symfony applications (sticky session, Redis, HAProxy, NFS). <br />
                  Creation of a middleware in Express/NodeJS + ElasticSearch for importing Excel files and converting them to streams. <br />
                  Continuous integration with GitLab-CI and Docker. <br />
                  Continuous deployment with Ansible. <br />
                </p>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
}

export default App;
