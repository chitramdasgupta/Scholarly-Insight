"use client";

import Link from "next/link";
import useToggle from "@/app/hooks/useToggle";

const Navbar: React.FC = () => {
  const [isOpen, toggleMenu] = useToggle(false);

  return (
    <nav className="flex bg-gray-800 text-white py-3 flex-wrap justify-between px-4 relative">
      <h1 className="text-lg font-semibold">Scholarly Insight</h1>
      <button className="md:hidden focus:outline-none" onClick={toggleMenu}>
        <svg
          className="w-6 h-6 fill-current"
          viewBox="0 0 24 24"
          xmlns="http://www.w3.org/2000/svg"
        >
          {isOpen ? (
            <path
              fillRule="evenodd"
              clipRule="evenodd"
              d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"
            />
          ) : (
            <path
              fillRule="evenodd"
              clipRule="evenodd"
              d="M4 6h16v2H4V6zm0 5h16v2H4v-2zm0 5h16v2H4v-2z"
            />
          )}
        </svg>
      </button>
      <ul
        className={`${
          isOpen ? "block" : "hidden"
        } md:flex md:gap-[40px] text-m md:static absolute top-full left-0 right-0 bg-gray-800 md:bg-transparent py-2 md:py-0 z-10 text-center`}
      >
        <li className="my-2 md:my-0">
          <Link href="/rate-my-professor">Rate my professor</Link>
        </li>
        <li className="my-2 md:my-0">
          <Link href="/recommendations">Recommendations</Link>
        </li>
        <li className="my-2 md:my-0">
          <Link href="/about">About</Link>
        </li>
      </ul>
    </nav>
  );
};

export default Navbar;
