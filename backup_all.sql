--
-- PostgreSQL database cluster dump
--

\restrict 1R8HW1AA2QFs5p8aGcGyynBSEQ7L352NeiYhynCRxfBUU8gRgv6xgefrZB0M8mp

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE wagtail;
ALTER ROLE wagtail WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:oOYNXX0lrrmfAFdUTEvHoA==$JbKQBDH7GedUDY+7eB9s0FPtmlZbNB+tKsBZjRoyiKY=:kiq05H5CtWN2lVSAhZUHHRoWvgyc/tXlPFJ5I7uD5wI=';

--
-- User Configurations
--








\unrestrict 1R8HW1AA2QFs5p8aGcGyynBSEQ7L352NeiYhynCRxfBUU8gRgv6xgefrZB0M8mp

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict amuNqaHA2w01AqZhuZfFDiOjY025nnVtPDtSVaZ0hpdNwMK61iTe3U9NBWtSlIg

-- Dumped from database version 16.12 (Debian 16.12-1.pgdg13+1)
-- Dumped by pg_dump version 16.12 (Debian 16.12-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict amuNqaHA2w01AqZhuZfFDiOjY025nnVtPDtSVaZ0hpdNwMK61iTe3U9NBWtSlIg

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict pIMgBM90MejPlJOEbxlOa39fUwAKL0qJLoD2kzmE4adED3adbcgn4EH6zh4SYVF

-- Dumped from database version 16.12 (Debian 16.12-1.pgdg13+1)
-- Dumped by pg_dump version 16.12 (Debian 16.12-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict pIMgBM90MejPlJOEbxlOa39fUwAKL0qJLoD2kzmE4adED3adbcgn4EH6zh4SYVF

--
-- Database "wagtail" dump
--

--
-- PostgreSQL database dump
--

\restrict n0rtzcbQcENr9FUAuS1Xn7Qc7tX5GwLWUuEKjhBSACEbQ5xg2aVm2zrMYt2fyF0

-- Dumped from database version 16.12 (Debian 16.12-1.pgdg13+1)
-- Dumped by pg_dump version 16.12 (Debian 16.12-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: wagtail; Type: DATABASE; Schema: -; Owner: wagtail
--

CREATE DATABASE wagtail WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE wagtail OWNER TO wagtail;

\unrestrict n0rtzcbQcENr9FUAuS1Xn7Qc7tX5GwLWUuEKjhBSACEbQ5xg2aVm2zrMYt2fyF0
\connect wagtail
\restrict n0rtzcbQcENr9FUAuS1Xn7Qc7tX5GwLWUuEKjhBSACEbQ5xg2aVm2zrMYt2fyF0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: wagtail
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO wagtail;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: wagtail
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    verified boolean,
    "primary" boolean,
    user_id bigint,
    email text,
    name text
);


ALTER TABLE public.account_emailaddress OWNER TO wagtail;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_emailaddress_id_seq OWNER TO wagtail;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone,
    sent timestamp with time zone,
    key text,
    email_address_id bigint
);


ALTER TABLE public.account_emailconfirmation OWNER TO wagtail;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNER TO wagtail;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: adhesions_application; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.adhesions_application (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    reference character varying(30) NOT NULL,
    application_type character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    date_of_birth date,
    place_of_birth character varying(255) NOT NULL,
    gender character varying(20) NOT NULL,
    nationality character varying(100) NOT NULL,
    phone character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address text NOT NULL,
    profession character varying(255) NOT NULL,
    specialization character varying(255) NOT NULL,
    employer character varying(255) NOT NULL,
    professional_address text NOT NULL,
    biography text NOT NULL,
    submitted_at timestamp with time zone,
    reviewed_at timestamp with time zone,
    internal_comment text NOT NULL,
    assigned_to_id integer,
    candidate_id bigint NOT NULL
);


ALTER TABLE public.adhesions_application OWNER TO wagtail;

--
-- Name: adhesions_application_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

ALTER TABLE public.adhesions_application ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adhesions_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: adhesions_applicationcomment; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.adhesions_applicationcomment (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_internal boolean NOT NULL,
    message text NOT NULL,
    application_id bigint NOT NULL,
    author_id integer
);


ALTER TABLE public.adhesions_applicationcomment OWNER TO wagtail;

--
-- Name: adhesions_applicationcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

ALTER TABLE public.adhesions_applicationcomment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adhesions_applicationcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: adhesions_applicationdocument; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.adhesions_applicationdocument (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    document_type character varying(50) NOT NULL,
    file character varying(100) NOT NULL,
    original_filename character varying(255) NOT NULL,
    status character varying(20) NOT NULL,
    rejection_reason text NOT NULL,
    checked_at timestamp with time zone,
    application_id bigint NOT NULL,
    checked_by_id integer
);


ALTER TABLE public.adhesions_applicationdocument OWNER TO wagtail;

--
-- Name: adhesions_applicationdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

ALTER TABLE public.adhesions_applicationdocument ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adhesions_applicationdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: adhesions_applicationstatushistory; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.adhesions_applicationstatushistory (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    old_status character varying(30) NOT NULL,
    new_status character varying(30) NOT NULL,
    comment text NOT NULL,
    application_id bigint NOT NULL,
    changed_by_id integer
);


ALTER TABLE public.adhesions_applicationstatushistory OWNER TO wagtail;

--
-- Name: adhesions_applicationstatushistory_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

ALTER TABLE public.adhesions_applicationstatushistory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adhesions_applicationstatushistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: adhesions_candidateprofile; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.adhesions_candidateprofile (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    date_of_birth date,
    place_of_birth character varying(255) NOT NULL,
    gender character varying(20) NOT NULL,
    nationality character varying(100) NOT NULL,
    phone character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address text NOT NULL,
    city character varying(150) NOT NULL,
    country character varying(150) NOT NULL,
    user_id integer
);


ALTER TABLE public.adhesions_candidateprofile OWNER TO wagtail;

--
-- Name: adhesions_candidateprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

ALTER TABLE public.adhesions_candidateprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adhesions_candidateprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: adhesions_membershipprofile; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.adhesions_membershipprofile (
    id bigint NOT NULL,
    role character varying(20) NOT NULL,
    is_active_for_membership boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.adhesions_membershipprofile OWNER TO wagtail;

--
-- Name: adhesions_membershipprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

ALTER TABLE public.adhesions_membershipprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adhesions_membershipprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.auth_group (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.auth_group OWNER TO wagtail;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO wagtail;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id bigint,
    permission_id bigint
);


ALTER TABLE public.auth_group_permissions OWNER TO wagtail;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO wagtail;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.auth_permission (
    id bigint NOT NULL,
    content_type_id bigint,
    codename text,
    name text
);


ALTER TABLE public.auth_permission OWNER TO wagtail;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO wagtail;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.auth_user (
    id bigint NOT NULL,
    password text,
    last_login timestamp with time zone,
    is_superuser boolean,
    username text,
    last_name text,
    email text,
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    first_name text
);


ALTER TABLE public.auth_user OWNER TO wagtail;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id bigint,
    group_id bigint
);


ALTER TABLE public.auth_user_groups OWNER TO wagtail;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO wagtail;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO wagtail;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint,
    permission_id bigint
);


ALTER TABLE public.auth_user_user_permissions OWNER TO wagtail;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO wagtail;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: bibliotheque_bibliothequeitem; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.bibliotheque_bibliothequeitem (
    id bigint NOT NULL,
    sort_order bigint,
    title text,
    updated_at date,
    download_count integer,
    document_id bigint,
    page_id bigint,
    category_id bigint
);


ALTER TABLE public.bibliotheque_bibliothequeitem OWNER TO wagtail;

--
-- Name: bibliotheque_bibliothequeitem_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.bibliotheque_bibliothequeitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bibliotheque_bibliothequeitem_id_seq OWNER TO wagtail;

--
-- Name: bibliotheque_bibliothequeitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.bibliotheque_bibliothequeitem_id_seq OWNED BY public.bibliotheque_bibliothequeitem.id;


--
-- Name: bibliotheque_bibliothequepage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.bibliotheque_bibliothequepage (
    page_ptr_id bigint NOT NULL,
    intro text
);


ALTER TABLE public.bibliotheque_bibliothequepage OWNER TO wagtail;

--
-- Name: bibliotheque_documentcategory; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.bibliotheque_documentcategory (
    id bigint NOT NULL,
    title text
);


ALTER TABLE public.bibliotheque_documentcategory OWNER TO wagtail;

--
-- Name: bibliotheque_documentcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.bibliotheque_documentcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bibliotheque_documentcategory_id_seq OWNER TO wagtail;

--
-- Name: bibliotheque_documentcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.bibliotheque_documentcategory_id_seq OWNED BY public.bibliotheque_documentcategory.id;


--
-- Name: blog_blogcategory; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.blog_blogcategory (
    id bigint NOT NULL,
    name text,
    slug text,
    description text
);


ALTER TABLE public.blog_blogcategory OWNER TO wagtail;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.blog_blogcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blog_blogcategory_id_seq OWNER TO wagtail;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.blog_blogcategory_id_seq OWNED BY public.blog_blogcategory.id;


--
-- Name: blog_blogindexpage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.blog_blogindexpage (
    page_ptr_id bigint NOT NULL,
    intro text
);


ALTER TABLE public.blog_blogindexpage OWNER TO wagtail;

--
-- Name: blog_blogpage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.blog_blogpage (
    page_ptr_id bigint NOT NULL,
    date date,
    body text,
    image_id bigint,
    featured boolean,
    intro text
);


ALTER TABLE public.blog_blogpage OWNER TO wagtail;

--
-- Name: blog_blogpage_categories; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.blog_blogpage_categories (
    id bigint NOT NULL,
    blogpage_id bigint,
    blogcategory_id bigint
);


ALTER TABLE public.blog_blogpage_categories OWNER TO wagtail;

--
-- Name: blog_blogpage_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.blog_blogpage_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blog_blogpage_categories_id_seq OWNER TO wagtail;

--
-- Name: blog_blogpage_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.blog_blogpage_categories_id_seq OWNED BY public.blog_blogpage_categories.id;


--
-- Name: blog_blogpagetag; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.blog_blogpagetag (
    id bigint NOT NULL,
    content_object_id bigint,
    tag_id bigint
);


ALTER TABLE public.blog_blogpagetag OWNER TO wagtail;

--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.blog_blogpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blog_blogpagetag_id_seq OWNER TO wagtail;

--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.blog_blogpagetag_id_seq OWNED BY public.blog_blogpagetag.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.django_admin_log (
    id bigint NOT NULL,
    object_id text,
    object_repr text,
    action_flag smallint,
    change_message text,
    content_type_id bigint,
    user_id bigint,
    action_time timestamp with time zone
);


ALTER TABLE public.django_admin_log OWNER TO wagtail;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO wagtail;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.django_content_type (
    id bigint NOT NULL,
    app_label text,
    model text
);


ALTER TABLE public.django_content_type OWNER TO wagtail;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO wagtail;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app text,
    name text,
    applied timestamp with time zone
);


ALTER TABLE public.django_migrations OWNER TO wagtail;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO wagtail;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.django_session (
    session_key text NOT NULL,
    session_data text,
    expire_date timestamp with time zone
);


ALTER TABLE public.django_session OWNER TO wagtail;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.django_site (
    id bigint NOT NULL,
    name text,
    domain text
);


ALTER TABLE public.django_site OWNER TO wagtail;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_site_id_seq OWNER TO wagtail;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: home_footersettings; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_footersettings (
    id bigint NOT NULL,
    site_id bigint,
    about_text text,
    about_title text,
    footer_bg_class text,
    footer_text_class text,
    links text,
    links_title text,
    social_title text,
    socials text
);


ALTER TABLE public.home_footersettings OWNER TO wagtail;

--
-- Name: home_footersettings_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_footersettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_footersettings_id_seq OWNER TO wagtail;

--
-- Name: home_footersettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_footersettings_id_seq OWNED BY public.home_footersettings.id;


--
-- Name: home_footertext; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_footertext (
    id bigint NOT NULL,
    title text,
    body text
);


ALTER TABLE public.home_footertext OWNER TO wagtail;

--
-- Name: home_footertext_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_footertext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_footertext_id_seq OWNER TO wagtail;

--
-- Name: home_footertext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_footertext_id_seq OWNED BY public.home_footertext.id;


--
-- Name: home_homeheroslide; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_homeheroslide (
    id bigint NOT NULL,
    sort_order bigint,
    title text,
    subtitle text,
    cta_text text,
    cta_page_id bigint,
    image_id bigint,
    page_id bigint
);


ALTER TABLE public.home_homeheroslide OWNER TO wagtail;

--
-- Name: home_homeheroslide_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_homeheroslide_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_homeheroslide_id_seq OWNER TO wagtail;

--
-- Name: home_homeheroslide_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_homeheroslide_id_seq OWNED BY public.home_homeheroslide.id;


--
-- Name: home_homepage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_homepage (
    page_ptr_id bigint NOT NULL,
    editorial_body text,
    editorial_title text,
    latest_articles_count smallint,
    latest_articles_title text,
    perspectives_excerpt text,
    perspectives_page_id bigint,
    perspectives_title text,
    show_latest_articles boolean,
    spotlight_page_id bigint,
    spotlight_title text,
    tagline text
);


ALTER TABLE public.home_homepage OWNER TO wagtail;

--
-- Name: home_homequicklink; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_homequicklink (
    id bigint NOT NULL,
    sort_order bigint,
    title text,
    text text,
    image_id bigint,
    link_page_id bigint,
    page_id bigint
);


ALTER TABLE public.home_homequicklink OWNER TO wagtail;

--
-- Name: home_homequicklink_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_homequicklink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_homequicklink_id_seq OWNER TO wagtail;

--
-- Name: home_homequicklink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_homequicklink_id_seq OWNED BY public.home_homequicklink.id;


--
-- Name: home_menu; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_menu (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.home_menu OWNER TO wagtail;

--
-- Name: home_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_menu_id_seq OWNER TO wagtail;

--
-- Name: home_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_menu_id_seq OWNED BY public.home_menu.id;


--
-- Name: home_menuitem; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_menuitem (
    id bigint NOT NULL,
    sort_order bigint,
    title text,
    link_url text,
    show_children boolean,
    visibility text,
    link_page_id bigint,
    menu_id bigint
);


ALTER TABLE public.home_menuitem OWNER TO wagtail;

--
-- Name: home_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_menuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_menuitem_id_seq OWNER TO wagtail;

--
-- Name: home_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_menuitem_id_seq OWNED BY public.home_menuitem.id;


--
-- Name: home_standardpage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_standardpage (
    page_ptr_id bigint NOT NULL,
    hero_alt text,
    show_toc boolean,
    intro text,
    body text,
    hero_image_id bigint
);


ALTER TABLE public.home_standardpage OWNER TO wagtail;

--
-- Name: home_submenuitem; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.home_submenuitem (
    id bigint NOT NULL,
    sort_order bigint,
    title text,
    link_url text,
    link_page_id bigint,
    parent_id bigint
);


ALTER TABLE public.home_submenuitem OWNER TO wagtail;

--
-- Name: home_submenuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.home_submenuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_submenuitem_id_seq OWNER TO wagtail;

--
-- Name: home_submenuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.home_submenuitem_id_seq OWNED BY public.home_submenuitem.id;


--
-- Name: members_annualfee; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_annualfee (
    id bigint NOT NULL,
    year integer,
    amount numeric,
    currency text,
    is_open boolean
);


ALTER TABLE public.members_annualfee OWNER TO wagtail;

--
-- Name: members_annualfee_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_annualfee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_annualfee_id_seq OWNER TO wagtail;

--
-- Name: members_annualfee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_annualfee_id_seq OWNED BY public.members_annualfee.id;


--
-- Name: members_member; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_member (
    id bigint NOT NULL,
    role text,
    name text,
    subtitle text,
    photo_id bigint
);


ALTER TABLE public.members_member OWNER TO wagtail;

--
-- Name: members_member_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_member_id_seq OWNER TO wagtail;

--
-- Name: members_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_member_id_seq OWNED BY public.members_member.id;


--
-- Name: members_memberannualdues; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_memberannualdues (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    status text,
    amount_due numeric,
    fee_id bigint,
    member_id bigint
);


ALTER TABLE public.members_memberannualdues OWNER TO wagtail;

--
-- Name: members_memberannualdues_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_memberannualdues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_memberannualdues_id_seq OWNER TO wagtail;

--
-- Name: members_memberannualdues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_memberannualdues_id_seq OWNED BY public.members_memberannualdues.id;


--
-- Name: members_memberprofile; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_memberprofile (
    id bigint NOT NULL,
    member_no text,
    is_active_member boolean,
    user_id bigint
);


ALTER TABLE public.members_memberprofile OWNER TO wagtail;

--
-- Name: members_memberprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_memberprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_memberprofile_id_seq OWNER TO wagtail;

--
-- Name: members_memberprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_memberprofile_id_seq OWNED BY public.members_memberprofile.id;


--
-- Name: members_orgchartpage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_orgchartpage (
    page_ptr_id bigint NOT NULL,
    intro text
);


ALTER TABLE public.members_orgchartpage OWNER TO wagtail;

--
-- Name: members_orgchartsection; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_orgchartsection (
    id bigint NOT NULL,
    sort_order bigint,
    page_id bigint,
    section_id bigint
);


ALTER TABLE public.members_orgchartsection OWNER TO wagtail;

--
-- Name: members_orgchartsection_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_orgchartsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_orgchartsection_id_seq OWNER TO wagtail;

--
-- Name: members_orgchartsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_orgchartsection_id_seq OWNED BY public.members_orgchartsection.id;


--
-- Name: members_orgchartsectionmember; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_orgchartsectionmember (
    id bigint NOT NULL,
    sort_order bigint,
    member_id bigint,
    parent_id bigint
);


ALTER TABLE public.members_orgchartsectionmember OWNER TO wagtail;

--
-- Name: members_orgchartsectionmember_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_orgchartsectionmember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_orgchartsectionmember_id_seq OWNER TO wagtail;

--
-- Name: members_orgchartsectionmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_orgchartsectionmember_id_seq OWNED BY public.members_orgchartsectionmember.id;


--
-- Name: members_orgsection; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_orgsection (
    id bigint NOT NULL,
    title text
);


ALTER TABLE public.members_orgsection OWNER TO wagtail;

--
-- Name: members_orgsection_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_orgsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_orgsection_id_seq OWNER TO wagtail;

--
-- Name: members_orgsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_orgsection_id_seq OWNED BY public.members_orgsection.id;


--
-- Name: members_payment; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_payment (
    id text NOT NULL,
    amount numeric,
    method text,
    status text,
    reference text,
    note text,
    initiated_at timestamp with time zone,
    confirmed_at timestamp with time zone,
    dues_id bigint,
    provider text,
    payer_phone text,
    provider_reference text,
    external_id text,
    provider_status text,
    provider_payload text,
    failed_at text
);


ALTER TABLE public.members_payment OWNER TO wagtail;

--
-- Name: members_usermenufragment; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_usermenufragment (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.members_usermenufragment OWNER TO wagtail;

--
-- Name: members_usermenufragment_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_usermenufragment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_usermenufragment_id_seq OWNER TO wagtail;

--
-- Name: members_usermenufragment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_usermenufragment_id_seq OWNED BY public.members_usermenufragment.id;


--
-- Name: members_usermenufragmentitem; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.members_usermenufragmentitem (
    id bigint NOT NULL,
    sort_order bigint,
    label text,
    url text,
    only_staff boolean,
    open_in_new_tab boolean,
    fragment_id bigint
);


ALTER TABLE public.members_usermenufragmentitem OWNER TO wagtail;

--
-- Name: members_usermenufragmentitem_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.members_usermenufragmentitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_usermenufragmentitem_id_seq OWNER TO wagtail;

--
-- Name: members_usermenufragmentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.members_usermenufragmentitem_id_seq OWNED BY public.members_usermenufragmentitem.id;


--
-- Name: membres_annualfee; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_annualfee (
    id bigint NOT NULL,
    year integer,
    amount numeric,
    currency text,
    is_open boolean
);


ALTER TABLE public.membres_annualfee OWNER TO wagtail;

--
-- Name: membres_annualfee_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_annualfee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_annualfee_id_seq OWNER TO wagtail;

--
-- Name: membres_annualfee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_annualfee_id_seq OWNED BY public.membres_annualfee.id;


--
-- Name: membres_member; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_member (
    id bigint NOT NULL,
    role text,
    name text,
    subtitle text,
    photo_id bigint
);


ALTER TABLE public.membres_member OWNER TO wagtail;

--
-- Name: membres_member_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_member_id_seq OWNER TO wagtail;

--
-- Name: membres_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_member_id_seq OWNED BY public.membres_member.id;


--
-- Name: membres_memberannualdues; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_memberannualdues (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    status text,
    amount_due numeric,
    fee_id bigint,
    member_id bigint
);


ALTER TABLE public.membres_memberannualdues OWNER TO wagtail;

--
-- Name: membres_memberannualdues_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_memberannualdues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_memberannualdues_id_seq OWNER TO wagtail;

--
-- Name: membres_memberannualdues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_memberannualdues_id_seq OWNED BY public.membres_memberannualdues.id;


--
-- Name: membres_memberprofile; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_memberprofile (
    id bigint NOT NULL,
    member_no text,
    is_active_member boolean,
    user_id bigint
);


ALTER TABLE public.membres_memberprofile OWNER TO wagtail;

--
-- Name: membres_memberprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_memberprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_memberprofile_id_seq OWNER TO wagtail;

--
-- Name: membres_memberprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_memberprofile_id_seq OWNED BY public.membres_memberprofile.id;


--
-- Name: membres_orgchartpage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_orgchartpage (
    page_ptr_id bigint NOT NULL,
    intro text
);


ALTER TABLE public.membres_orgchartpage OWNER TO wagtail;

--
-- Name: membres_orgchartsection; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_orgchartsection (
    id bigint NOT NULL,
    sort_order bigint,
    page_id bigint,
    section_id bigint
);


ALTER TABLE public.membres_orgchartsection OWNER TO wagtail;

--
-- Name: membres_orgchartsection_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_orgchartsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_orgchartsection_id_seq OWNER TO wagtail;

--
-- Name: membres_orgchartsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_orgchartsection_id_seq OWNED BY public.membres_orgchartsection.id;


--
-- Name: membres_orgchartsectionmember; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_orgchartsectionmember (
    id bigint NOT NULL,
    sort_order bigint,
    member_id bigint,
    parent_id bigint
);


ALTER TABLE public.membres_orgchartsectionmember OWNER TO wagtail;

--
-- Name: membres_orgchartsectionmember_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_orgchartsectionmember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_orgchartsectionmember_id_seq OWNER TO wagtail;

--
-- Name: membres_orgchartsectionmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_orgchartsectionmember_id_seq OWNED BY public.membres_orgchartsectionmember.id;


--
-- Name: membres_orgsection; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_orgsection (
    id bigint NOT NULL,
    title text
);


ALTER TABLE public.membres_orgsection OWNER TO wagtail;

--
-- Name: membres_orgsection_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.membres_orgsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membres_orgsection_id_seq OWNER TO wagtail;

--
-- Name: membres_orgsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.membres_orgsection_id_seq OWNED BY public.membres_orgsection.id;


--
-- Name: membres_payment; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.membres_payment (
    id text NOT NULL,
    amount numeric,
    method text,
    status text,
    reference text,
    note text,
    initiated_at timestamp with time zone,
    confirmed_at timestamp with time zone,
    dues_id bigint
);


ALTER TABLE public.membres_payment OWNER TO wagtail;

--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider text,
    uid text,
    last_login timestamp with time zone,
    date_joined timestamp with time zone,
    user_id bigint,
    extra_data text
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO wagtail;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNER TO wagtail;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider text,
    name text,
    client_id text,
    secret text,
    key text,
    provider_id text,
    settings text
);


ALTER TABLE public.socialaccount_socialapp OWNER TO wagtail;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNER TO wagtail;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint,
    site_id bigint
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO wagtail;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNER TO wagtail;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text,
    token_secret text,
    expires_at timestamp with time zone,
    account_id bigint,
    app_id bigint
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO wagtail;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNER TO wagtail;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.taggit_tag (
    id bigint NOT NULL,
    name text,
    slug text
);


ALTER TABLE public.taggit_tag OWNER TO wagtail;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taggit_tag_id_seq OWNER TO wagtail;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.taggit_taggeditem (
    id bigint NOT NULL,
    object_id bigint,
    content_type_id bigint,
    tag_id bigint
);


ALTER TABLE public.taggit_taggeditem OWNER TO wagtail;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNER TO wagtail;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: wagtailadmin_admin; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailadmin_admin (
    id bigint NOT NULL
);


ALTER TABLE public.wagtailadmin_admin OWNER TO wagtail;

--
-- Name: wagtailadmin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailadmin_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailadmin_admin_id_seq OWNER TO wagtail;

--
-- Name: wagtailadmin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailadmin_admin_id_seq OWNED BY public.wagtailadmin_admin.id;


--
-- Name: wagtailadmin_editingsession; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailadmin_editingsession (
    id bigint NOT NULL,
    object_id text,
    last_seen_at timestamp with time zone,
    content_type_id bigint,
    user_id bigint,
    is_editing boolean
);


ALTER TABLE public.wagtailadmin_editingsession OWNER TO wagtail;

--
-- Name: wagtailadmin_editingsession_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailadmin_editingsession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailadmin_editingsession_id_seq OWNER TO wagtail;

--
-- Name: wagtailadmin_editingsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailadmin_editingsession_id_seq OWNED BY public.wagtailadmin_editingsession.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_collection (
    id bigint NOT NULL,
    path text,
    depth integer,
    numchild integer,
    name text
);


ALTER TABLE public.wagtailcore_collection OWNER TO wagtail;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNED BY public.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_collectionviewrestriction (
    id bigint NOT NULL,
    restriction_type text,
    password text,
    collection_id bigint
);


ALTER TABLE public.wagtailcore_collectionviewrestriction OWNER TO wagtail;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_collectionviewrestriction_groups (
    id bigint NOT NULL,
    collectionviewrestriction_id bigint,
    group_id bigint
);


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups OWNER TO wagtail;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY public.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNED BY public.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_comment; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_comment (
    id bigint NOT NULL,
    text text,
    contentpath text,
    "position" text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    resolved_at timestamp with time zone,
    page_id bigint,
    resolved_by_id bigint,
    revision_created_id bigint,
    user_id bigint
);


ALTER TABLE public.wagtailcore_comment OWNER TO wagtail;

--
-- Name: wagtailcore_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_comment_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_comment_id_seq OWNED BY public.wagtailcore_comment.id;


--
-- Name: wagtailcore_commentreply; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_commentreply (
    id bigint NOT NULL,
    text text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    comment_id bigint,
    user_id bigint
);


ALTER TABLE public.wagtailcore_commentreply OWNER TO wagtail;

--
-- Name: wagtailcore_commentreply_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_commentreply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_commentreply_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_commentreply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_commentreply_id_seq OWNED BY public.wagtailcore_commentreply.id;


--
-- Name: wagtailcore_groupapprovaltask; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_groupapprovaltask (
    task_ptr_id bigint NOT NULL
);


ALTER TABLE public.wagtailcore_groupapprovaltask OWNER TO wagtail;

--
-- Name: wagtailcore_groupapprovaltask_groups; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_groupapprovaltask_groups (
    id bigint NOT NULL,
    groupapprovaltask_id bigint,
    group_id bigint
);


ALTER TABLE public.wagtailcore_groupapprovaltask_groups OWNER TO wagtail;

--
-- Name: wagtailcore_groupapprovaltask_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_groupapprovaltask_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_groupapprovaltask_groups_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_groupapprovaltask_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_groupapprovaltask_groups_id_seq OWNED BY public.wagtailcore_groupapprovaltask_groups.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_groupcollectionpermission (
    id bigint NOT NULL,
    collection_id bigint,
    group_id bigint,
    permission_id bigint
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO wagtail;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNED BY public.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_grouppagepermission (
    id bigint NOT NULL,
    group_id bigint,
    page_id bigint,
    permission_id bigint
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO wagtail;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNED BY public.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_groupsitepermission; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_groupsitepermission (
    id bigint NOT NULL,
    group_id bigint,
    permission_id bigint,
    site_id bigint
);


ALTER TABLE public.wagtailcore_groupsitepermission OWNER TO wagtail;

--
-- Name: wagtailcore_groupsitepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_groupsitepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_groupsitepermission_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_groupsitepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_groupsitepermission_id_seq OWNED BY public.wagtailcore_groupsitepermission.id;


--
-- Name: wagtailcore_locale; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_locale (
    id bigint NOT NULL,
    language_code text
);


ALTER TABLE public.wagtailcore_locale OWNER TO wagtail;

--
-- Name: wagtailcore_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_locale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_locale_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_locale_id_seq OWNED BY public.wagtailcore_locale.id;


--
-- Name: wagtailcore_modellogentry; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_modellogentry (
    id bigint NOT NULL,
    label text,
    action text,
    "timestamp" timestamp with time zone,
    content_changed boolean,
    deleted boolean,
    object_id text,
    content_type_id bigint,
    user_id bigint,
    uuid text,
    revision_id bigint,
    data text
);


ALTER TABLE public.wagtailcore_modellogentry OWNER TO wagtail;

--
-- Name: wagtailcore_modellogentry_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_modellogentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_modellogentry_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_modellogentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_modellogentry_id_seq OWNED BY public.wagtailcore_modellogentry.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_page (
    id bigint NOT NULL,
    path text,
    depth integer,
    numchild integer,
    title text,
    slug text,
    live boolean,
    has_unpublished_changes boolean,
    url_path text,
    seo_title text,
    show_in_menus boolean,
    search_description text,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean,
    content_type_id bigint,
    owner_id bigint,
    locked boolean,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id bigint,
    last_published_at timestamp with time zone,
    draft_title text,
    locked_at timestamp with time zone,
    locked_by_id bigint,
    locale_id bigint,
    translation_key text,
    alias_of_id bigint,
    latest_revision_id bigint
);


ALTER TABLE public.wagtailcore_page OWNER TO wagtail;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_page_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_page_id_seq OWNED BY public.wagtailcore_page.id;


--
-- Name: wagtailcore_pagelogentry; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_pagelogentry (
    id bigint NOT NULL,
    label text,
    action text,
    "timestamp" timestamp with time zone,
    content_changed boolean,
    deleted boolean,
    content_type_id bigint,
    page_id bigint,
    revision_id bigint,
    user_id bigint,
    uuid text,
    data text
);


ALTER TABLE public.wagtailcore_pagelogentry OWNER TO wagtail;

--
-- Name: wagtailcore_pagelogentry_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_pagelogentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_pagelogentry_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_pagelogentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_pagelogentry_id_seq OWNED BY public.wagtailcore_pagelogentry.id;


--
-- Name: wagtailcore_pagesubscription; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_pagesubscription (
    id bigint NOT NULL,
    comment_notifications boolean,
    page_id bigint,
    user_id bigint
);


ALTER TABLE public.wagtailcore_pagesubscription OWNER TO wagtail;

--
-- Name: wagtailcore_pagesubscription_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_pagesubscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_pagesubscription_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_pagesubscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_pagesubscription_id_seq OWNED BY public.wagtailcore_pagesubscription.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_pageviewrestriction (
    id bigint NOT NULL,
    password text,
    page_id bigint,
    restriction_type text
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO wagtail;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_pageviewrestriction_groups (
    id bigint NOT NULL,
    pageviewrestriction_id bigint,
    group_id bigint
);


ALTER TABLE public.wagtailcore_pageviewrestriction_groups OWNER TO wagtail;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY public.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNED BY public.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_referenceindex; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_referenceindex (
    id bigint NOT NULL,
    object_id text,
    to_object_id text,
    model_path text,
    content_path text,
    content_path_hash text,
    base_content_type_id bigint,
    content_type_id bigint,
    to_content_type_id bigint
);


ALTER TABLE public.wagtailcore_referenceindex OWNER TO wagtail;

--
-- Name: wagtailcore_referenceindex_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_referenceindex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_referenceindex_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_referenceindex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_referenceindex_id_seq OWNED BY public.wagtailcore_referenceindex.id;


--
-- Name: wagtailcore_revision; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_revision (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    approved_go_live_at timestamp with time zone,
    user_id bigint,
    content text,
    object_id text,
    content_type_id bigint,
    base_content_type_id bigint,
    object_str text
);


ALTER TABLE public.wagtailcore_revision OWNER TO wagtail;

--
-- Name: wagtailcore_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_revision_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_revision_id_seq OWNED BY public.wagtailcore_revision.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_site (
    id bigint NOT NULL,
    hostname text,
    port bigint,
    is_default_site boolean,
    root_page_id bigint,
    site_name text
);


ALTER TABLE public.wagtailcore_site OWNER TO wagtail;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_site_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_site_id_seq OWNED BY public.wagtailcore_site.id;


--
-- Name: wagtailcore_task; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_task (
    id bigint NOT NULL,
    name text,
    active boolean,
    content_type_id bigint
);


ALTER TABLE public.wagtailcore_task OWNER TO wagtail;

--
-- Name: wagtailcore_task_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_task_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_task_id_seq OWNED BY public.wagtailcore_task.id;


--
-- Name: wagtailcore_taskstate; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_taskstate (
    id bigint NOT NULL,
    status text,
    started_at timestamp with time zone,
    finished_at timestamp with time zone,
    content_type_id bigint,
    task_id bigint,
    workflow_state_id bigint,
    finished_by_id bigint,
    comment text,
    revision_id bigint
);


ALTER TABLE public.wagtailcore_taskstate OWNER TO wagtail;

--
-- Name: wagtailcore_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_taskstate_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_taskstate_id_seq OWNED BY public.wagtailcore_taskstate.id;


--
-- Name: wagtailcore_uploadedfile; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_uploadedfile (
    id bigint NOT NULL,
    file text,
    for_content_type_id bigint,
    uploaded_by_user_id bigint
);


ALTER TABLE public.wagtailcore_uploadedfile OWNER TO wagtail;

--
-- Name: wagtailcore_uploadedfile_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_uploadedfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_uploadedfile_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_uploadedfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_uploadedfile_id_seq OWNED BY public.wagtailcore_uploadedfile.id;


--
-- Name: wagtailcore_workflow; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_workflow (
    id bigint NOT NULL,
    name text,
    active boolean
);


ALTER TABLE public.wagtailcore_workflow OWNER TO wagtail;

--
-- Name: wagtailcore_workflow_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_workflow_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_workflow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_workflow_id_seq OWNED BY public.wagtailcore_workflow.id;


--
-- Name: wagtailcore_workflowcontenttype; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_workflowcontenttype (
    content_type_id bigint NOT NULL,
    workflow_id bigint
);


ALTER TABLE public.wagtailcore_workflowcontenttype OWNER TO wagtail;

--
-- Name: wagtailcore_workflowpage; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_workflowpage (
    page_id bigint NOT NULL,
    workflow_id bigint
);


ALTER TABLE public.wagtailcore_workflowpage OWNER TO wagtail;

--
-- Name: wagtailcore_workflowstate; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_workflowstate (
    id bigint NOT NULL,
    status text,
    created_at timestamp with time zone,
    current_task_state_id bigint,
    requested_by_id bigint,
    workflow_id bigint,
    object_id text,
    base_content_type_id bigint,
    content_type_id bigint
);


ALTER TABLE public.wagtailcore_workflowstate OWNER TO wagtail;

--
-- Name: wagtailcore_workflowstate_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_workflowstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_workflowstate_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_workflowstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_workflowstate_id_seq OWNED BY public.wagtailcore_workflowstate.id;


--
-- Name: wagtailcore_workflowtask; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailcore_workflowtask (
    id bigint NOT NULL,
    sort_order bigint,
    task_id bigint,
    workflow_id bigint
);


ALTER TABLE public.wagtailcore_workflowtask OWNER TO wagtail;

--
-- Name: wagtailcore_workflowtask_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailcore_workflowtask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailcore_workflowtask_id_seq OWNER TO wagtail;

--
-- Name: wagtailcore_workflowtask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailcore_workflowtask_id_seq OWNED BY public.wagtailcore_workflowtask.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtaildocs_document (
    id bigint NOT NULL,
    title text,
    file text,
    created_at timestamp with time zone,
    uploaded_by_user_id bigint,
    collection_id bigint,
    file_hash text,
    file_size bigint
);


ALTER TABLE public.wagtaildocs_document OWNER TO wagtail;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNER TO wagtail;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNED BY public.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailembeds_embed (
    id bigint NOT NULL,
    url text,
    max_width smallint,
    type text,
    html text,
    title text,
    author_name text,
    provider_name text,
    width bigint,
    height bigint,
    last_updated timestamp with time zone,
    hash text,
    thumbnail_url text,
    cache_until timestamp with time zone
);


ALTER TABLE public.wagtailembeds_embed OWNER TO wagtail;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNER TO wagtail;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNED BY public.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailforms_formsubmission (
    id bigint NOT NULL,
    submit_time timestamp with time zone,
    page_id bigint,
    form_data text
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO wagtail;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNER TO wagtail;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNED BY public.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailimages_image (
    id bigint NOT NULL,
    title text,
    file text,
    width bigint,
    height bigint,
    created_at timestamp with time zone,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id bigint,
    file_size integer,
    collection_id bigint,
    file_hash text,
    description text
);


ALTER TABLE public.wagtailimages_image OWNER TO wagtail;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailimages_image_id_seq OWNER TO wagtail;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailimages_image_id_seq OWNED BY public.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailimages_rendition (
    id bigint NOT NULL,
    width bigint,
    height bigint,
    focal_point_key text,
    filter_spec text,
    image_id bigint,
    file text
);


ALTER TABLE public.wagtailimages_rendition OWNER TO wagtail;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNER TO wagtail;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNED BY public.wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailredirects_redirect (
    id bigint NOT NULL,
    old_path text,
    is_permanent boolean,
    redirect_link text,
    redirect_page_id bigint,
    site_id bigint,
    automatically_created boolean,
    created_at timestamp with time zone,
    redirect_page_route_path text
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO wagtail;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNER TO wagtail;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNED BY public.wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_indexentry; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry (
    id bigint NOT NULL,
    object_id text,
    title_norm real,
    content_type_id bigint,
    autocomplete text,
    body text,
    title text
);


ALTER TABLE public.wagtailsearch_indexentry OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_fts; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry_fts (
    autocomplete text,
    body text,
    title text
);


ALTER TABLE public.wagtailsearch_indexentry_fts OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_fts_config; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry_fts_config (
    k text NOT NULL,
    v text
);


ALTER TABLE public.wagtailsearch_indexentry_fts_config OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_fts_content; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry_fts_content (
    id bigint NOT NULL,
    c0 text,
    c1 text,
    c2 text
);


ALTER TABLE public.wagtailsearch_indexentry_fts_content OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_fts_data; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry_fts_data (
    id bigint NOT NULL,
    block bytea
);


ALTER TABLE public.wagtailsearch_indexentry_fts_data OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_fts_docsize; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry_fts_docsize (
    id bigint NOT NULL,
    sz bytea
);


ALTER TABLE public.wagtailsearch_indexentry_fts_docsize OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_fts_idx; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailsearch_indexentry_fts_idx (
    segid text NOT NULL,
    term text NOT NULL,
    pgno text
);


ALTER TABLE public.wagtailsearch_indexentry_fts_idx OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailsearch_indexentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailsearch_indexentry_id_seq OWNER TO wagtail;

--
-- Name: wagtailsearch_indexentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailsearch_indexentry_id_seq OWNED BY public.wagtailsearch_indexentry.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: wagtail
--

CREATE TABLE public.wagtailusers_userprofile (
    id bigint NOT NULL,
    submitted_notifications boolean,
    approved_notifications boolean,
    rejected_notifications boolean,
    user_id bigint,
    preferred_language text,
    current_time_zone text,
    avatar text,
    updated_comments_notifications boolean,
    dismissibles text,
    theme text,
    density text,
    contrast text,
    keyboard_shortcuts boolean
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO wagtail;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: wagtail
--

CREATE SEQUENCE public.wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNER TO wagtail;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wagtail
--

ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNED BY public.wagtailusers_userprofile.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: bibliotheque_bibliothequeitem id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequeitem ALTER COLUMN id SET DEFAULT nextval('public.bibliotheque_bibliothequeitem_id_seq'::regclass);


--
-- Name: bibliotheque_documentcategory id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_documentcategory ALTER COLUMN id SET DEFAULT nextval('public.bibliotheque_documentcategory_id_seq'::regclass);


--
-- Name: blog_blogcategory id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogcategory ALTER COLUMN id SET DEFAULT nextval('public.blog_blogcategory_id_seq'::regclass);


--
-- Name: blog_blogpage_categories id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage_categories ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpage_categories_id_seq'::regclass);


--
-- Name: blog_blogpagetag id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpagetag ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpagetag_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: home_footersettings id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_footersettings ALTER COLUMN id SET DEFAULT nextval('public.home_footersettings_id_seq'::regclass);


--
-- Name: home_footertext id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_footertext ALTER COLUMN id SET DEFAULT nextval('public.home_footertext_id_seq'::regclass);


--
-- Name: home_homeheroslide id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homeheroslide ALTER COLUMN id SET DEFAULT nextval('public.home_homeheroslide_id_seq'::regclass);


--
-- Name: home_homequicklink id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homequicklink ALTER COLUMN id SET DEFAULT nextval('public.home_homequicklink_id_seq'::regclass);


--
-- Name: home_menu id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_menu ALTER COLUMN id SET DEFAULT nextval('public.home_menu_id_seq'::regclass);


--
-- Name: home_menuitem id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_menuitem ALTER COLUMN id SET DEFAULT nextval('public.home_menuitem_id_seq'::regclass);


--
-- Name: home_submenuitem id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_submenuitem ALTER COLUMN id SET DEFAULT nextval('public.home_submenuitem_id_seq'::regclass);


--
-- Name: members_annualfee id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_annualfee ALTER COLUMN id SET DEFAULT nextval('public.members_annualfee_id_seq'::regclass);


--
-- Name: members_member id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_member ALTER COLUMN id SET DEFAULT nextval('public.members_member_id_seq'::regclass);


--
-- Name: members_memberannualdues id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberannualdues ALTER COLUMN id SET DEFAULT nextval('public.members_memberannualdues_id_seq'::regclass);


--
-- Name: members_memberprofile id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberprofile ALTER COLUMN id SET DEFAULT nextval('public.members_memberprofile_id_seq'::regclass);


--
-- Name: members_orgchartsection id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsection ALTER COLUMN id SET DEFAULT nextval('public.members_orgchartsection_id_seq'::regclass);


--
-- Name: members_orgchartsectionmember id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsectionmember ALTER COLUMN id SET DEFAULT nextval('public.members_orgchartsectionmember_id_seq'::regclass);


--
-- Name: members_orgsection id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgsection ALTER COLUMN id SET DEFAULT nextval('public.members_orgsection_id_seq'::regclass);


--
-- Name: members_usermenufragment id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_usermenufragment ALTER COLUMN id SET DEFAULT nextval('public.members_usermenufragment_id_seq'::regclass);


--
-- Name: members_usermenufragmentitem id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_usermenufragmentitem ALTER COLUMN id SET DEFAULT nextval('public.members_usermenufragmentitem_id_seq'::regclass);


--
-- Name: membres_annualfee id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_annualfee ALTER COLUMN id SET DEFAULT nextval('public.membres_annualfee_id_seq'::regclass);


--
-- Name: membres_member id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_member ALTER COLUMN id SET DEFAULT nextval('public.membres_member_id_seq'::regclass);


--
-- Name: membres_memberannualdues id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberannualdues ALTER COLUMN id SET DEFAULT nextval('public.membres_memberannualdues_id_seq'::regclass);


--
-- Name: membres_memberprofile id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberprofile ALTER COLUMN id SET DEFAULT nextval('public.membres_memberprofile_id_seq'::regclass);


--
-- Name: membres_orgchartsection id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsection ALTER COLUMN id SET DEFAULT nextval('public.membres_orgchartsection_id_seq'::regclass);


--
-- Name: membres_orgchartsectionmember id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsectionmember ALTER COLUMN id SET DEFAULT nextval('public.membres_orgchartsectionmember_id_seq'::regclass);


--
-- Name: membres_orgsection id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgsection ALTER COLUMN id SET DEFAULT nextval('public.membres_orgsection_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: wagtailadmin_admin id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailadmin_admin ALTER COLUMN id SET DEFAULT nextval('public.wagtailadmin_admin_id_seq'::regclass);


--
-- Name: wagtailadmin_editingsession id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailadmin_editingsession ALTER COLUMN id SET DEFAULT nextval('public.wagtailadmin_editingsession_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_comment id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_comment ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_comment_id_seq'::regclass);


--
-- Name: wagtailcore_commentreply id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_commentreply ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_commentreply_id_seq'::regclass);


--
-- Name: wagtailcore_groupapprovaltask_groups id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupapprovaltask_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupapprovaltask_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_groupsitepermission id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupsitepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupsitepermission_id_seq'::regclass);


--
-- Name: wagtailcore_locale id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_locale ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_locale_id_seq'::regclass);


--
-- Name: wagtailcore_modellogentry id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_modellogentry ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_modellogentry_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagelogentry id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagelogentry ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagelogentry_id_seq'::regclass);


--
-- Name: wagtailcore_pagesubscription id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagesubscription ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagesubscription_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_referenceindex id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_referenceindex ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_referenceindex_id_seq'::regclass);


--
-- Name: wagtailcore_revision id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_revision ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_revision_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtailcore_task id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_task ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_task_id_seq'::regclass);


--
-- Name: wagtailcore_taskstate id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_taskstate_id_seq'::regclass);


--
-- Name: wagtailcore_uploadedfile id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_uploadedfile ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_uploadedfile_id_seq'::regclass);


--
-- Name: wagtailcore_workflow id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflow ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_workflow_id_seq'::regclass);


--
-- Name: wagtailcore_workflowstate id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_workflowstate_id_seq'::regclass);


--
-- Name: wagtailcore_workflowtask id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowtask ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_workflowtask_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('public.wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('public.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('public.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('public.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_indexentry id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_indexentry_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('public.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.account_emailaddress (id, verified, "primary", user_id, email, name) FROM stdin;
1	t	t	1	root@root.com	\N
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: adhesions_application; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.adhesions_application (id, created_at, updated_at, reference, application_type, status, first_name, last_name, date_of_birth, place_of_birth, gender, nationality, phone, email, address, profession, specialization, employer, professional_address, biography, submitted_at, reviewed_at, internal_comment, assigned_to_id, candidate_id) FROM stdin;
\.


--
-- Data for Name: adhesions_applicationcomment; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.adhesions_applicationcomment (id, created_at, updated_at, is_internal, message, application_id, author_id) FROM stdin;
\.


--
-- Data for Name: adhesions_applicationdocument; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.adhesions_applicationdocument (id, created_at, updated_at, document_type, file, original_filename, status, rejection_reason, checked_at, application_id, checked_by_id) FROM stdin;
\.


--
-- Data for Name: adhesions_applicationstatushistory; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.adhesions_applicationstatushistory (id, created_at, updated_at, old_status, new_status, comment, application_id, changed_by_id) FROM stdin;
\.


--
-- Data for Name: adhesions_candidateprofile; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.adhesions_candidateprofile (id, created_at, updated_at, first_name, last_name, date_of_birth, place_of_birth, gender, nationality, phone, email, address, city, country, user_id) FROM stdin;
\.


--
-- Data for Name: adhesions_membershipprofile; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.adhesions_membershipprofile (id, role, is_active_for_membership, user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	2	1
2	1	1
3	2	106
4	2	107
5	2	108
6	1	106
7	1	107
8	1	108
9	2	109
10	1	109
11	2	112
12	2	110
13	2	111
14	1	112
15	1	110
16	1	111
17	2	113
18	1	113
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.auth_permission (id, content_type_id, codename, name) FROM stdin;
1	2	access_admin	Can access Wagtail admin
2	4	add_locale	Can add locale
3	4	change_locale	Can change locale
4	4	delete_locale	Can delete locale
5	4	view_locale	Can view locale
6	5	add_site	Can add site
7	5	change_site	Can change site
8	5	delete_site	Can delete site
9	5	view_site	Can view site
10	6	add_groupsitepermission	Can add group site permission
11	6	change_groupsitepermission	Can change group site permission
12	6	delete_groupsitepermission	Can delete group site permission
13	6	view_groupsitepermission	Can view group site permission
14	7	add_modellogentry	Can add model log entry
15	7	change_modellogentry	Can change model log entry
16	7	delete_modellogentry	Can delete model log entry
17	7	view_modellogentry	Can view model log entry
18	8	add_revision	Can add revision
19	8	change_revision	Can change revision
20	8	delete_revision	Can delete revision
21	8	view_revision	Can view revision
22	9	add_collectionviewrestriction	Can add collection view restriction
23	9	change_collectionviewrestriction	Can change collection view restriction
24	9	delete_collectionviewrestriction	Can delete collection view restriction
25	9	view_collectionviewrestriction	Can view collection view restriction
26	10	add_collection	Can add collection
27	10	change_collection	Can change collection
28	10	delete_collection	Can delete collection
29	10	view_collection	Can view collection
30	11	add_groupcollectionpermission	Can add group collection permission
31	11	change_groupcollectionpermission	Can change group collection permission
32	11	delete_groupcollectionpermission	Can delete group collection permission
33	11	view_groupcollectionpermission	Can view group collection permission
34	12	add_uploadedfile	Can add uploaded file
35	12	change_uploadedfile	Can change uploaded file
36	12	delete_uploadedfile	Can delete uploaded file
37	12	view_uploadedfile	Can view uploaded file
38	13	add_workflowcontenttype	Can add workflow content type
39	13	change_workflowcontenttype	Can change workflow content type
40	13	delete_workflowcontenttype	Can delete workflow content type
41	13	view_workflowcontenttype	Can view workflow content type
42	14	add_workflowstate	Can add Workflow state
43	14	change_workflowstate	Can change Workflow state
44	14	delete_workflowstate	Can delete Workflow state
45	14	view_workflowstate	Can view Workflow state
46	15	add_workflow	Can add workflow
47	15	change_workflow	Can change workflow
48	15	delete_workflow	Can delete workflow
49	15	view_workflow	Can view workflow
50	16	add_workflowtask	Can add workflow task order
51	16	change_workflowtask	Can change workflow task order
52	16	delete_workflowtask	Can delete workflow task order
53	16	view_workflowtask	Can view workflow task order
54	17	add_task	Can add task
55	17	change_task	Can change task
56	17	delete_task	Can delete task
57	17	view_task	Can view task
58	3	add_groupapprovaltask	Can add Group approval task
59	3	change_groupapprovaltask	Can change Group approval task
60	3	delete_groupapprovaltask	Can delete Group approval task
61	3	view_groupapprovaltask	Can view Group approval task
62	18	add_taskstate	Can add Task state
63	18	change_taskstate	Can change Task state
64	18	delete_taskstate	Can delete Task state
65	18	view_taskstate	Can view Task state
66	1	add_page	Can add page
67	1	change_page	Can change page
68	1	delete_page	Can delete page
69	1	view_page	Can view page
70	1	bulk_delete_page	Delete pages with children
71	1	lock_page	Lock/unlock pages you've locked
72	1	publish_page	Publish any page
73	1	unlock_page	Unlock any page
74	19	add_grouppagepermission	Can add group page permission
75	19	change_grouppagepermission	Can change group page permission
76	19	delete_grouppagepermission	Can delete group page permission
77	19	view_grouppagepermission	Can view group page permission
78	20	add_pageviewrestriction	Can add page view restriction
79	20	change_pageviewrestriction	Can change page view restriction
80	20	delete_pageviewrestriction	Can delete page view restriction
81	20	view_pageviewrestriction	Can view page view restriction
82	21	add_workflowpage	Can add workflow page
83	21	change_workflowpage	Can change workflow page
84	21	delete_workflowpage	Can delete workflow page
85	21	view_workflowpage	Can view workflow page
86	22	add_pagelogentry	Can add page log entry
87	22	change_pagelogentry	Can change page log entry
88	22	delete_pagelogentry	Can delete page log entry
89	22	view_pagelogentry	Can view page log entry
90	23	add_comment	Can add comment
91	23	change_comment	Can change comment
92	23	delete_comment	Can delete comment
93	23	view_comment	Can view comment
94	24	add_commentreply	Can add comment reply
95	24	change_commentreply	Can change comment reply
96	24	delete_commentreply	Can delete comment reply
97	24	view_commentreply	Can view comment reply
98	25	add_pagesubscription	Can add page subscription
99	25	change_pagesubscription	Can change page subscription
100	25	delete_pagesubscription	Can delete page subscription
101	25	view_pagesubscription	Can view page subscription
102	26	add_referenceindex	Can add reference index
103	26	change_referenceindex	Can change reference index
104	26	delete_referenceindex	Can delete reference index
105	26	view_referenceindex	Can view reference index
106	27	add_document	Can add document
107	27	change_document	Can change document
108	27	delete_document	Can delete document
109	27	choose_document	Can choose document
110	28	add_image	Can add image
111	28	change_image	Can change image
112	28	delete_image	Can delete image
113	28	choose_image	Can choose image
114	29	add_formsubmission	Can add form submission
115	29	change_formsubmission	Can change form submission
116	29	delete_formsubmission	Can delete form submission
117	29	view_formsubmission	Can view form submission
118	30	add_redirect	Can add redirect
119	30	change_redirect	Can change redirect
120	30	delete_redirect	Can delete redirect
121	30	view_redirect	Can view redirect
122	31	add_embed	Can add embed
123	31	change_embed	Can change embed
124	31	delete_embed	Can delete embed
125	31	view_embed	Can view embed
126	32	add_userprofile	Can add user profile
127	32	change_userprofile	Can change user profile
128	32	delete_userprofile	Can delete user profile
129	32	view_userprofile	Can view user profile
130	27	view_document	Can view document
131	28	view_image	Can view image
132	35	add_rendition	Can add rendition
133	35	change_rendition	Can change rendition
134	35	delete_rendition	Can delete rendition
135	35	view_rendition	Can view rendition
136	36	add_indexentry	Can add index entry
137	36	change_indexentry	Can change index entry
138	36	delete_indexentry	Can delete index entry
139	36	view_indexentry	Can view index entry
140	37	add_sqliteftsindexentry	Can add sqliteftsindexentry
141	37	change_sqliteftsindexentry	Can change sqliteftsindexentry
142	37	delete_sqliteftsindexentry	Can delete sqliteftsindexentry
143	37	view_sqliteftsindexentry	Can view sqliteftsindexentry
144	38	add_editingsession	Can add editing session
145	38	change_editingsession	Can change editing session
146	38	delete_editingsession	Can delete editing session
147	38	view_editingsession	Can view editing session
148	39	add_tag	Can add tag
149	39	change_tag	Can change tag
150	39	delete_tag	Can delete tag
151	39	view_tag	Can view tag
152	40	add_taggeditem	Can add tagged item
153	40	change_taggeditem	Can change tagged item
154	40	delete_taggeditem	Can delete tagged item
155	40	view_taggeditem	Can view tagged item
156	41	add_logentry	Can add log entry
157	41	change_logentry	Can change log entry
158	41	delete_logentry	Can delete log entry
159	41	view_logentry	Can view log entry
160	42	add_permission	Can add permission
161	42	change_permission	Can change permission
162	42	delete_permission	Can delete permission
163	42	view_permission	Can view permission
164	43	add_group	Can add group
165	43	change_group	Can change group
166	43	delete_group	Can delete group
167	43	view_group	Can view group
168	44	add_user	Can add user
169	44	change_user	Can change user
170	44	delete_user	Can delete user
171	44	view_user	Can view user
172	45	add_contenttype	Can add content type
173	45	change_contenttype	Can change content type
174	45	delete_contenttype	Can delete content type
175	45	view_contenttype	Can view content type
176	46	add_session	Can add session
177	46	change_session	Can change session
178	46	delete_session	Can delete session
179	46	view_session	Can view session
180	33	add_footertext	Can add footer text
181	33	change_footertext	Can change footer text
182	33	delete_footertext	Can delete footer text
183	33	view_footertext	Can view footer text
184	47	add_submenuitem	Can add sub menu item
185	47	change_submenuitem	Can change sub menu item
186	47	delete_submenuitem	Can delete sub menu item
187	47	view_submenuitem	Can view sub menu item
188	48	add_menuitem	Can add menu item
189	48	change_menuitem	Can change menu item
190	48	delete_menuitem	Can delete menu item
191	48	view_menuitem	Can view menu item
192	34	add_menu	Can add menu
193	34	change_menu	Can change menu
194	34	delete_menu	Can delete menu
195	34	view_menu	Can view menu
196	49	add_homepage	Can add home page
197	49	change_homepage	Can change home page
198	49	delete_homepage	Can delete home page
199	49	view_homepage	Can view home page
200	50	add_blogindexpage	Can add blog index page
201	50	change_blogindexpage	Can change blog index page
202	50	delete_blogindexpage	Can delete blog index page
203	50	view_blogindexpage	Can view blog index page
204	51	add_blogpage	Can add blog page
205	51	change_blogpage	Can change blog page
206	51	delete_blogpage	Can delete blog page
207	51	view_blogpage	Can view blog page
208	52	add_footersettings	Can add footer settings
209	52	change_footersettings	Can change footer settings
210	52	delete_footersettings	Can delete footer settings
211	52	view_footersettings	Can view footer settings
212	55	add_orgchartsectionmember	Can add org chart section member
213	55	change_orgchartsectionmember	Can change org chart section member
214	55	delete_orgchartsectionmember	Can delete org chart section member
215	55	view_orgchartsectionmember	Can view org chart section member
216	54	add_orgsection	Can add org section
217	54	change_orgsection	Can change org section
218	54	delete_orgsection	Can delete org section
219	54	view_orgsection	Can view org section
220	56	add_orgchartsection	Can add org chart section
221	56	change_orgchartsection	Can change org chart section
222	56	delete_orgchartsection	Can delete org chart section
223	56	view_orgchartsection	Can view org chart section
224	57	add_orgchartpage	Can add org chart page
225	57	change_orgchartpage	Can change org chart page
226	57	delete_orgchartpage	Can delete org chart page
227	57	view_orgchartpage	Can view org chart page
228	53	add_member	Can add member
229	53	change_member	Can change member
230	53	delete_member	Can delete member
231	53	view_member	Can view member
232	58	add_standardpage	Can add standard page
233	58	change_standardpage	Can change standard page
234	58	delete_standardpage	Can delete standard page
235	58	view_standardpage	Can view standard page
236	60	add_bibliothequeitem	Can add bibliotheque item
237	60	change_bibliothequeitem	Can change bibliotheque item
238	60	delete_bibliothequeitem	Can delete bibliotheque item
239	60	view_bibliothequeitem	Can view bibliotheque item
240	59	add_documentcategory	Can add Catégorie de document
241	59	change_documentcategory	Can change Catégorie de document
242	59	delete_documentcategory	Can delete Catégorie de document
243	59	view_documentcategory	Can view Catégorie de document
244	61	add_bibliothequepage	Can add bibliotheque page
245	61	change_bibliothequepage	Can change bibliotheque page
246	61	delete_bibliothequepage	Can delete bibliotheque page
247	61	view_bibliothequepage	Can view bibliotheque page
248	62	add_site	Can add site
249	62	change_site	Can change site
250	62	delete_site	Can delete site
251	62	view_site	Can view site
252	63	add_emailaddress	Can add email address
253	63	change_emailaddress	Can change email address
254	63	delete_emailaddress	Can delete email address
255	63	view_emailaddress	Can view email address
256	64	add_emailconfirmation	Can add email confirmation
257	64	change_emailconfirmation	Can change email confirmation
258	64	delete_emailconfirmation	Can delete email confirmation
259	64	view_emailconfirmation	Can view email confirmation
260	65	add_socialaccount	Can add social account
261	65	change_socialaccount	Can change social account
262	65	delete_socialaccount	Can delete social account
263	65	view_socialaccount	Can view social account
264	66	add_socialapp	Can add social application
265	66	change_socialapp	Can change social application
266	66	delete_socialapp	Can delete social application
267	66	view_socialapp	Can view social application
268	67	add_socialtoken	Can add social application token
269	67	change_socialtoken	Can change social application token
270	67	delete_socialtoken	Can delete social application token
271	67	view_socialtoken	Can view social application token
272	68	add_blogcategory	Can add blog category
273	68	change_blogcategory	Can change blog category
274	68	delete_blogcategory	Can delete blog category
275	68	view_blogcategory	Can view blog category
276	69	add_blogpagetag	Can add blog page tag
277	69	change_blogpagetag	Can change blog page tag
278	69	delete_blogpagetag	Can delete blog page tag
279	69	view_blogpagetag	Can view blog page tag
280	70	add_homeheroslide	Can add home hero slide
281	70	change_homeheroslide	Can change home hero slide
282	70	delete_homeheroslide	Can delete home hero slide
283	70	view_homeheroslide	Can view home hero slide
284	71	add_homequicklink	Can add home quick link
285	71	change_homequicklink	Can change home quick link
286	71	delete_homequicklink	Can delete home quick link
287	71	view_homequicklink	Can view home quick link
288	72	add_memberannualdues	Can add member annual dues
289	72	change_memberannualdues	Can change member annual dues
290	72	delete_memberannualdues	Can delete member annual dues
291	72	view_memberannualdues	Can view member annual dues
292	73	add_payment	Can add payment
293	73	change_payment	Can change payment
294	73	delete_payment	Can delete payment
295	73	view_payment	Can view payment
296	74	add_memberprofile	Can add member profile
297	74	change_memberprofile	Can change member profile
298	74	delete_memberprofile	Can delete member profile
299	74	view_memberprofile	Can view member profile
300	75	add_annualfee	Can add annual fee
301	75	change_annualfee	Can change annual fee
302	75	delete_annualfee	Can delete annual fee
303	75	view_annualfee	Can view annual fee
304	78	add_memberannualdues	Can add member annual dues
305	78	change_memberannualdues	Can change member annual dues
306	78	delete_memberannualdues	Can delete member annual dues
307	78	view_memberannualdues	Can view member annual dues
308	79	add_memberprofile	Can add member profile
309	79	change_memberprofile	Can change member profile
310	79	delete_memberprofile	Can delete member profile
311	79	view_memberprofile	Can view member profile
312	77	add_orgsection	Can add org section
313	77	change_orgsection	Can change org section
314	77	delete_orgsection	Can delete org section
315	77	view_orgsection	Can view org section
316	76	add_member	Can add member
317	76	change_member	Can change member
318	76	delete_member	Can delete member
319	76	view_member	Can view member
320	80	add_orgchartpage	Can add org chart page
321	80	change_orgchartpage	Can change org chart page
322	80	delete_orgchartpage	Can delete org chart page
323	80	view_orgchartpage	Can view org chart page
324	81	add_orgchartsectionmember	Can add org chart section member
325	81	change_orgchartsectionmember	Can change org chart section member
326	81	delete_orgchartsectionmember	Can delete org chart section member
327	81	view_orgchartsectionmember	Can view org chart section member
328	82	add_annualfee	Can add annual fee
329	82	change_annualfee	Can change annual fee
330	82	delete_annualfee	Can delete annual fee
331	82	view_annualfee	Can view annual fee
332	83	add_payment	Can add payment
333	83	change_payment	Can change payment
334	83	delete_payment	Can delete payment
335	83	view_payment	Can view payment
336	84	add_orgchartsection	Can add org chart section
337	84	change_orgchartsection	Can change org chart section
338	84	delete_orgchartsection	Can delete org chart section
339	84	view_orgchartsection	Can view org chart section
340	85	add_orgchartv2page	Can add org chart v2 page
341	85	change_orgchartv2page	Can change org chart v2 page
342	85	delete_orgchartv2page	Can delete org chart v2 page
343	85	view_orgchartv2page	Can view org chart v2 page
344	86	add_authmenusettings	Can add auth menu settings
345	86	change_authmenusettings	Can change auth menu settings
346	86	delete_authmenusettings	Can delete auth menu settings
347	86	view_authmenusettings	Can view auth menu settings
348	88	add_usermenufragmentitem	Can add user menu fragment item
349	88	change_usermenufragmentitem	Can change user menu fragment item
350	88	delete_usermenufragmentitem	Can delete user menu fragment item
351	88	view_usermenufragmentitem	Can view user menu fragment item
352	87	add_usermenufragment	Can add user menu fragment
353	87	change_usermenufragment	Can change user menu fragment
354	87	delete_usermenufragment	Can delete user menu fragment
355	87	view_usermenufragment	Can view user menu fragment
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) FROM stdin;
1	pbkdf2_sha256$870000$RQHO98HGuFOARbdk4vzNqU$qU89JGIh3TNsHhcvnZ6gx4GMbYY1X2RoyYNpFVBdqFE=	2026-03-07 16:07:31.701906+00	t	root		root@root.com	t	t	2026-02-24 15:10:18.255193+00	
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: bibliotheque_bibliothequeitem; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.bibliotheque_bibliothequeitem (id, sort_order, title, updated_at, download_count, document_id, page_id, category_id) FROM stdin;
1	0	Loi n° 2-2023 régissant la profession de l'ingénieur au Congo	2026-02-25	1	1	27	2
2	1	Loi nº 3-2023 du 22 février 2023 portant création de l'ordre des ingénieurs du Congo	2026-02-25	0	2	27	2
3	2	Règlement intérieur de l'OIC	2026-02-25	0	3	27	2
4	3	Liste des ingénieurs inscrits au tableau de l’ordre pour 2025	2026-02-25	0	4	27	\N
5	4	Délibération fixant les cotisations annuelles	2026-02-25	0	5	27	\N
\.


--
-- Data for Name: bibliotheque_bibliothequepage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.bibliotheque_bibliothequepage (page_ptr_id, intro) FROM stdin;
27	
\.


--
-- Data for Name: bibliotheque_documentcategory; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.bibliotheque_documentcategory (id, title) FROM stdin;
1	Rapports publications
2	Textes fondamentaux
\.


--
-- Data for Name: blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.blog_blogcategory (id, name, slug, description) FROM stdin;
1	Actualité	actualite	
2	Regards ingénieur	regards	
\.


--
-- Data for Name: blog_blogindexpage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.blog_blogindexpage (page_ptr_id, intro) FROM stdin;
6	<p data-block-key="526zl">Toutes nos actualités</p>
\.


--
-- Data for Name: blog_blogpage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.blog_blogpage (page_ptr_id, date, body, image_id, featured, intro) FROM stdin;
7	2025-03-29	<p data-block-key="8jlfr">Le 29 mars 2025, l'Ordre des Ingénieurs du Congo (OIC) a tenu son assemblée générale dite budgétaire à l'Hôtel PEFACO. Cette rencontre stratégique a réuni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'année 2025.</p><p data-block-key="h3bx3">Screenshot</p><p data-block-key="ld0jv">Sous la présidence du bureau exécutif de l'OIC, l'assemblée générale a permis de passer en revue les priorités de l'année à venir, en tenant compte des défis et des perspectives du secteur de l'ingénierie au Congo.</p><p data-block-key="v3vdv">Au cours de cette assemblée, le programme 2025 a été présenté et débattu par les membres présents. Après des échanges constructifs et des propositions d'amélioration, le programme a été adopté à l'unanimité.</p><p data-block-key="2yqxr">Le point central de l'assemblée était l'examen du budget prévisionnel pour l'année 2025. Le budget, fixé à 52 millions de francs CFA, a été minutieusement discuté avant d'être soumis au vote. Les membres ont pris le temps d'évaluer les différentes rubriques budgétaires et ont approuvé ce budget, qui vise à renforcer les actions de l'OIC en faveur du développement professionnel des ingénieurs.</p><p data-block-key="dlwlj">En plus de l'adoption du budget et du programme, l'assemblée générale a été marquée par des délibérations sur divers sujets liés aux activités futures de l'organisation et aux projets en cours.</p><p data-block-key="iwa9h">Cette rencontre témoigne de l'engagement de l'OIC à assurer une gestion rigoureuse et transparente de ses ressources financières, tout en poursuivant ses actions en faveur de l'amélioration continue des compétences des ingénieurs congolais.</p><p data-block-key="9n371">L'Ordre des Ingénieurs du Congo remercie tous les participants pour leur implication et leur volonté de contribuer à la réalisation des objectifs de l'année 2025.</p>	1	f	<p data-block-key="ljqsp">Le 29 mars 2025, l'Ordre des Ingénieurs du Congo (OIC) a tenu son assemblée générale dite budgétaire à l'Hôtel PEFACO. Cette rencontre stratégique a réuni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'année 2025.</p>
8	2025-02-08	<p data-block-key="tr0vx">Le 8 février 2025, les tours jumelles de Mpila ont accueilli la cérémonie de prestation de serment des ingénieurs, un événement marquant placé sous le haut patronage du Monsieur Jean Jacques BOUYA, Ministre d'État, Ministre de l'Aménagement, de l'Equipement du Territoire et des Grands Travaux. Cette cérémonie a également enregistré la présence remarquée de l'Honorable Blaise AMBETO, député à l'Assemblée nationale.</p><p data-block-key="ok47h">Au cours de cette cérémonie solennelle, 154 ingénieurs ont prêté serment, marquant ainsi leur engagement à servir la nation avec intégrité, professionnalisme et dévouement. Cet acte symbolique revêt une importance capitale, témoignant de la volonté des ingénieurs congolais de contribuer activement aux projets d'infrastructures et au développement du pays.</p><p data-block-key="efjqx">Dans son allocution, le Ministre d'État a salué l'enthousiasme et l'engagement des nouveaux ingénieurs, rappelant que leur mission est essentielle pour soutenir les grands travaux entrepris par le pays. De son côté, l'Honorable Blaise AMBETO a encouragé les ingénieurs à faire preuve de responsabilité et d'innovation dans la réalisation de leurs projets.</p><p data-block-key="3gwrq">L'Ordre des Ingénieurs du Congo (OIC) se félicite de l'organisation réussie de cette cérémonie et tient à féliciter chaleureusement l'ensemble des ingénieurs qui ont prêté serment. Ce moment fort témoigne de la volonté de renforcer l'excellence et la responsabilité au sein de la profession d'ingénieur au Congo.</p><p data-block-key="o37ii">L'OIC reste engagé à accompagner ses membres dans l'accomplissement de leurs missions et à promouvoir les valeurs d'éthique et de professionnalisme au sein de la communauté des ingénieurs congolais.</p><p data-block-key="4hbtb">Pour plus d'informations sur l'Ordre des Ingénieurs du Congo et ses activités, n'hésitez pas à consulter notre site internet.</p>	\N	f	<p data-block-key="tm3l0">Le 8 février 2025, les tours jumelles de Mpila ont accueilli la cérémonie de prestation de serment des ingénieurs, un événement marquant placé sous le haut patronage du Monsieur Jean Jacques BOUYA, Ministre d'État, Ministre de l'Aménagement, de l'Equipement du Territoire et des Grands Travaux. Cette cérémonie a également enregistré la présence remarquée de l'Honorable Blaise AMBETO, député à l'Assemblée nationale.</p>
9	2023-07-08	<!-- wp:gallery {"linkTo":"none"} -->\n<figure class="wp-block-gallery has-nested-images columns-default is-cropped"><!-- wp:image {"id":422,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.28-2-1024x576.jpeg" alt="" class="wp-image-422"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":427,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.28-1-1024x683.jpeg" alt="" class="wp-image-427"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":426,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.26-2-1024x683.jpeg" alt="" class="wp-image-426"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":421,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.26-1-1024x576.jpeg" alt="" class="wp-image-421"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":425,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.26-1024x683.jpeg" alt="" class="wp-image-425"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":424,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.28-1024x683.jpeg" alt="" class="wp-image-424"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":423,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.29-1-1024x683.jpeg" alt="" class="wp-image-423"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {"id":428,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.29-1024x683.jpeg" alt="" class="wp-image-428"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph {"className":""} -->\n<p>Le samedi 8 juillet 2023, l’Ordre des Ingénieurs du Congo (OIC) a tenu son Assemblée Générale Constitutive au Grand Hôtel de Kintélé sous le haut patronage du Ministre de la construction de l'urbanisme et de l'habitat , représenté par son Directeur de cabinet .<br>Cet événement historique, véritable jalon dans la structuration et la reconnaissance de la profession d’ingénieur en République du Congo, a marqué un tournant décisif pour le secteur. Il a réuni un large éventail d’acteurs nationaux de l’ingénierie – toutes spécialités confondues – ainsi que des chefs d'entreprises, des autorités administratives et institutionnelles venues saluer cette avancée majeure.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":4,"className":""} -->\n<h4 class="wp-block-heading"></h4>\n<!-- /wp:heading -->	\N	f	
10	2025-03-22	<p data-block-key="y7abc">Le samedi 22 mars 2025, le Conseil National de l’Ordre des Ingénieurs du Congo (OIC) s’est réuni au <b>Ministère de l'Aménagement du Territoire et des Grands Travaux</b>, dans la <b>Salle Alima</b> de la mezzanine. Cette rencontre stratégique, placée sous le signe de l’évaluation et de la prospective, a permis aux membres du Conseil d’examiner les grandes orientations de l’OIC pour l’année en cours.</p><p data-block-key="7z4de"><b>Un ordre du jour axé sur l'évaluation et la planification</b></p><p data-block-key="eru8y"></p><p data-block-key="bzshg">Les travaux ont porté principalement sur trois points essentiels :</p><ol><li data-block-key="q4wne"><b>Examen des rapports d'activités de l'année 2024.</b></li><li data-block-key="0uw4b"><b>Étude des projets de programme et de budget pour l'année 2025.</b></li><li data-block-key="7yt69"><b>Analyse de trois projets de décisions majeurs pour le fonctionnement de l'OIC.</b></li></ol><p data-block-key="8650a">Le Conseil National a consacré une large partie de la séance à l’examen des rapports d'activités de 2024, soulignant les réalisations majeures ainsi que les défis rencontrés au cours de l'année écoulée. La discussion a permis d’apporter des éclairages sur certains projets en cours et d’identifier des axes d'amélioration pour renforcer l'impact des actions menées par l'OIC.</p><p data-block-key="8jknf"><b>Des perspectives ambitieuses pour 2025</b></p><p data-block-key="grrnt">L’un des points forts de la réunion a été la présentation des <b>projets de programme et de budget 2025</b>. Les membres du Conseil ont discuté des priorités stratégiques pour l’année en cours, avec un accent particulier sur le renforcement des capacités des ingénieurs et la promotion de l’excellence professionnelle. Le budget, articulé autour des projets prioritaires, a fait l’objet de discussions approfondies pour garantir une gestion efficiente et transparente des ressources de l’Ordre.</p><p data-block-key="91h1o"><b>Trois projets de décisions examinés</b></p><p data-block-key="w7yfh">En outre, trois projets de décisions ont été examinés lors de cette séance. Ces décisions visent à :</p><ol><li data-block-key="3sm36"><b>Améliorer la gouvernance interne de l’OIC.</b></li><li data-block-key="25fu2"><b>Renforcer la transparence dans la gestion des ressources financières.</b></li><li data-block-key="fs5yd"><b>Optimiser les mécanismes de coordination entre les différentes instances régionales et nationales.</b></li></ol><p data-block-key="4qts4">Après un débat constructif, le Conseil National a pris note des propositions d’amendement pour enrichir ces projets de décisions avant leur adoption définitive.</p><p data-block-key="qdfzs"><b>Vers un OIC plus fort et plus structuré</b></p><p data-block-key="khlqk">Cette réunion du Conseil National a démontré une fois de plus l’engagement des membres à faire de l’OIC une institution solide et structurée. La volonté d’améliorer les pratiques de gouvernance et de renforcer les capacités des ingénieurs congolais reste au cœur des priorités pour 2025.</p><p data-block-key="0ftji">L’OIC tient à remercier tous les participants pour leur implication active dans les échanges et réaffirme son engagement à accompagner les ingénieurs dans leur évolution professionnelle et à contribuer au développement durable du Congo.</p><p data-block-key="2j1ob">Vive l'Ordre des Ingénieurs du Congo !<br/>Vive l’ingénierie congolaise !</p>	\N	f	<p data-block-key="f4ssq">Le samedi 22 mars 2025, le Conseil National de l’Ordre des Ingénieurs du Congo (OIC) s’est réuni au <b>Ministère de l'Aménagement du Territoire et des Grands Travaux</b>, dans la <b>Salle Alima</b> de la mezzanine. Cette rencontre stratégique, placée sous le signe de l’évaluation et de la prospective, a permis aux membres du Conseil d’examiner les grandes orientations de l’OIC pour l’année en cours.</p>
11	2024-03-30	<p data-block-key="k061v">Le samedi 30 mars 2024, l'Ordre des Ingénieurs du Congo (OIC) a tenu son Assemblée Générale Inaugurale aux Tours Jumelles de Mpila, marquant une étape significative dans la structuration et la mise en place opérationnelle de l'institution. Cet événement fait suite à l'Assemblée Générale Élective organisée une année auparavant, qui avait permis d'élire le Conseil national et le Bureau exécutif de l'OIC.</p><p data-block-key="lkwwc"></p><p data-block-key="dbn17"><b>Un haut patronage qui honore la profession</b></p><p data-block-key="xnh7f">Cette assemblée inaugurale s'est tenue sous le haut patronage de Monsieur <b>Jean Jacques BOUYA</b>, Ministre d'État, Ministre de l'Aménagement du Territoire et des Grands Travaux. Sa présence témoigne de l'importance accordée par les autorités publiques à l'organisation et à la reconnaissance de la profession d'ingénieur au Congo.</p><p data-block-key="xnvrv"><b>Un moment historique pour la profession d'ingénieur</b></p><p data-block-key="9oocm">Cet événement a rassemblé de nombreux ingénieurs issus de divers secteurs d'activité, ainsi que des personnalités de premier plan engagées dans le développement de l'ingénierie au Congo. La tenue de cette assemblée inaugurale marque un tournant décisif dans la structuration de l'Ordre, désormais pleinement opérationnel pour défendre les intérêts des ingénieurs congolais et promouvoir l'excellence professionnelle.</p><p data-block-key="d3gi6"><b>Objectifs de l'Assemblée Inaugurale</b></p><p data-block-key="1f5vv">L'Assemblée Générale Inaugurale avait pour principal objectif de valider les textes fondamentaux régissant l'Ordre, notamment les statuts et le règlement intérieur, élaborés en concertation avec les membres du Conseil national et du Bureau exécutif. Ces documents définissent les missions, les valeurs et les principes éthiques que l'OIC s'engage à promouvoir.</p><p data-block-key="bsqgt">Les débats ont également porté sur les grandes orientations stratégiques à adopter pour assurer la reconnaissance et la valorisation des ingénieurs dans le contexte socio-économique du Congo. Les participants ont partagé leurs réflexions sur les défis à relever, notamment en matière de formation continue, de certification des compétences et d'éthique professionnelle.</p><p data-block-key="3q313"><b>Le Bureau et le Conseil en action</b></p><p data-block-key="rrcgq">Au cours de cette assemblée, le Bureau exécutif, soutenu par le Conseil national, a présenté son programme d'action pour les prochaines années, incluant des initiatives concrètes pour renforcer l'accompagnement des ingénieurs dans leur parcours professionnel. Les membres ont pu débattre des projets à venir, notamment la mise en place de commissions spécialisées pour répondre aux problématiques techniques et réglementaires propres aux différents corps d'ingénieurs.</p><p data-block-key="uy57e"><b>Vers une dynamique collective</b></p><p data-block-key="l4b08">Les échanges constructifs ont mis en lumière l'importance de la solidarité entre les ingénieurs congolais pour relever les défis de développement du pays. Le Président du Bureau exécutif a insisté sur la nécessité de travailler en synergie avec les autorités publiques et les partenaires privés pour faire de l'OIC un acteur incontournable du progrès technique et économique au Congo.</p><p data-block-key="38bx5"><b>Une mobilisation exemplaire</b></p><p data-block-key="9w94j">La forte participation à cette Assemblée Générale Inaugurale témoigne de l'adhésion collective des ingénieurs congolais à ce projet fédérateur. Les membres présents ont exprimé leur volonté de contribuer activement aux projets de l'OIC, convaincus que l'Ordre représente un levier essentiel pour la reconnaissance et la valorisation de leur métier.</p><p data-block-key="kvs9l"><b>Un avenir prometteur</b></p><p data-block-key="bk16n">Cette assemblée inaugurale marque le véritable lancement opérationnel de l'Ordre des Ingénieurs du Congo. En posant les bases solides de son fonctionnement, l'OIC s'engage à promouvoir l'excellence, l'éthique et l'innovation au sein de la profession d'ingénieur.</p><p data-block-key="yhp3q">L'Ordre des Ingénieurs du Congo remercie tous les participants pour leur engagement et leur détermination à faire de cette assemblée une réussite. L'OIC est désormais prêt à jouer pleinement son rôle dans la structuration de la profession et le développement durable du Congo.</p><p data-block-key="9dsca">Vive l'Ordre des Ingénieurs du Congo !<br/>Vive l'ingénierie congolaise !</p>	\N	f	<p data-block-key="41oie">Le samedi 30 mars 2024, l'Ordre des Ingénieurs du Congo (OIC) a tenu son Assemblée Générale Inaugurale aux Tours Jumelles de Mpila, marquant une étape significative dans la structuration et la mise en place opérationnelle de l'institution. Cet événement fait suite à l'Assemblée Générale Élective organisée une année auparavant, qui avait permis d'élire le Conseil national et le Bureau exécutif de l'OIC.</p>
12	2023-07-08	<!-- wp:paragraph -->\n<p><em>Brazzaville, le 8 juillet 2023</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>M</strong><strong>onsieur&nbsp;</strong><a></a><strong>le&nbsp;</strong><strong>Directeur de cabinet du M</strong><strong>inistre&nbsp;</strong><strong>de la construction de l’urbanisme et de l’habitat</strong><strong>&nbsp;;</strong><strong></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Honorable député Blaise AMBETO</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Chers confrères ingénieurs ;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Distingués invités ;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Mesdames et messieurs&nbsp;!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mon&nbsp;émotion&nbsp;est grande&nbsp;!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Cela</strong><strong>&nbsp;</strong><strong>fait</strong><strong>, plus de</strong><strong>&nbsp;</strong><strong>cinq&nbsp;</strong><strong>(5)</strong><strong>&nbsp;</strong><strong>ans&nbsp;</strong><strong>que nous attendons ce jour</strong>&nbsp;!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Le Congo,&nbsp;notre pays,&nbsp;était malheureusement absent des grandes rencontres scientifiques et technologiques organisées par la fédération mondiale et&nbsp;la fédération&nbsp;africaine des&nbsp;organisations d’ingénierie&nbsp;;(FMO et FAOI).</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Aujourd’hui, nous venons de parachever le processus de création</strong>&nbsp;de l’ordre des ingénieurs&nbsp;du Congo,&nbsp;en sigle&nbsp;OIC, par la mise en place du conseil national&nbsp;de l’ordre&nbsp;et de son&nbsp;bureau exécutif.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Je&nbsp;</strong><strong>tiens à&nbsp;</strong><strong>remercie</strong><strong>r</strong><strong>&nbsp;</strong><strong>mes</strong><strong>&nbsp;</strong><strong>chers&nbsp;</strong><strong>confrères ingénieurs</strong>pour la confiance renouvelée à ma&nbsp;modeste personne&nbsp;après avoir été président de la commission préparatoire&nbsp;de&nbsp;l’OIC.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Pour ma part, je prends l’engagement,&nbsp;une fois de plus,de donner le meilleur de moi-même&nbsp;et&nbsp;transmettre aux jeunes générations cet héritage précieux pour le développement de&nbsp;notre&nbsp;pays.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>En ce jour mémorable,</strong>&nbsp;permettez-moi d’avoir une pensée pieuse pour nos confrères&nbsp;décédés&nbsp;au cours des cinq (5) dernières années.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Eux&nbsp;qui&nbsp;rêvaient,&nbsp;comme nous&nbsp;tous,&nbsp;d’être dans cette salle pour&nbsp;célébrer cet&nbsp;évènement&nbsp;de la naissance de l’OIC.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>J’ai cité&nbsp;:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>-&nbsp;<strong>MBOUSSA Alphonse</strong>,&nbsp;ingénieur&nbsp;en génie-civil Directeur général de la société «&nbsp;Congo engineering&nbsp;»,&nbsp;qui était l’un des précurseurs de cette initiative ;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>-&nbsp;<strong>L’honorable NIANG</strong><strong>A ELENGA</strong>&nbsp;<strong>André</strong>, Ingénieur de mines, Directeur général de l’ONEMO&nbsp;;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>-&nbsp;<strong>NDOUNIAMA Alphonse</strong>&nbsp;ingénieur en génie-civil ;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>-&nbsp;<strong>FOUAKAFOUENI Guy Arsène</strong>&nbsp;ingénieur en génie-civil.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Qu’ils reçoivent là-haut paix et lumière à leur&nbsp;âme&nbsp;!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Je vous prie&nbsp;</strong><strong>d’ailleurs&nbsp;</strong><strong>très respectueusement</strong><strong>,</strong><strong>&nbsp;</strong><strong>de</strong><strong>bien vouloir&nbsp;</strong><strong>vous</strong><strong>&nbsp;lever pour observer une minute de silence en leurs mémoires.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Je vous remercie&nbsp;!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chers confrères&nbsp;ingénieurs ;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tout le monde&nbsp;se souvient&nbsp;que&nbsp;le processus de création de l’OIC a été très difficile.&nbsp;Nos confrères du génie-civil ont tenté&nbsp;cette expérience&nbsp;à plusieurs reprises sans succès&nbsp;!&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C’est pour cela qu’au nom de tous les ingénieurs ici&nbsp;présents,&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Je</strong><strong>&nbsp;voudrais remercier le&nbsp;</strong><strong>gouvernement</strong><strong>&nbsp;de la république&nbsp;</strong>qui<strong>&nbsp;</strong>par&nbsp;l’entremise du&nbsp;Ministre d’état,ministre&nbsp;de l’aménagement du territoire,&nbsp;des infrastructures et de&nbsp;l’entretien&nbsp;routier&nbsp;a toujours mis à notre disposition la confortable&nbsp;salle de réunion&nbsp;«&nbsp;FLEUVE CONGO&nbsp;»&nbsp;du siège&nbsp;de son ministère,chaque fois que nous en avions&nbsp;eu&nbsp;besoins pour&nbsp;la tenue de&nbsp;nos assemblées&nbsp;générales.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>​&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Aujourd’hui</strong><strong>,</strong><strong>&nbsp;notre volonté de promouvoir la profession d’ingénieur au Congo a porté&nbsp;</strong><strong>s</strong><strong>es&nbsp;</strong><strong>fruits.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nous&nbsp;venons de mettre&nbsp;en place un ordre fédérateur&nbsp;qui&nbsp;regroupe&nbsp;plusieurs spécialités.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Dorénavant,&nbsp;nous avons&nbsp;deux&nbsp;lois&nbsp;organiques&nbsp;:&nbsp;la loi portant création et organisation de l’ordre des&nbsp;ingénieurs du Congo&nbsp;en sigle «&nbsp;OIC&nbsp;»&nbsp;et la loi régissant la profession d’ingénieur au Congo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Permettez-moi de remercier&nbsp;<strong>l’honorable Blaise AMBETO</strong>&nbsp;qui a porté et défendu valablement&nbsp;nos&nbsp;deux propositions de loi&nbsp;devant l’Assemblée National etdevant&nbsp;le Sénat.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je voudrais&nbsp;également&nbsp;remercier, au nom de tous les ingénieurs du Congo,&nbsp;<strong>S</strong><strong>on Excellen</strong><strong>ce Monsieur le Président de la R</strong><strong>épublique,</strong><strong>&nbsp;Denis SASSOU&nbsp;</strong><strong>N’GUESSO,&nbsp;</strong><strong>le Premier M</strong><strong>inistre et son G</strong><strong>ouvernement&nbsp;</strong>pour avoir mis&nbsp;à&nbsp;la disposition des ingénieurs congolais un cadre juridique pour l’exercice de leur&nbsp;profession,&nbsp;je dirai même&nbsp;pour l’exercice&nbsp;de leurpouvoir d’acquisition.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Conformément&nbsp;aux&nbsp;articles&nbsp;<strong>6</strong><strong>&nbsp;et&nbsp;</strong><strong>17</strong>&nbsp;de la loi régissant la profession d’ingénieur au Congo, il&nbsp;nous reste à compléter les textes de l’ordre&nbsp;par&nbsp;la<strong>&nbsp;loi portant code déontologique de la profession d’ingénieur</strong>&nbsp;<strong>au Congo</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C’est&nbsp;une loi très importante pour l’encadrement de nos comportements&nbsp;!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Et&nbsp;par&nbsp;<strong>le décret précisant la liste&nbsp;</strong><strong>des génies&nbsp;</strong><strong>composant la profession d’ingénieur en&nbsp;</strong><strong>R</strong><strong>épublique du Congo</strong>.&nbsp;Ce décret est nécessaire car le mot ingénieur aujourd’hui va dans tous les sens et commence à perdre son sens originel.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chers&nbsp;</strong><strong>confrères&nbsp;ingénieurs</strong><strong>&nbsp;</strong><strong>;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>La loi portant création et organisation de l’ordre des ingénieurs du Congo&nbsp;en sigle «&nbsp;OIC&nbsp;»&nbsp;stipule&nbsp;à&nbsp;<strong>l’article 20</strong>&nbsp;que&nbsp;<strong>«&nbsp;nul ne peut exercer la profession d’ingénieur au Congo s’il n’est préalablement inscrit au tableau de&nbsp;</strong><strong>l’ordre »</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Désormais,&nbsp;tous&nbsp;les&nbsp;ingénieurs, tous les détenteurs de diplômes d’ingénieurs ont&nbsp;l’obligation d’adhérer à l’OIC&nbsp;pour valoriser leur titre d’ingénieur.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Il est&nbsp;donc&nbsp;fait&nbsp;également&nbsp;obligation aux sociétés d’ingénierie de se conformer à la loi dans un délai de 6 mois à compter de la date de la promulgation.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chers confrères&nbsp;ingénieurs ;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nous avons là&nbsp;aussi&nbsp;l’occasion&nbsp;pour le progrès&nbsp;collectif,de&nbsp;se regrouper,&nbsp;afin&nbsp;de&nbsp;créer de&nbsp;grandes&nbsp;sociétés&nbsp;d’ingénierie&nbsp;pour affronter les grands marchés de l’étatet non de&nbsp;se complaire&nbsp;dans la vision étriquée des établissements personnels.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C’est pour cela&nbsp;qu’il nous faut se recycler&nbsp;sans cesse,car,&nbsp;beaucoup&nbsp;d’entre nous&nbsp;sont devenus des ingénieurs&nbsp;administratifs.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>On parle aujourd’hui d’intelligence artificielle</strong>. Ilnous faut profiter du numérique, apprendre les logiciels de calculs qui nous donnent l’opportunité de se mesurer aux pays développés.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Monsieur le&nbsp;</strong><strong>Directeur de cabinet du M</strong><strong>inistre de la construction de l’urbanisme et de l’habitat&nbsp;;&nbsp;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Honorable député Blaise AMBETO</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Chers confrères ingénieurs ;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Distingués invités ;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Mesdames et messieurs&nbsp;!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>La création de l’ordre des ingénieurs du Congo&nbsp;intègrebel et bien la vision de son Excellence Monsieur le Président de la République consignée&nbsp;<strong>au point 4</strong>&nbsp;de son projet de société&nbsp;<strong>«&nbsp;Ensemble</strong><strong>,</strong><strong>&nbsp;poursuivons la marche »</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C’est bien beau de créer des sociétés, mais encore faut-il trouver des marchés&nbsp;!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C’est pourquoi pour épouser cette vision du président de la république, il est important d’encourager les créateurs d’emplois du secteur de l’ingénierie à l’accès auxmarchés&nbsp;publics par&nbsp;<strong>la révision du code des</strong><strong>&nbsp;marché</strong><strong>s</strong><strong></strong><strong>public</strong><strong>s</strong>,&nbsp;conformément à&nbsp;<strong>l’article 14&nbsp;</strong>de la loi régissant la profession d’ingénieur au Congo&nbsp;qui&nbsp;stipule&nbsp;que&nbsp;<strong>«&nbsp;la réalisation de tout projet d’ingénierie dans ses différentes étapes&nbsp;</strong><strong>pour les&nbsp;</strong><strong>financement</strong><strong>s</strong><strong>&nbsp;public</strong><strong>s</strong><strong>&nbsp;se fait en associant les établissement</strong><strong>s</strong><strong>&nbsp;inscrit</strong><strong>s</strong><strong>&nbsp;au tableau de l’ordre »</strong>.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chers confrères !</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Souvenez-vous&nbsp;des&nbsp;deux missions&nbsp;essentielles&nbsp;que vous m’avez&nbsp;confiées,&nbsp;notamment,&nbsp;<strong>faire aboutir les lois</strong>&nbsp;et&nbsp;<strong>mettre en place les instances de l’ordre</strong>&nbsp;!&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aujourd’hui je peux&nbsp;vous dire&nbsp;:&nbsp;<strong>MISSION ACCOMPLIE&nbsp;!</strong><strong></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Rendez-vous&nbsp;pour les trois&nbsp;prochaines&nbsp;années !&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Que Dieu bénisse l’OIC&nbsp;!</strong><strong></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Vive l’OIC&nbsp;!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong></strong><strong>Vive le Congo</strong><strong>&nbsp;!</strong>&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Je</strong><strong>&nbsp;vous remercie</strong>&nbsp;<strong>de</strong><strong>&nbsp;votre aimable attenti</strong></p>\n<!-- /wp:paragraph -->	\N	f	
13	2023-07-08	<!-- wp:paragraph -->\n<p><strong>-&nbsp;</strong><strong>Messieurs les membres du Conseil National,</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>- Chers confrères ingénieurs,</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>- Notre distingué inv</strong><strong>ité, l’Honorable Blaise AMBETO,</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Il y a quelques années, nous avons pris l’initiative de créer un Ordre fédérateur des Ingénieurs du Congo. Notre ambition était de mettre en lumière l’importance cruciale des métiers&nbsp;métiers&nbsp;de l’ingénierie&nbsp;auprès de nos gouvernants.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aujourd’hui, en jetant un regard sur le chemin parcouru, nous mesurons les sacrifices et la détermination&nbsp;de chacun d’entre nous&nbsp;qui ont abouti à la promulgation des lois fondatrices de notre ordre par son Excellence, Monsieur Denis SASSOU N'GUESSO, Président de la République.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ces lois sont :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- La loi n° 2-2023 du 22 février 2023&nbsp;<strong><em>régissant la profession d’ingénieur en République du Congo,</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- La loi n° 3-2023 du 22 février 2023&nbsp;<strong><em>portant création et organisation de l’Ordre</em></strong><strong><em>&nbsp;des Ingénieurs du Congo (OIC).</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Grâce à ces lois, nous avons pu organiser&nbsp;<strong><em>le 8 juillet 2023</em></strong>au Grand Hôtel de&nbsp;Kintélé&nbsp;l’assemblée générale constitutive qui&nbsp;nous&nbsp;a&nbsp;permis de mettre&nbsp;en place les instances de l’ordre, à savoir le Conseil National de 25 membres et son Bureau Exécutif de 5 membres.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Cette date du 8 juillet 2023</em></strong>&nbsp;marque désormais la naissance officielle de l’Ordre des Ingénieurs du Congo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aujourd'hui, nous nous retrouvons pour célébrer le premier&nbsp;anniversaire&nbsp;de la création de l’OIC, marquée par la détermination et l'engagement de chacun d'entre nous. C’est&nbsp;ici&nbsp;l’occasion de rendre&nbsp;hommage à nos confrères décédés en observant une minute de silence en leur mémoire :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>J’ai cité&nbsp;:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>-&nbsp;<em>MBOUSSA Alphonse,</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><em>- L’honorable NIANGA ELENGA André,</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><em>- NDOUNIAMA Alphonse,</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><em>- FOUAKAFOUENI Guy Arsène,</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><em>- ODIKA Hyppolite.</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Je vous prie de vous lever.</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Je vous remercie.</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Comme vous&nbsp;le savez bien, nous sommes encore dans le processus de création&nbsp;de l’OIC, qui exige de nous un certain nombre d’actions à mener, telles que :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- l’adoption des textes d’application à soumettre au gouvernement (le code déontologique de l’ingénieur congolais et le décret définissant les&nbsp;types de génies et d'ingénierie devant faire partie de&nbsp;l’ordre).</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- La mise en place de la chambre départementale de Pointe-Noire,</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- L’adoption du premier tableau des ingénieurs autorisés à exercer en République du Congo en 2025,</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- L’organisation de la grande cérémonie de prestation de serment des ingénieurs,</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>- Et enfin, la transmission, comme le veut la loi, du tableau au gouvernement, aux préfets et aux maires.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Pour l’instant, nous encourageons les ingénieurs et les sociétés d’ingénierie à s’inscrire à l’ordre. Des courriers ont été adressés à certaines sociétés pour les informer de l’obligation d’inscrire leurs ingénieurs et leurs sociétés à l’OIC.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>D’ici la fin de l’année, tous les ingénieurs souhaitant exercer au Congo devront figurer sur le tableau de l’ordre.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je profite de cette occasion pour interpeller chacun de vous à s’acquitter de ses cotisations annuelles adoptées par l’assemblée générale inaugurale.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>L’OIC doit être le lieu privilégié où nous établissons des normes élevées de professionnalisme, favorisons les échanges de connaissances et renforçons les liens de solidarité entre ingénieurs.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Notre dévouement permettra, j’en suis sûr, de rehausser&nbsp;le<a></a>niveau de compétence&nbsp;et d'intégrité des ingénieurs.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nous avons un rôle crucial à jouer dans le développement du Congo. Nous devons continuer à innover, former les jeunes générations et collaborer avec les secteurs public et privé pour relever les grands défis technologiques, environnementaux et économiques de notre pays.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je tiens à exprimer ma profonde gratitude à chacun de vous, car votre passion et votre&nbsp;engagement sont la clé de notre succès. Grâce à votre dévouement, je suis convaincu que nous continuerons à réaliser des progrès significatifs pour positionner l’OIC comme un organe incontournablepour le développement du pays.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Pendant que nous célébrons ce premier anniversaire, je vous invite à renouveler votre engagement pour l’avenir de l’OIC. Ensemble, nous contribuerons à l’édification du Congo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Vive l'Ordre des Ingénieurs du Congo !</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Vive le Congo !</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Que Dieu bénisse l’OIC !</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Bonne fête à tous !</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Je vous remercie.</em></strong></p>\n<!-- /wp:paragraph -->	\N	f	
14	2025-02-13	<p data-block-key="v8jdf">• <b><i>Excellence Monsieur le Ministre d’état, Ministre de l’aménagement du territoire et des grands travaux</i></b> ;</p><p data-block-key="eopc6">• <b><i>Honorable député Blaise AMBETO ;</i></b></p><p data-block-key="wqb6b">• <b><i>Messieurs les membres du Conseil National ;</i></b></p><p data-block-key="ee8pm">• <b><i>Chers confrères ingénieurs ;</i></b></p><p data-block-key="1st7c">• <b><i>Distingués invités</i></b>.</p><p data-block-key="ute7h">Nous nous retrouvons aujourd’hui pour une cérémonie historique, marquant <b>l’officialisation du premier tableau de l’Ordre des Ingénieurs du Congo et la prestation de serment des premiers membres de notre ordre. </b>Cet événement constitue une étape majeure dans la structuration et la valorisation de notre profession.</p><p data-block-key="i1xn5">Permettez-moi, en ce jour solennel, de retracer brièvement le chemin parcouru pour aboutir à ce moment si significatif.</p><p data-block-key="1f8ym"><b>En 2016,</b> nous avons pris l’initiative d’organiser notre profession en dotant notre pays d’un Ordre des Ingénieurs, à l’instar de certains pays de la sous-région. Pendant cinq années, nous avons travaillé avec détermination à l’élaboration des textes législatifs et à la mise en place des stratégies nécessaires pour concrétiser ce projet ambitieux.</p><p data-block-key="gelh7">Au moment, ou nous publions la liste des premiers membres de l’OIC, j’ai une pensée pieuse en mémoire de nos confrères ingénieurs  décédés, j’ai cité :</p><p data-block-key="p1lvs"><b>- MBOUSSA Alphonse, </b>qui était l’un des initiateurs de ce projet</p><p data-block-key="j91eq"><b>- L’Honorable NIANGA ELENGA André,</b></p><p data-block-key="emivv"><b>- NDOUNIAMA Alphonse,</b></p><p data-block-key="surwh"><b>- FOUAKAFOUENI Guy Arsène,</b></p><p data-block-key="g3itw"><b>- ODIKA Hyppolite.</b></p><p data-block-key="5ms4g">Ainsi, je vous prie très respectueusement de bien vouloir vous lever pour observer une minute de silence en leur mémoire.</p><p data-block-key="9cwjk"><b>Je vous remercie !  </b></p><p data-block-key="ycasp">Nous avons le devoir de rendre hommage à ceux qui ont rendu la réalisation de ce projet possible. Nos sincères remerciements vont tout d’abord à <b>Son Excellence Monsieur Denis SASSOU N’GUESSO,</b> <b>Président de la République et Chef de l’État,</b> pour avoir promulgué les lois fondatrices de notre Ordre, désormais connues sous le nom de <b>Lois AMBETO</b>,</p><p data-block-key="xvug6">À savoir :<b> La loi portant création et organisation de l’Ordre des Ingénieurs du Congo (OIC) ;</b>et <b>La loi régissant la profession d’ingénieur en République du Congo.</b></p><p data-block-key="yxkxv">Nous exprimons également notre profonde gratitude à <b>l’Honorable Blaise AMBETO</b>, qui a porté et défendu ces textes avec conviction devant le Parlement. </p><p data-block-key="g6org">Nos remerciements s’adressent aussi à <b>Son Excellence Monsieur le Ministre d’État, Ministre de l’Aménagement du Territoire et des Grands Travaux,</b> pour son soutien indéfectible, notamment en mettant toujours à notre disposition la confortable salle de réunion <b>« Fleuve Congo »</b> pour nos travaux préparatoires.</p><p data-block-key="2kzz4"><b>Excellence Monsieur le Ministre d’État,</b></p><p data-block-key="v6bas"><b>Chers confrères ingénieurs,</b></p><p data-block-key="xdi27">Cette cérémonie symbolise la concrétisation de notre engagement à réglementer et à valoriser la profession d’ingénieur dans notre pays.</p><p data-block-key="av45l"><b>L’article 20</b> de la loi portant création et organisation de l’Ordre des ingénieurs du Congo stipule sans ambiguïté que : </p><p data-block-key="0wz1f"><b>« Nul ne peut exercer la profession d’ingénieur au Congo s’il n’est préalablement inscrit au tableau de l’Ordre. »</b></p><p data-block-key="3hdp8">Ainsi, nous avons l’honneur de vous présenter aujourd’hui <b>le premier tableau 2025</b> de l’Ordre des Ingénieurs du Congo, avec la classification des ingénieurs selon leurs spécialités. Parmi <b>les nombreux postulants, 154 dont 2 étrangers ont été retenus</b> après une vérification rigoureuse de leurs qualifications académiques.</p><p data-block-key="x06ya">Sur ce tableau nous avons également <b>inscrit 19 sociétés d’ingénierie, conformément à la loi.</b></p><p data-block-key="fsz2c"><b>Chers confrères ingénieurs,</b></p><p data-block-key="veayj">L’acte que nous allons accomplir dans quelques instants est bien plus qu’une simple formalité administrative. Prêter serment, c’est s’engager solennellement à respecter les valeurs fondamentales de notre profession : <b>l’éthique, l’excellence technique et la responsabilité sociale.</b></p><p data-block-key="77gzo">Par ce serment, nous affirmons notre détermination à exercer nos missions avec <b>intégrité, compétence et dévouement</b>. Nous nous engageons à respecter les règles de l’art, et à mettre nos compétences au service du développement national.</p><p data-block-key="00lip">Nous sommes <b>les pionniers de ce tableau inaugural, et à ce titre, nous portons une immense responsabilité.</b> Soyons donc dignes et fiers de cet honneur et œuvrons ensemble pour faire rayonner notre profession.</p><p data-block-key="p2z59"><b>Le Congo nous a tout donné, il est de notre devoir de contribuer à son progrès et à sa prospérité !</b></p><p data-block-key="c1fe5"><b>Que Dieu bénisse l’Ordre des Ingénieurs du Congo !</b></p><p data-block-key="8z2fm"><b>Vive le Congo !</b></p><p data-block-key="212mt"><b>Vive l’OIC !</b></p><p data-block-key="1ehic"><b>Je vous remercie.</b></p>	\N	f	<p data-block-key="cgs9i">Nous nous retrouvons aujourd’hui pour une cérémonie historique, marquant <b>l’officialisation du premier tableau de l’Ordre des Ingénieurs du Congo et la prestation de serment des premiers membres de notre ordre. </b>Cet événement constitue une étape majeure dans la structuration et la valorisation de notre profession</p>
15	2024-03-30	<!-- wp:paragraph -->\n<p>Brazzaville le 30 mars 2024</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>• <strong><em>Excellence Monsieur le Ministre d’état, Ministre de l’aménagement du territoire des infrastructures et de l’entretien routier ;</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Honorable député</em></strong> ;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Messieurs les membres du Conseil National&nbsp;;</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Chers confrères ingénieurs</em></strong><strong><em>&nbsp;;</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Distingués invités</em></strong> ;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Mesdames et&nbsp;</em></strong><strong><em>monsieur</em></strong><strong><em>,</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C'est avec un profond sentiment de gratitude et de fierté&nbsp;que&nbsp;je&nbsp;me tiens devant vous&nbsp;aujourd’hui, en cettepremière&nbsp;Assemblée Générale Inaugurale de l'Ordre des Ingénieurs du&nbsp;Congo, en sigle&nbsp;«&nbsp;OIC&nbsp;».</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je saisis cette opportunité pour rendre&nbsp;hommage à&nbsp;<strong>Son Excellence Monsieur Denis SASSOU N'GUESSO, Président de la République et Chef de l'État</strong>, pour avoir&nbsp;<strong>promulgué</strong><strong>&nbsp;le 22 février 2023</strong><strong>&nbsp;les lois</strong>&nbsp;fondatrices de notre Ordre, connues sous le nom de&nbsp;<strong>lois AMBETO</strong>&nbsp;:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Il s’agit de&nbsp;la loi&nbsp;portant création et organisation de l’Ordre des ingénieurs du Congo&nbsp;en sigle «&nbsp;OIC&nbsp;», et de la loi&nbsp;régissant la profession d’ingénieur en République du Congo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>La&nbsp;promulgation&nbsp;de ces deux lois&nbsp;marque&nbsp;ainsi&nbsp;le couronnement d'un long processus entamé en&nbsp;<strong>2018,&nbsp;</strong>visant à structurer et réguler&nbsp;l’exercice&nbsp;de&nbsp;notre&nbsp;profession&nbsp;dans notre&nbsp;pays.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je tiens également à exprimer ma sincère gratitude à Son Excellence Monsieur le Ministre d'État, Ministre de l'Aménagement du Territoire, des Infrastructures et de l'Entretien Routier, pour sa présence distinguée&nbsp;<a></a>parmi nous en dépit de ses obligations multiples.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong><em>Excellence Monsieur le Ministre d’état</em></strong><strong><em>,</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Votre soutien et votre engagement envers notre cause sont des témoignages précieux de votre attachement au développement de notre pays.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Mesdames et&nbsp;</strong><strong>Messieurs,</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Permettez-moi aussi d'adresser mes salutations distinguées à toutes les personnalités présentes ici aujourd'hui, ainsi qu'à tous nos invités.&nbsp;&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Votre présence témoigne de l'intérêt que vous portez à l'émergence de notre Ordre et à son rôle crucial dans le panorama&nbsp;des organisations&nbsp;professionnelles de notre pays.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Excellence Monsieur le Ministre d’état, Ministre de l’aménagement du territoire des infrastructures et de l’entretien routier&nbsp;;</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Honorable député</em></strong><strong><em>&nbsp;;</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong><em>Chers confrères&nbsp;</em></strong><strong><em>;</em></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>•&nbsp;<strong>Mesdames et Messieurs</strong><strong>&nbsp;</strong>;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>L'Ordre des Ingénieurs du Congo,&nbsp;en sigle&nbsp;«&nbsp;OIC&nbsp;», se dresse désormais&nbsp;comme le pilier institutionnel&nbsp;incontournable, garantissant l'implication organisée et effective des ingénieurs dans le processus de développement de notre pays.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nous devons nous rappeler que nul ne peut désormais exercer la profession d'ingénieur au Congo sans être préalablement inscrit au tableau de l'Ordre, tel que stipulé par&nbsp;<strong>l'article 20</strong>&nbsp;de la loi portant création et organisation de l’ordre des ingénieurs du Congo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>À cet égard, je&nbsp;voudrais vous&nbsp;annoncer que la Commission chargée de l'examen des dossiers d'inscription&nbsp;au tableau de l’ordre après&nbsp;délibération&nbsp;sur&nbsp;139&nbsp;premiers dossiers reçus&nbsp;a sélectionné&nbsp;72&nbsp;ingénieursdont les dossiers sont&nbsp;complets,&nbsp;pour figurer sur le premier tableau de l'Ordre des Ingénieurs du Congo.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ainsi, chers confrères je&nbsp;vous prie de vous lever&nbsp;pour une reconnaissance solennelle.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Merci</strong><strong>&nbsp;!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je profite de cette occasion pour&nbsp;lancer&nbsp;un&nbsp;vibrant&nbsp;appel à tous les ingénieurs&nbsp;de s’inscrire à l’ordre&nbsp;et de compléter leur dossier&nbsp;conformément à la loi pour l'organisation&nbsp;de notre profession.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chers Confrères,</strong><strong>&nbsp;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Mesdames et Messieurs,</strong><strong>&nbsp;</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aujourd’hui, avec l'adoption de notre programme d'activités et de notre budget annuel, nous nous engageons résolument dans l'action&nbsp;pour le&nbsp;démarrage effectif&nbsp;nos activités.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Je vous exhorte donc à examiner attentivement les documents qui nous sont soumis à l'ordre du jour afin que nos délibérations soient&nbsp;fructueuses.<br>Enfin, je vous souhaite plein succès dans nos travaux et vous invite à s’investir pleinement dans les activités de notre Ordre.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Que Dieu bénisse l'Ordre des Ingénieurs du Congo !<br>Vive le Congo&nbsp;!&nbsp;</strong><br><strong>Vive l'OIC !<br>Je vous remercie</strong>.</p>\n<!-- /wp:paragraph -->	\N	f	
16	2025-04-14	<p data-block-key="cje8f">La Fédération des Organisations Africaines d’Ingénierie a le plaisir de vous inviter à la deuxième session de sa série de webinaires en six parties sur le thème : <b>Faire progresser les normes d'ingénierie en Afrique : la voie vers l’adhésion à l’accréditation internationale</b>.</p><p data-block-key="3ea62"><a href="https://t.co/0kUEFNCTxx">Veuillez vous inscrire ici</a>.</p><p data-block-key="14syd"></p>	\N	f	La Fédération des Organisations Africaines d’Ingénierie a le plaisir de vous inviter à la deuxième session de sa série de webinaires en six parties sur le thème : Faire progresser les normes d'ingénierie en Afrique : la voie vers l’adhésion à l’accréditat
17	2025-02-08	<p data-block-key="3rcwy">En reprenant les paroles du Président de l'Ordre - <b>« Le Congo nous a tout donné, il est de notre devoir de contribuer à son progrès et à sa prospérité »</b> - le Ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux, a rappelé aux ingénieurs que ces mots résonnent profondément avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Président de la République, Chef de l'Etat.</p><p data-block-key="9rede"></p><p data-block-key="3pqv2">L’Honorable Blaise AMBETO, porteur des lois fondatrices de l’Ordre des Ingénieurs du Congo, a solennellement proclamé le Ministre d’État, Ministre de l’Aménagement du Territoire et des Grands Travaux, <b>parrain de l’Ordre</b>, lors de la remise officielle du tout premier tableau.</p>	1	t	<p data-block-key="5f4er">Le Ministre d’État a rappelé que les ingénieurs ont le devoir de contribuer au progrès et à la prospérité du Congo, en écho à la vision du Président de la République, Denis Sassou Nguesso. Par ailleurs, l’Honorable Blaise Ambeto, initiateur des lois fonda</p>
18	2025-04-28	<p data-block-key="0uhik">Un ingénieur, un impact</p><p data-block-key="q6tku"></p><h2 data-block-key="xxw5u">Un acteur clé du développement des projets MEP au Congo</h2><p data-block-key="89n9k">Ingénieur en électromécanique de formation, <b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b> s’impose comme une référence dans l’univers du MEP (Mécanique, Électricité, Plomberie). Avec rigueur et passion, il accompagne les projets d’envergure, de la phase d'étude à la livraison finale, en assurant un haut niveau d'exigence technique.</p><h2 data-block-key="o4fxs">Ses missions</h2><p data-block-key="oc9zt">Au cœur de ses interventions :</p><ul><li data-block-key="6cv6x">Le <b>contrôle technique</b> des installations MEP</li><li data-block-key="hk1o2">La <b>conception et les études</b> des systèmes de bâtiment</li><li data-block-key="e9kme">La <b>coordination des équipes techniques</b> sur le terrain</li></ul><h2 data-block-key="zbg5g">Projets emblématiques</h2><p data-block-key="granf"><b>Sur le terrain, ses compétences parlent d’elles-mêmes :</b></p><ul><li data-block-key="dizoq"><b>COTEXA CONGO - Projet PSTAT :</b><br/>Contrôleur technique des lots MEP</li><li data-block-key="lj9i5"><b>COTEXA CONGO - Réhabilitation du siège de la BDEAC :</b><br/>Contrôleur technique des lots MEP</li><li data-block-key="ijrbr"><b>MBTP - Construction de la Tour ACACIA :</b><br/>Ingénieur-assistant des études MEP</li><li data-block-key="qfkx9"><b>DAE - Construction de la base BRALICO (proximité aéroport Maya-Maya, Brazzaville) :</b><br/>Responsable des études techniques MEP</li></ul><h2 data-block-key="yfa18">Une expertise au service de l’excellence</h2><p data-block-key="31eu6">Fort de son expertise, l’ingénieur BIKOUTA BIAHOUA place la qualité, l'innovation et la maîtrise technique au centre de chacun de ses projets. Sa contribution renforce la dynamique de modernisation des infrastructures au Congo et inspire les nouvelles générations d’ingénieurs.</p><h2 data-block-key="yulbo">Contactez-le</h2><p data-block-key="n5qmh">Tél./WhatsApp : <a href="tel:242069951028">+242 06 995 10 28</a> / <a href="https://wa.me/242067033232">+242 06 703 32 32</a></p><p data-block-key="6hd17">Email : <a href="mailto:dondedieubikouta@gmail.com">dondedieubikouta@gmail.com</a></p><p data-block-key="ix4pz">LinkedIn : <a href="https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161">https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161</a></p>	\N	f	<p data-block-key="zxhxh">Ingénieur en électromécanique de formation, <b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b> s’impose comme une référence dans l’univers du MEP (Mécanique, Électricité, Plomberie). Avec rigueur et passion, il accompagne les projets d’envergure, de la phase d'étude à la livraison finale, en assurant un haut niveau d'exigence technique.</p>
19	2025-04-29	<p data-block-key="6m2ni">Cette rubrique explore, d’un point de vue technique, les grands défis auxquels nos villes sont confrontées.<br/>Nous donnons la parole aux ingénieurs pour analyser des problématiques telles que :</p><ul><li data-block-key="e1n3j">L’ensablement des routes et des infrastructures ;</li><li data-block-key="acprn">L’érosion des sols et ses conséquences sur l’urbanisation ;</li><li data-block-key="am287">Les inondations et les stratégies de gestion des eaux pluviales ;</li><li data-block-key="fminm">L’approvisionnement en électricité et en eau potable ;</li><li data-block-key="b2mff">La présence de caniveaux à ciel ouvert et les solutions d’assainissement urbain ;</li><li data-block-key="66d0o">La maintenance des infrastructures et des équipements publics coûteusement réalisés ;</li><li data-block-key="2fr6v">La maîtrise des coûts de construction et de réhabilitation ;</li><li data-block-key="d3ckf">Les expertises d’expropriation et les évaluations foncières.</li></ul><p data-block-key="cai6">À travers des analyses, des études de cas et des propositions concrètes, nous mettons en avant l’expertise technique nécessaire pour construire des villes plus résilientes et durables.</p>	\N	t	<p data-block-key="abqpi">Cette rubrique explore, d’un point de vue technique, les grands défis auxquels nos villes sont confrontées.</p>
20	2025-05-10	<p data-block-key="ilggj"></p><p data-block-key="1vy2j"><b>Samedi 12 juillet 2025</b> : lancement officiel à Brazzaville lors de la célébration du 2ème anniversaire de l’OIC, sous le haut patronage du ministre d’état, ministre de l’aménagement du territoire et des grands travaux.</p><p data-block-key="9eyah"><b>Juillet - Août - Septembre 2025 :</b> phase de recensement.</p><p data-block-key="k5pf0"></p>	\N	f	<p data-block-key="rj9l8">Lancement officiel à Brazzaville lors de la célébration du 2ème anniversaire de l’OIC, sous le haut patronage du ministre d’état, ministre de l’aménagement du territoire et des grands travaux</p>
21	2025-07-12	<p data-block-key="y23u6"><b>MOT DU PRESIDENT DE L’ORDRE DES INGENIEURS DU CONGO (OIC), À L’OCCASIONDU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D’ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L’OIC</b></p><p data-block-key="bnjv"><i>Brazzaville, le 12 juillet 2025</i></p><ul><li data-block-key="coa2f"><b>Monsieur le Directeur du cabinet du Ministre d’État, Ministre de l’Aménagement du Territoire et des Grands Travaux ;</b></li><li data-block-key="5lgtq"><b>Honorable Député Blaise AMBETO ;</b></li><li data-block-key="f59mt"><b>Messieurs les représentants des membres du Gouvernement ;</b></li><li data-block-key="brre5"><b>Monsieur le Président du Conseil Municipal, Député-Maire de la Ville de Brazzaville ;</b></li><li data-block-key="bimuc"><b>Mesdames et Messieurs les membres du Conseil national de l’OIC ;</b></li><li data-block-key="fe2pa"><b>Chers confrères ingénieurs ;</b></li><li data-block-key="1ag0v"><b>Distingués invités !</b></li></ul><p data-block-key="5lea8">En ce <b>jour symbolique</b>, marquant le <b>deuxième anniversaire</b>de l’Ordre des Ingénieurs du Congo, permettez-moi, au nom de l’ensemble des membres de l’OIC, et en mon nom propre, d’exprimer notre <b>profonde gratitude</b> pour votre présence à cette <b>cérémonie solennelle</b> de <b>lancement de la campagne nationale de recensement et d’adhésion</b> des ingénieurs exerçant en République du Congo.</p><p data-block-key="efc8r">Souvenons-nous ;  <br/>Le <b>28 février dernier</b>, dans cette même salle, nous procédions à la <b>publication du tout premier tableau officiel</b> des ingénieurs inscrits à l’OIC, suivie d’une <b>cérémonie historique de prestation de serment</b>.</p><p data-block-key="61pl4">Ce moment <b>chargé d’émotion et de responsabilité</b> restera, pour nous, un <b>jalon fondateur</b> dans l’histoire de notre profession. </p><p data-block-key="acn4t">L’Ordre des Ingénieurs du Congo est une institution <b>jeune</b>,<br/>mais <b>résolument tournée vers l’avenir</b>.</p><p data-block-key="fbj4h">À ce jour, <b>154 ingénieurs</b> ont été officiellement enregistrés.<br/>Ce chiffre, bien qu’<b>encourageant</b>, reste <b>nettement en dessous du potentiel national</b>.</p><p data-block-key="d8s9c">Il révèle surtout que la <b>majorité des ingénieurs en activité</b>opèrent encore <b>en dehors du cadre légal</b>. Ceci, tantôt <b>par ignorance</b>, tantôt <b>par négligence</b>, et tantôt même <b>en défi de la loi</b> portant création de notre Ordre.</p><p data-block-key="f01j2">Face à cette réalité, le Conseil national a décidé de lancer une <b>vaste campagne nationale de recensement et d’adhésion</b>, afin d’<b>élargir</b> et de <b>renforcer</b> notre communauté professionnelle.</p><p data-block-key="5smrq"><b>Les objectifs de cette campagne sont les suivantes :</b></p><p data-block-key="t3b8"><b>1. Faire appliquer les lois existantes</b>, en incitant tous les ingénieurs à s’inscrire sans délai à l’OIC ;</p><p data-block-key="a9f52"><b>2. Constituer une base de données nationale fiable</b> des ingénieurs en exercice en République du Congo ;</p><p data-block-key="dpqtn"><b>3. Renforcer la gouvernance technique de l’État</b>, en assurant une meilleure régulation de la profession ;</p><p data-block-key="6pnbi"><b>4. Lutter contre la prolifération des faux diplômes</b>, qui ternissent l’image de notre profession. </p><p data-block-key="7enag">À l’issue de cette campagne, nous visons <b>au moins 300 nouvelles adhésions</b> pour franchir un cap décisif dans la <b>structuration de l’ingénierie congolaise</b>.</p><ul><li data-block-key="fg4te"><b>Monsieur le Directeur du cabinet du Ministre d’État, Ministre de l’Aménagement du Territoire et des Grands Travaux,</b></li><li data-block-key="gl5p"><b>Mesdames et Messieurs,</b></li></ul><p data-block-key="a91tb">En promulguant les lois fondatrices de l’Ordre des Ingénieurs du Congo, <b>Son Excellence Monsieur le Président de la République </b>a doté notre pays d’instruments juridiques nécessaires à l’organisation et à la structuration du secteur de l’ingénierie. Ces lois ouvrent des perspectives concrètes aux jeunes ingénieurs, en leur permettant de créer leurs propres sociétés. </p><p data-block-key="4djtj">À l’heure où notre pays est confronté à des défis majeurs dans des secteurs stratégiques tels que le bâtiment et les travaux publics ; les mines et l’énergie ; les eaux et forêts ; l’agriculture et l’environnement, il est impératif que l’ingénieur <b>occupe pleinement sa place dans toutes ces sphères d’activités</b>.</p><p data-block-key="1esma">C’est dans cette dynamique que nous pourrons affirmer avec conviction que<b> l’ingénieur</b> <b>est véritablement au cœur du développement du Congo.</b></p><p data-block-key="6d33f">Il est donc essentiel que l’État mette en œuvre les outils juridiques déjà disponibles pour permettre à l’Ordre des Ingénieurs du Congo de mieux organiser, encadrer et professionnaliser l’ingénierie nationale. Car c’est par la <b>qualité, la sécurité et la durabilité</b> des ouvrages publics et privés que nous pourrons répondre efficacement aux besoins de la population et garantir un développement harmonieux.</p><p data-block-key="7jc83">Notre souhait est que l’ingénieur inscrit à l’Ordre devienne <b>le référent naturel des missions techniques de l’état</b> et que les entreprises étrangères opérant sur notre territoire se conforment à la loi en déclarant leurs ingénieurs auprès de l’OIC.</p><p data-block-key="5i8ld"><b>Chers confrères ingénieurs,</b></p><p data-block-key="8e3nt">L’adhésion à l’Ordre est à la fois une <b>obligation légale</b> et un <b>devoir moral, </b>en vue d’en finir avec: <b>l’exercice illégal de la profession</b>, <b>les faux diplômes</b>, et aussi <b>l’imposture technocratique</b>, cette dérive qui donne à certains une <b>légitimité sans compétence avérée</b>.</p><p data-block-key="cf8tq">Cette campagne, c’est aussi l’occasion d’<b>informer</b>, de <b>sensibiliser</b> et de <b>convaincre</b> tous les ingénieurs, même ceux qui pensent, à tort, <b>ne pas être concernés</b>. </p><p data-block-key="73ciu">Une fois cette phase terminée, nous passerons à <b>l’application </b>des <b>lois et règlements en vigueur</b>.</p><p data-block-key="1m07l">Alors, <br/><b>mobilisons-nous</b>,<br/><b>engageons-nous</b>,<br/><b>recensons-nous</b>,<br/><b>enfin, adhérons tous à l’OIC !</b></p><p data-block-key="1p4mh">Avant de clore mon propos, je tiens à remercier très sincèrement les institutions, les personnes et partenaires qui ont contribué à l’organisation de cette campagne nationaleparmi lesquelles <b>le Ministre d’Etat Jean Jacques BOUYA et l’honorable Blaise AMBETO. </b></p><p data-block-key="80up"><b>Que Dieu bénisse l’Ordre des Ingénieurs du Congo.</b><br/><b>Vive l’OIC !</b><br/><b>Vive la République du Congo, notre chère patrie !</b></p><p data-block-key="e1jf6"><b>Je vous remercie.</b></p>	12	f	<p data-block-key="5tx5u"><b>Mot du président de l'Ordre des Ingénieurs du Congo (OIC), à l'occasion du lancement de la campagne nationale de recensement et d'adhésion couplée au deuxième anniversaire de l'OIC.</b></p>
22	2026-01-07	<ul><li data-block-key="5lv7c">10 janvier 2026 : Réunion du bureau exécutif lieu siège, heure 9 heures précises.</li><li data-block-key="zogky">17 janvier 2026 : Réunion du Conseil</li><li data-block-key="3gcag">⁠31 janvier 2026 : Assemblée générale budgétaire</li></ul>	\N	f	10 janvier 2026 : Réunion du bureau exécutif lieu siège, heure 9 heures précises. 17 janvier 2026 : Réunion du Conseil ⁠31 janvier 2026 : Assemblée générale budgétaire
\.


--
-- Data for Name: blog_blogpage_categories; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.blog_blogpage_categories (id, blogpage_id, blogcategory_id) FROM stdin;
1	17	1
2	20	1
3	21	1
4	19	2
5	7	1
6	18	2
\.


--
-- Data for Name: blog_blogpagetag; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.blog_blogpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) FROM stdin;
1	1	Cotisation 2025 - 50000 XAF	1	[{"added": {}}]	82	1	2026-03-05 13:32:11.157105+00
2	1	OIC-000001 - root - 2025	1	[{"added": {}}]	78	1	2026-03-05 13:35:13.269849+00
3	1	OIC-000001 - root - 2025	2	[{"changed": {"fields": ["Amount due"]}}]	78	1	2026-03-05 13:36:24.413569+00
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailadmin	admin
3	wagtailcore	groupapprovaltask
4	wagtailcore	locale
5	wagtailcore	site
6	wagtailcore	groupsitepermission
7	wagtailcore	modellogentry
8	wagtailcore	revision
9	wagtailcore	collectionviewrestriction
10	wagtailcore	collection
11	wagtailcore	groupcollectionpermission
12	wagtailcore	uploadedfile
13	wagtailcore	workflowcontenttype
14	wagtailcore	workflowstate
15	wagtailcore	workflow
16	wagtailcore	workflowtask
17	wagtailcore	task
18	wagtailcore	taskstate
19	wagtailcore	grouppagepermission
20	wagtailcore	pageviewrestriction
21	wagtailcore	workflowpage
22	wagtailcore	pagelogentry
23	wagtailcore	comment
24	wagtailcore	commentreply
25	wagtailcore	pagesubscription
26	wagtailcore	referenceindex
27	wagtaildocs	document
28	wagtailimages	image
29	wagtailforms	formsubmission
30	wagtailredirects	redirect
31	wagtailembeds	embed
32	wagtailusers	userprofile
33	home	footertext
34	home	menu
35	wagtailimages	rendition
36	wagtailsearch	indexentry
37	wagtailsearch	sqliteftsindexentry
38	wagtailadmin	editingsession
39	taggit	tag
40	taggit	taggeditem
41	admin	logentry
42	auth	permission
43	auth	group
44	auth	user
45	contenttypes	contenttype
46	sessions	session
47	home	submenuitem
48	home	menuitem
49	home	homepage
50	blog	blogindexpage
51	blog	blogpage
52	home	footersettings
53	membres	member
54	membres	orgsection
55	membres	orgchartsectionmember
56	membres	orgchartsection
57	members	orgchartpage
58	home	standardpage
59	bibliotheque	documentcategory
60	bibliotheque	bibliothequeitem
61	bibliotheque	bibliothequepage
62	sites	site
63	account	emailaddress
64	account	emailconfirmation
65	socialaccount	socialaccount
66	socialaccount	socialapp
67	socialaccount	socialtoken
68	blog	blogcategory
69	blog	blogpagetag
70	home	homeheroslide
71	home	homequicklink
72	membres	memberannualdues
73	membres	payment
74	membres	memberprofile
75	membres	annualfee
76	members	member
77	members	orgsection
78	members	memberannualdues
79	members	memberprofile
80	members	orgchartV2page
81	members	orgchartsectionmember
82	members	annualfee
83	members	payment
84	members	orgchartsection
85	membres	orgchartv2page
86	members	authmenusettings
87	members	usermenufragment
88	members	usermenufragmentitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-02-24 15:09:52.007903+00
2	auth	0001_initial	2026-02-24 15:09:52.016138+00
3	admin	0001_initial	2026-02-24 15:09:52.020858+00
4	admin	0002_logentry_remove_auto_add	2026-02-24 15:09:52.028096+00
5	admin	0003_logentry_add_action_flag_choices	2026-02-24 15:09:52.03099+00
6	contenttypes	0002_remove_content_type_name	2026-02-24 15:09:52.038396+00
7	auth	0002_alter_permission_name_max_length	2026-02-24 15:09:52.043439+00
8	auth	0003_alter_user_email_max_length	2026-02-24 15:09:52.047899+00
9	auth	0004_alter_user_username_opts	2026-02-24 15:09:52.051395+00
10	auth	0005_alter_user_last_login_null	2026-02-24 15:09:52.058146+00
11	auth	0006_require_contenttypes_0002	2026-02-24 15:09:52.060429+00
12	auth	0007_alter_validators_add_error_messages	2026-02-24 15:09:52.066014+00
13	auth	0008_alter_user_username_max_length	2026-02-24 15:09:52.07393+00
14	auth	0009_alter_user_last_name_max_length	2026-02-24 15:09:52.085985+00
15	auth	0010_alter_group_name_max_length	2026-02-24 15:09:52.091484+00
16	auth	0011_update_proxy_permissions	2026-02-24 15:09:52.095275+00
17	auth	0012_alter_user_first_name_max_length	2026-02-24 15:09:52.100463+00
18	sessions	0001_initial	2026-02-24 15:09:52.103059+00
19	taggit	0001_initial	2026-02-24 15:09:52.108848+00
20	taggit	0002_auto_20150616_2121	2026-02-24 15:09:52.114816+00
21	taggit	0003_taggeditem_add_unique_index	2026-02-24 15:09:52.120861+00
22	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2026-02-24 15:09:52.132201+00
23	taggit	0005_auto_20220424_2025	2026-02-24 15:09:52.136429+00
24	taggit	0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx	2026-02-24 15:09:52.14769+00
25	wagtailcore	0001_initial	2026-02-24 15:09:52.197875+00
26	wagtailcore	0002_initial_data	2026-02-24 15:09:52.199021+00
27	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2026-02-24 15:09:52.199988+00
28	wagtailcore	0004_page_locked	2026-02-24 15:09:52.200855+00
29	wagtailcore	0005_add_page_lock_permission_to_moderators	2026-02-24 15:09:52.201712+00
30	wagtailcore	0006_add_lock_page_permission	2026-02-24 15:09:52.20253+00
31	wagtailcore	0007_page_latest_revision_created_at	2026-02-24 15:09:52.204215+00
32	wagtailcore	0008_populate_latest_revision_created_at	2026-02-24 15:09:52.205165+00
33	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2026-02-24 15:09:52.20618+00
34	wagtailcore	0010_change_page_owner_to_null_on_delete	2026-02-24 15:09:52.207137+00
35	wagtailcore	0011_page_first_published_at	2026-02-24 15:09:52.208085+00
36	wagtailcore	0012_extend_page_slug_field	2026-02-24 15:09:52.209204+00
37	wagtailcore	0013_update_golive_expire_help_text	2026-02-24 15:09:52.210534+00
38	wagtailcore	0014_add_verbose_name	2026-02-24 15:09:52.21153+00
39	wagtailcore	0015_add_more_verbose_names	2026-02-24 15:09:52.212407+00
40	wagtailcore	0016_change_page_url_path_to_text_field	2026-02-24 15:09:52.213239+00
41	wagtailcore	0017_change_edit_page_permission_description	2026-02-24 15:09:52.21797+00
42	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2026-02-24 15:09:52.225927+00
43	wagtailcore	0019_verbose_names_cleanup	2026-02-24 15:09:52.241529+00
44	wagtailcore	0020_add_index_on_page_first_published_at	2026-02-24 15:09:52.25032+00
45	wagtailcore	0021_capitalizeverbose	2026-02-24 15:09:52.377172+00
46	wagtailcore	0022_add_site_name	2026-02-24 15:09:52.382661+00
47	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2026-02-24 15:09:52.387338+00
48	wagtailcore	0024_collection	2026-02-24 15:09:52.390993+00
49	wagtailcore	0025_collection_initial_data	2026-02-24 15:09:52.396968+00
50	wagtailcore	0026_group_collection_permission	2026-02-24 15:09:52.408316+00
51	wagtailadmin	0001_create_admin_access_permissions	2026-02-24 15:09:52.416763+00
52	wagtailadmin	0002_admin	2026-02-24 15:09:52.418113+00
53	wagtailadmin	0003_admin_managed	2026-02-24 15:09:52.420381+00
54	wagtailadmin	0004_editingsession	2026-02-24 15:09:52.428485+00
55	wagtailadmin	0005_editingsession_is_editing	2026-02-24 15:09:52.436216+00
56	wagtailcore	0027_fix_collection_path_collation	2026-02-24 15:09:52.443323+00
57	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2026-02-24 15:09:52.450116+00
58	wagtailcore	0028_merge	2026-02-24 15:09:52.451619+00
59	wagtailcore	0029_unicode_slugfield_dj19	2026-02-24 15:09:52.461531+00
60	wagtailcore	0030_index_on_pagerevision_created_at	2026-02-24 15:09:52.469173+00
61	wagtailcore	0031_add_page_view_restriction_types	2026-02-24 15:09:52.488909+00
62	wagtailcore	0032_add_bulk_delete_page_permission	2026-02-24 15:09:52.495258+00
63	wagtailcore	0033_remove_golive_expiry_help_text	2026-02-24 15:09:52.506323+00
64	wagtailcore	0034_page_live_revision	2026-02-24 15:09:52.515504+00
65	wagtailcore	0035_page_last_published_at	2026-02-24 15:09:52.522191+00
66	wagtailcore	0036_populate_page_last_published_at	2026-02-24 15:09:52.531286+00
67	wagtailcore	0037_set_page_owner_editable	2026-02-24 15:09:52.537885+00
68	wagtailcore	0038_make_first_published_at_editable	2026-02-24 15:09:52.544854+00
69	wagtailcore	0039_collectionviewrestriction	2026-02-24 15:09:52.565037+00
70	wagtailcore	0040_page_draft_title	2026-02-24 15:09:52.582873+00
71	wagtailcore	0041_group_collection_permissions_verbose_name_plural	2026-02-24 15:09:52.58884+00
72	wagtailcore	0042_index_on_pagerevision_approved_go_live_at	2026-02-24 15:09:52.64437+00
73	wagtailcore	0043_lock_fields	2026-02-24 15:09:52.660197+00
74	wagtailcore	0044_add_unlock_grouppagepermission	2026-02-24 15:09:52.666264+00
75	wagtailcore	0045_assign_unlock_grouppagepermission	2026-02-24 15:09:52.676818+00
76	wagtailcore	0046_site_name_remove_null	2026-02-24 15:09:52.685226+00
77	wagtailcore	0047_add_workflow_models	2026-02-24 15:09:52.752021+00
78	wagtailcore	0048_add_default_workflows	2026-02-24 15:09:52.770923+00
79	wagtailcore	0049_taskstate_finished_by	2026-02-24 15:09:52.783616+00
80	wagtailcore	0050_workflow_rejected_to_needs_changes	2026-02-24 15:09:52.803121+00
81	wagtailcore	0051_taskstate_comment	2026-02-24 15:09:52.813169+00
82	wagtailcore	0052_pagelogentry	2026-02-24 15:09:52.825862+00
83	wagtailcore	0053_locale_model	2026-02-24 15:09:52.828249+00
84	wagtailcore	0054_initial_locale	2026-02-24 15:09:52.837692+00
85	wagtailcore	0055_page_locale_fields	2026-02-24 15:09:52.86182+00
86	wagtailcore	0056_page_locale_fields_populate	2026-02-24 15:09:52.87478+00
87	wagtailcore	0057_page_locale_fields_notnull	2026-02-24 15:09:52.902735+00
88	wagtailcore	0058_page_alias_of	2026-02-24 15:09:52.915315+00
89	wagtailcore	0059_apply_collection_ordering	2026-02-24 15:09:52.966303+00
90	wagtailcore	0060_fix_workflow_unique_constraint	2026-02-24 15:09:52.981362+00
91	wagtailcore	0061_change_promote_tab_helpt_text_and_verbose_names	2026-02-24 15:09:52.996187+00
92	wagtailcore	0062_comment_models_and_pagesubscription	2026-02-24 15:09:53.027205+00
93	wagtailcore	0063_modellogentry	2026-02-24 15:09:53.040541+00
94	wagtailcore	0064_log_timestamp_indexes	2026-02-24 15:09:53.064273+00
95	wagtailcore	0065_log_entry_uuid	2026-02-24 15:09:53.081756+00
96	wagtailcore	0066_collection_management_permissions	2026-02-24 15:09:53.092504+00
97	wagtailcore	0067_alter_pagerevision_content_json	2026-02-24 15:09:53.17538+00
98	wagtailcore	0068_log_entry_empty_object	2026-02-24 15:09:53.187442+00
99	wagtailcore	0069_log_entry_jsonfield	2026-02-24 15:09:53.234777+00
100	wagtailcore	0070_rename_pagerevision_revision	2026-02-24 15:09:53.419646+00
101	wagtailcore	0071_populate_revision_content_type	2026-02-24 15:09:53.432234+00
102	wagtailcore	0072_alter_revision_content_type_notnull	2026-02-24 15:09:53.463183+00
103	wagtailcore	0073_page_latest_revision	2026-02-24 15:09:53.477778+00
104	wagtailcore	0074_revision_object_str	2026-02-24 15:09:53.490441+00
105	wagtailcore	0075_populate_latest_revision_and_revision_object_str	2026-02-24 15:09:53.515487+00
106	wagtailcore	0076_modellogentry_revision	2026-02-24 15:09:53.532759+00
107	wagtailcore	0077_alter_revision_user	2026-02-24 15:09:53.544655+00
108	wagtailcore	0078_referenceindex	2026-02-24 15:09:53.562993+00
109	wagtailcore	0079_rename_taskstate_page_revision	2026-02-24 15:09:53.576679+00
110	wagtailcore	0080_generic_workflowstate	2026-02-24 15:09:53.654399+00
111	wagtailcore	0081_populate_workflowstate_content_type	2026-02-24 15:09:53.711525+00
112	wagtailcore	0082_alter_workflowstate_content_type_notnull	2026-02-24 15:09:53.740234+00
113	wagtailcore	0083_workflowcontenttype	2026-02-24 15:09:53.753925+00
114	wagtailcore	0084_add_default_page_permissions	2026-02-24 15:09:53.763666+00
115	wagtailcore	0085_add_grouppagepermission_permission	2026-02-24 15:09:53.785764+00
116	wagtailcore	0086_populate_grouppagepermission_permission	2026-02-24 15:09:53.816057+00
117	wagtailcore	0087_alter_grouppagepermission_unique_together_and_more	2026-02-24 15:09:53.853808+00
118	wagtailcore	0088_fix_log_entry_json_timestamps	2026-02-24 15:09:53.8888+00
119	wagtailcore	0089_log_entry_data_json_null_to_object	2026-02-24 15:09:53.900134+00
120	wagtailcore	0090_remove_grouppagepermission_permission_type	2026-02-24 15:09:53.938638+00
121	wagtailcore	0091_remove_revision_submitted_for_moderation	2026-02-24 15:09:53.951976+00
122	wagtailcore	0092_alter_collectionviewrestriction_password_and_more	2026-02-24 15:09:54.010555+00
123	wagtailcore	0093_uploadedfile	2026-02-24 15:09:54.025753+00
124	wagtailcore	0094_alter_page_locale	2026-02-24 15:09:54.037028+00
125	wagtailcore	0095_groupsitepermission	2026-02-24 15:09:54.051357+00
126	wagtailcore	0096_referenceindex_referenceindex_source_object_and_more	2026-02-24 15:09:54.066371+00
127	wagtaildocs	0001_initial	2026-02-24 15:09:54.083171+00
128	wagtaildocs	0002_initial_data	2026-02-24 15:09:54.108003+00
129	wagtaildocs	0003_add_verbose_names	2026-02-24 15:09:54.144723+00
130	wagtaildocs	0004_capitalizeverbose	2026-02-24 15:09:54.208633+00
131	wagtaildocs	0005_document_collection	2026-02-24 15:09:54.228777+00
132	wagtaildocs	0006_copy_document_permissions_to_collections	2026-02-24 15:09:54.242814+00
133	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2026-02-24 15:09:54.255851+00
134	wagtaildocs	0007_merge	2026-02-24 15:09:54.258213+00
135	wagtaildocs	0008_document_file_size	2026-02-24 15:09:54.268374+00
136	wagtaildocs	0009_document_verbose_name_plural	2026-02-24 15:09:54.277116+00
137	wagtaildocs	0010_document_file_hash	2026-02-24 15:09:54.330822+00
138	wagtaildocs	0011_add_choose_permissions	2026-02-24 15:09:54.369237+00
139	wagtaildocs	0012_uploadeddocument	2026-02-24 15:09:54.382517+00
140	wagtaildocs	0013_delete_uploadeddocument	2026-02-24 15:09:54.385204+00
141	wagtaildocs	0014_alter_document_file_size	2026-02-24 15:09:54.397277+00
142	wagtailembeds	0001_initial	2026-02-24 15:09:54.400669+00
143	wagtailembeds	0002_add_verbose_names	2026-02-24 15:09:54.402475+00
144	wagtailembeds	0003_capitalizeverbose	2026-02-24 15:09:54.404313+00
145	wagtailembeds	0004_embed_verbose_name_plural	2026-02-24 15:09:54.406545+00
146	wagtailembeds	0005_specify_thumbnail_url_max_length	2026-02-24 15:09:54.411837+00
147	wagtailembeds	0006_add_embed_hash	2026-02-24 15:09:54.416977+00
148	wagtailembeds	0007_populate_hash	2026-02-24 15:09:54.429382+00
149	wagtailembeds	0008_allow_long_urls	2026-02-24 15:09:54.44786+00
150	wagtailembeds	0009_embed_cache_until	2026-02-24 15:09:54.4523+00
151	wagtailforms	0001_initial	2026-02-24 15:09:54.466645+00
152	wagtailforms	0002_add_verbose_names	2026-02-24 15:09:54.47767+00
153	wagtailforms	0003_capitalizeverbose	2026-02-24 15:09:54.488335+00
154	wagtailforms	0004_add_verbose_name_plural	2026-02-24 15:09:54.495722+00
155	wagtailforms	0005_alter_formsubmission_form_data	2026-02-24 15:09:54.504159+00
156	wagtailimages	0001_initial	2026-02-24 15:09:54.562919+00
157	wagtailimages	0002_initial_data	2026-02-24 15:09:54.56409+00
158	wagtailimages	0003_fix_focal_point_fields	2026-02-24 15:09:54.565163+00
159	wagtailimages	0004_make_focal_point_key_not_nullable	2026-02-24 15:09:54.566095+00
160	wagtailimages	0005_make_filter_spec_unique	2026-02-24 15:09:54.567303+00
161	wagtailimages	0006_add_verbose_names	2026-02-24 15:09:54.568119+00
162	wagtailimages	0007_image_file_size	2026-02-24 15:09:54.569445+00
163	wagtailimages	0008_image_created_at_index	2026-02-24 15:09:54.57055+00
164	wagtailimages	0009_capitalizeverbose	2026-02-24 15:09:54.571526+00
165	wagtailimages	0010_change_on_delete_behaviour	2026-02-24 15:09:54.572489+00
166	wagtailimages	0011_image_collection	2026-02-24 15:09:54.57337+00
167	wagtailimages	0012_copy_image_permissions_to_collections	2026-02-24 15:09:54.574589+00
168	wagtailimages	0013_make_rendition_upload_callable	2026-02-24 15:09:54.57547+00
169	wagtailimages	0014_add_filter_spec_field	2026-02-24 15:09:54.576336+00
170	wagtailimages	0015_fill_filter_spec_field	2026-02-24 15:09:54.57724+00
171	wagtailimages	0016_deprecate_rendition_filter_relation	2026-02-24 15:09:54.578075+00
172	wagtailimages	0017_reduce_focal_point_key_max_length	2026-02-24 15:09:54.579351+00
173	wagtailimages	0018_remove_rendition_filter	2026-02-24 15:09:54.580233+00
174	wagtailimages	0019_delete_filter	2026-02-24 15:09:54.581111+00
175	wagtailimages	0020_add-verbose-name	2026-02-24 15:09:54.581981+00
176	wagtailimages	0021_image_file_hash	2026-02-24 15:09:54.582855+00
177	wagtailimages	0022_uploadedimage	2026-02-24 15:09:54.597191+00
178	wagtailimages	0023_add_choose_permissions	2026-02-24 15:09:54.669472+00
179	wagtailimages	0024_index_image_file_hash	2026-02-24 15:09:54.685416+00
180	wagtailimages	0025_alter_image_file_alter_rendition_file	2026-02-24 15:09:54.703139+00
181	wagtailimages	0026_delete_uploadedimage	2026-02-24 15:09:54.705529+00
182	wagtailimages	0027_image_description	2026-02-24 15:09:54.71893+00
183	wagtailredirects	0001_initial	2026-02-24 15:09:54.735025+00
184	wagtailredirects	0002_add_verbose_names	2026-02-24 15:09:54.752529+00
185	wagtailredirects	0003_make_site_field_editable	2026-02-24 15:09:54.766011+00
186	wagtailredirects	0004_set_unique_on_path_and_site	2026-02-24 15:09:54.782949+00
187	wagtailredirects	0005_capitalizeverbose	2026-02-24 15:09:54.82775+00
188	wagtailredirects	0006_redirect_increase_max_length	2026-02-24 15:09:54.840079+00
189	wagtailredirects	0007_add_autocreate_fields	2026-02-24 15:09:54.869744+00
190	wagtailredirects	0008_add_verbose_name_plural	2026-02-24 15:09:54.876675+00
191	wagtailsearch	0001_initial	2026-02-24 15:09:54.909029+00
192	wagtailsearch	0002_add_verbose_names	2026-02-24 15:09:54.975206+00
193	wagtailsearch	0003_remove_editors_pick	2026-02-24 15:09:54.97761+00
194	wagtailsearch	0004_querydailyhits_verbose_name_plural	2026-02-24 15:09:54.981045+00
195	wagtailsearch	0005_create_indexentry	2026-02-24 15:09:55.007789+00
196	wagtailsearch	0006_customise_indexentry	2026-02-24 15:09:55.04677+00
197	wagtailsearch	0007_delete_editorspick	2026-02-24 15:09:55.050325+00
198	wagtailsearch	0008_remove_query_and_querydailyhits_models	2026-02-24 15:09:55.061952+00
199	wagtailsearch	0009_remove_ngram_autocomplete	2026-02-24 15:09:55.062986+00
200	wagtailusers	0001_initial	2026-02-24 15:09:55.077659+00
201	wagtailusers	0002_add_verbose_name_on_userprofile	2026-02-24 15:09:55.101005+00
202	wagtailusers	0003_add_verbose_names	2026-02-24 15:09:55.111058+00
203	wagtailusers	0004_capitalizeverbose	2026-02-24 15:09:55.140237+00
204	wagtailusers	0005_make_related_name_wagtail_specific	2026-02-24 15:09:55.154865+00
205	wagtailusers	0006_userprofile_prefered_language	2026-02-24 15:09:55.165998+00
206	wagtailusers	0007_userprofile_current_time_zone	2026-02-24 15:09:55.177494+00
207	wagtailusers	0008_userprofile_avatar	2026-02-24 15:09:55.189159+00
208	wagtailusers	0009_userprofile_verbose_name_plural	2026-02-24 15:09:55.19775+00
209	wagtailusers	0010_userprofile_updated_comments_notifications	2026-02-24 15:09:55.20921+00
210	wagtailusers	0011_userprofile_dismissibles	2026-02-24 15:09:55.219876+00
211	wagtailusers	0012_userprofile_theme	2026-02-24 15:09:55.26886+00
212	wagtailusers	0013_userprofile_density	2026-02-24 15:09:55.280992+00
213	wagtailusers	0014_userprofile_contrast	2026-02-24 15:09:55.292701+00
214	wagtailusers	0015_userprofile_keyboard_shortcuts	2026-02-24 15:09:55.303555+00
215	wagtailimages	0001_squashed_0021	2026-02-24 15:09:55.305861+00
216	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2026-02-24 15:09:55.306999+00
217	blog	0001_initial	2026-02-24 15:14:59.434592+00
218	home	0001_initial	2026-02-24 15:14:59.483273+00
219	home	0002_footersettings	2026-02-25 10:51:01.752596+00
220	home	0003_alter_footersettings_options_and_more	2026-02-25 10:57:52.001774+00
221	membres	0001_initial	2026-02-25 11:38:22.557265+00
222	home	0004_standardpage	2026-02-25 12:32:29.058449+00
223	bibliotheque	0001_initial	2026-02-25 13:14:41.310014+00
224	account	0001_initial	2026-02-25 14:02:04.807616+00
225	account	0002_email_max_length	2026-02-25 14:02:04.821841+00
226	account	0003_alter_emailaddress_create_unique_verified_email	2026-02-25 14:02:04.839714+00
227	account	0004_alter_emailaddress_drop_unique_email	2026-02-25 14:02:04.853861+00
228	account	0005_emailaddress_idx_upper_email	2026-02-25 14:02:04.863466+00
229	account	0006_emailaddress_lower	2026-02-25 14:02:04.908767+00
230	account	0007_emailaddress_idx_email	2026-02-25 14:02:04.931449+00
231	account	0008_emailaddress_unique_primary_email_fixup	2026-02-25 14:02:04.949222+00
232	account	0009_emailaddress_unique_primary_email	2026-02-25 14:02:04.959781+00
233	sites	0001_initial	2026-02-25 14:02:04.963008+00
234	sites	0002_alter_domain_unique	2026-02-25 14:02:04.968601+00
235	socialaccount	0001_initial	2026-02-25 14:02:05.021125+00
236	socialaccount	0002_token_max_lengths	2026-02-25 14:02:05.0477+00
237	socialaccount	0003_extra_data_default_dict	2026-02-25 14:02:05.057234+00
238	socialaccount	0004_app_provider_id_settings	2026-02-25 14:02:05.08146+00
239	socialaccount	0005_socialtoken_nullable_app	2026-02-25 14:02:05.106604+00
240	socialaccount	0006_alter_socialaccount_extra_data	2026-02-25 14:02:05.119508+00
241	blog	0002_blogpage_image_blogpage_intro	2026-02-28 09:06:00.683691+00
242	blog	0003_blogcategory_blogpage_featured_alter_blogpage_body_and_more	2026-02-28 09:53:12.344316+00
243	home	0005_homepage_editorial_body_homepage_editorial_title_and_more	2026-03-04 20:54:55.179006+00
244	membres	0002_annualfee_memberprofile_memberannualdues_payment	2026-03-05 11:14:07.35107+00
245	members	0001_initial	2026-03-05 11:34:49.311576+00
246	members	0002_authmenusettings	2026-03-05 14:07:19.644275+00
247	members	0003_delete_authmenusettings	2026-03-05 14:15:30.597478+00
248	members	0004_usermenufragment_usermenufragmentitem	2026-03-05 14:24:05.334898+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8f5towuhz2c3676lauj2tswaitpcwpl0	.eJxVjEEOwiAQRe_C2pApDqBduvcMBJipRQ000CYa4921SRe6_e_99xLOL_PolsbVJRK96MTudws-3jivgK4-X4qMJc81BbkqcqNNngvx_bS5f4HRt_H7ZkalrTGIREF5gxa408oCAnKIQHtQBiFqH1XUrDUZgsFY6g72CMOwRhu3lkp2_JhSfYoe3h9oFj6g:1vuuAw:JGXJ-qnWmRnCOhEGAtRJfly2-18DeM8Ggc8lyduuy7M	2026-03-10 15:18:14.327462+00
3av5z1icelwfxczrvp4vczfujxqf7vsf	.eJyNkU1O5DAQhe9S6yhyQv46qxF7ToCQVbEriafTdmQ7QKvVd6fcZBiQQGLjVOp9dj0_XwCVcpuNErc4k41GYTTOyhPF2ekA_eMF3mvoYcUQXpzXkAFG6Iu2LUXZ1YdD3jWi7boM6IRmYdI7F_-kJVfuBNen7GPO4iZjob_AFsjL9chwAftG-UzejLsFFk5oNUbnzwwEM9lthX7EJVAGnrTxpKLcPM-z27L8NDyDdXaW_kHpHFzk8QX9FD6aESMlU1xMFFJ18ymHs1RO3yR2gvy9ZjCzrYU4kOg34v-b67Pcx_yC3I3-J1lSm_ecP9v_AiXJWBMNG9Tym9RFcceIDBRCejd6XQ3n1QvupSeVt5iN3mP-1BtQHckmQf9FOzkOy0Zvhjwh-a6G_IGvv9zv7JcDZgwz7yaqyrptmqrSeiixqVpBRV22ohIVDUroO1E2lVA1qlLVVNe60WJsWl107UGMI1zfAElC20s:1vvFbF:ZRH-XNpy2GkLeiRUbwNvu188DiEtilBx9YBLrR4eL7U	2026-03-11 14:10:49.597959+00
var6xlbtzaq9wt40r8iwucv0rcp2ag8g	.eJylkk1rwzAMhv-Lz5mRv52ctv2NMYw_FBLaxCV22Ebpf1_SdYcexg69CPFKeniRdCY-xrzO1fm1DjjXMfo65tlNWIecCunezuQnJx05-VI-8pJIQ3wlHTOGc22E4FQqyRTjDcHJj8etdcm5Pu-BxjyRS_M_xSraaitAPERpNQUtGQj9AMUqRSVrBUj5AKXVu5eWGfu3l_eGuIKl7CvHz9O4fJEONu2X6BYsWN0BN50keQrT-sRC6sEmwUApzgMEtMrqiGhFYH2vNxfXa7q14OLG3SC714KPB5z3gj8ed5nevoBee27lQl_ufuL1NnWHGnwZNg6i5MpoLWVKgXstDSBT3IAEiSFCEsC1hKh85FGhUkkn6LVJzJoW-p5cvgFcXM76:1vwFrC:mnK_8rCUbL2gFgN5ExcJW3c7JZIjWfy_Ds-YX9fq_-8	2026-03-14 08:39:26.076649+00
bzhwji4d9z7o7o7de300bvtaeazyxwmu	.eJxVjU0OgjAQhe_StSFDnbbKTi_SDNMhNJJiaJtojHcXDAtdvr_vvZSnWkZfsyw-BtWpVh1-vZ74JmkLaJo2uyHmuabSfDt7nJvLqiSVyFTinK776g81Uh5Xjghq46xFDKHXZNGBtEY7QEDpGcIRtEVgQ6zZiDHBBhisC-3JnWEYNmiWnNcbL497XJ6qg_cHmSJDFA:1vxNEX:kOXUSM3qGfYn7YjJw026E0p0zVMG7Ykf3n2cQtFCYUM	2026-03-17 10:44:09.360412+00
dk16qbnzlcecky7q9hoxkjttwtjij0gu	.eJxVjU0OgjAQhe_StSFDnbbKTi_SDNMhNJJiaJtojHcXDAtdvr_vvZSnWkZfsyw-BtWpVh1-vZ74JmkLaJo2uyHmuabSfDt7nJvLqiSVyFTinK776g81Uh5Xjghq46xFDKHXZNGBtEY7QEDpGcIRtEVgQ6zZiDHBBhisC-3JnWEYNmiWnNcbL497XJ6qg_cHmSJDFA:1vxPsV:cL5bFkWPOj4MWB-CCsdmNqQA2M1GhZBDGo0gTIZDh1Y	2026-03-17 13:33:35.259158+00
xtf5a7mhjveo8v7l57zd4gl8suvsc8jq	.eJxVjEEOwiAQRe_C2pApDqBduvcMBJipRQ000CYa4921SRe6_e_99xLOL_PolsbVJRK96MTudws-3jivgK4-X4qMJc81BbkqcqNNngvx_bS5f4HRt_H7ZkalrTGIREF5gxa408oCAnKIQHtQBiFqH1XUrDUZgsFY6g72CMOwRhu3lkp2_JhSfYoe3h9oFj6g:1vxlc0:XOx8iE1uxD15SeGx8Fx7vZouXzA7OV43sWmXwVVFQ9I	2026-03-18 12:46:00.485789+00
cbcrm8u0iz782slhxpuln8axodgabv0n	.eJxVkE1uhDAMhe_iNYpMyA_DqtNrVBUyiRFRgYxIUFuN5u6dTNmwsaz37M9PvgM5F_c197TnidccHOUQ137hPEWfoPu4w38PHdwope-4eaiAMnS1tdJKeVGtaBQ2spUV8EJhfo5uMea3UoSLCzw-K3hd6PfEWx8KrIaTNpD74rUYNM9FFkcy8Zo57CSup5zvx9YJNVGanhxmJbU1RinvB0lGWeRaS4sKFQ8OfYPSKHSanHSatfbG42isr1t7wXEs0MQplXfwzy1sv9Dh4w-v62Xy:1vyADc:U4JwIAexDcdLwYXi-q7V6wtsCbS3AXYu2HXegTtbbDc	2026-03-19 15:02:28.346005+00
sbw83p83tmoi19jnv4enqpslq85oimg5	.eJxVkN1qwzAMhd9F18HYrn_qXLV9jTGCYivELIlL7LCN0ndf3eUmN0KcI3066AHofdqW0uFWRlpK9FhiWrqZyphChvbjAf89tHDHnL_TGqABLNAKa-XZOaMFM84JIVUDNGOcXqNrSuVSC_NphudnA-8L3ZZp7WKFCThoPfovWqqB01Rltidj75ndzux6yHnbtw6oEfP44hApqa0xSoXQSzTKchJaWq64ot7zcOLSKO41euk1aR1M4IOxQZyt48NQoZlyru-gn3tcf6Hlzz--zWYC:1vyuBf:T9NXGw_tJeq8N5_AFXVBN5kNY7khcEGtvtCjkPXDHSI	2026-03-21 16:07:31.703495+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.django_site (id, name, domain) FROM stdin;
1	Local	127.0.0.1:8000
\.


--
-- Data for Name: home_footersettings; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_footersettings (id, site_id, about_text, about_title, footer_bg_class, footer_text_class, links, links_title, social_title, socials) FROM stdin;
1	2	<p data-block-key="v8ww4">OIC est une organisation qui regroupe les ingénieurs du Congo autour des thématiques liées aux métiers de l'ingénieur.</p>	À propos	bg-navy	text-light	[]	Liens utiles	Suivez-nous	[]
\.


--
-- Data for Name: home_footertext; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_footertext (id, title, body) FROM stdin;
1	Copyright	
\.


--
-- Data for Name: home_homeheroslide; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_homeheroslide (id, sort_order, title, subtitle, cta_text, cta_page_id, image_id, page_id) FROM stdin;
1	0			En savoir plus	\N	11	23
3	1			En savoir plus	\N	8	23
\.


--
-- Data for Name: home_homepage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_homepage (page_ptr_id, editorial_body, editorial_title, latest_articles_count, latest_articles_title, perspectives_excerpt, perspectives_page_id, perspectives_title, show_latest_articles, spotlight_page_id, spotlight_title, tagline) FROM stdin;
23	<p data-block-key="xml20"><b>« L’ingénieur au cœur du développement du Congo »</b></p><p data-block-key="54kno">L’Ordre des Ingénieurs du Congo (OIC) est né d’un rêve partagé, d’un idéal porté avec constance par plusieurs générations d’ingénieurs. Ce rêve est aujourd’hui devenu réalité : celle d’une institution nationale, légale et structurée, au service de l’excellence, de l’éthique et du développement.</p><p data-block-key="4bor7">La création de l’OIC marque un tournant historique. Elle consacre la reconnaissance officielle du rôle central que joue l’ingénieur dans la transformation de notre pays. Elle affirme, avec force, que l’ingénieur ne saurait rester dans l’ombre, tant son savoir, son expertise et sa responsabilité sociétale sont essentiels à la construction du Congo de demain.</p><p data-block-key="8kacm">La première cérémonie de prestation de serment des ingénieurs inscrits au tableau de l’Ordre restera comme un acte fondateur. Elle scelle l’engagement d’hommes et de femmes de science à exercer leur métier dans le respect des normes, de l’intégrité et du bien commun. Elle institue une exigence : celle de la compétence assumée, de la formation continue et de la redevabilité.</p><p data-block-key="hkpq">Plus qu’un simple cadre réglementaire, l’OIC est désormais un pilier du développement. Il veille à la qualité de la pratique professionnelle, à la promotion de l’innovation et à la valorisation des ingénieurs congolais, où qu’ils exercent.</p><p data-block-key="301b7">Adhérer à l’Ordre, c’est reconnaître la valeur de notre métier. C’est aussi se hisser à la hauteur de nos responsabilités, dans un contexte où la maîtrise technique, la rigueur et l’éthique sont plus que jamais indispensables.</p><p data-block-key="8sk2d">À tous les ingénieurs congolais, j’adresse un appel : rejoignez l’Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d’une profession qui bâtit, qui conçoit, qui innove.</p><p data-block-key="69s7g">L’avenir de l’ingénierie congolaise est entre nos mains. À nous de l’élever à la hauteur des défis de notre temps.</p><p data-block-key="dgml9">Le Président de l’OIC<br/>Ordre des Ingénieurs du Congo</p>	Editorial	5	Articles		\N	Regards d’ingénieurs	t	\N	Un ingénieur, un impact	
\.


--
-- Data for Name: home_homequicklink; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_homequicklink (id, sort_order, title, text, image_id, link_page_id, page_id) FROM stdin;
1	0	Documentation	Accédez à notre espace de ressources où vous trouverez des rapports, publications, études et autres documents officiels de l’OIC.	13	\N	23
2	2	Tableau d'honneur	Découvrez la liste des ingénieurs et entreprises inscrits au tableau de l’Ordre au titre de l’année 2025.	14	\N	23
4	1	Actualité	Retrouvez ici toutes les actualités et communiqués de presse de l’OIC, ainsi que les informations médiatiques relatives à nos activités et projets.	15	\N	23
\.


--
-- Data for Name: home_menu; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_menu (id, name) FROM stdin;
1	main
\.


--
-- Data for Name: home_menuitem; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_menuitem (id, sort_order, title, link_url, show_children, visibility, link_page_id, menu_id) FROM stdin;
1	0	Blog		t	all	6	1
2	1	Accueil		t	all	6	1
3	2	Organes		t	all	\N	1
4	3	Bibliographie		t	all	27	1
5	4	A propos		t	all	28	1
\.


--
-- Data for Name: home_standardpage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_standardpage (page_ptr_id, hero_alt, show_toc, intro, body, hero_image_id) FROM stdin;
25		t	<p data-block-key="uindk">L’assemblée générale regroupe l’ensemble des ingénieurs inscrits au tableau de l’Ordre. Elle est l’instance suprême de l’Ordre des Ingénieurs du Congo.</p><p data-block-key="1ljhg">Elle est chargée notamment de :</p><ul><li data-block-key="393oc">procéder à l’élection des membres du conseil national de l’Ordre ;</li><li data-block-key="8abbp">adopter les rapports du conseil national de l’Ordre ;</li><li data-block-key="9bkiq">approuver les comptes de gestion et les comptes administratifs du conseil national de l’Ordre de l’année écoulée ;</li><li data-block-key="fe3oq">adopter les projets de délibérations et de recommandations du conseil national de l’Ordre ;</li><li data-block-key="40pii">approuver les décisions d’acceptation ou de refus d’inscription au tableau de l’Ordre des nouveaux membres ;</li><li data-block-key="3osp">voter le budget de l’Ordre ;</li><li data-block-key="21ir0">adopter le règlement intérieur de l’Ordre ;</li><li data-block-key="4p1d4">fixer les montants des cotisations ;</li><li data-block-key="cdch">approuver les orientations de la politique de l’Ordre.</li></ul>	[]	12
28		t	<p data-block-key="ps8t5">OIC blab Lola </p>	[{"type": "paragraphe", "value": "<p data-block-key=\\"558wy\\">Notre dite hvvahgjh km jqlkjq</p><p data-block-key=\\"62cpr\\">cnkk</p><p data-block-key=\\"3714b\\"></p><p data-block-key=\\"eogeq\\"></p>", "id": "e586c365-82f6-423f-9a95-7bcf33a065eb"}]	\N
\.


--
-- Data for Name: home_submenuitem; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.home_submenuitem (id, sort_order, title, link_url, link_page_id, parent_id) FROM stdin;
1	1	Bureau exécutif		24	3
2	0	Assemblée générale		25	3
3	2	Conseil national		26	3
\.


--
-- Data for Name: members_annualfee; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_annualfee (id, year, amount, currency, is_open) FROM stdin;
1	2025	50000	XAF	t
\.


--
-- Data for Name: members_member; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_member (id, role, name, subtitle, photo_id) FROM stdin;
1	Président	Ing. ANDALETIA Victor	Président de l'Ordre	1
2	Vice Président	Ing. MBERI Daniel		2
3	Secrétaire général	Ing. MANGOUELE BEOLEH		3
4	Secrétaire général adjoint	Ing. ESSOBINGOUE NDZANGA		4
5	Trésorière	Ing. NGAMBOMI Doria Vaneça		6
6	Membre du Conseil	Ing. NANA Adrien		7
7	Membre du Conseil	Ing. OSSETE Jean Michel		8
8	Membre du Conseil	Ing. MATOKOT KIBOUKA Benjamin		9
9	Membre du Conseil	Ing. KOUKOUDIA NAMOUNA Sylvain		10
10	Membre du Conseil	Ing. ANDZOUANGOLI Delphin		11
11	Membre du Conseil	Ing. ETOKABEKA Job Sylvanus		12
\.


--
-- Data for Name: members_memberannualdues; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_memberannualdues (id, created_at, status, amount_due, fee_id, member_id) FROM stdin;
1	2026-03-05 13:35:13.26447+00	partial	50000	1	1
\.


--
-- Data for Name: members_memberprofile; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_memberprofile (id, member_no, is_active_member, user_id) FROM stdin;
1	OIC-000001	t	1
\.


--
-- Data for Name: members_orgchartpage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_orgchartpage (page_ptr_id, intro) FROM stdin;
24	
26	
\.


--
-- Data for Name: members_orgchartsection; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_orgchartsection (id, sort_order, page_id, section_id) FROM stdin;
1	0	24	1
2	1	24	1
3	0	26	1
4	1	26	1
\.


--
-- Data for Name: members_orgchartsectionmember; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_orgchartsectionmember (id, sort_order, member_id, parent_id) FROM stdin;
1	0	1	1
2	0	2	2
3	1	3	2
4	2	4	2
5	3	5	2
6	0	1	3
7	6	2	4
8	4	3	4
9	1	4	4
10	8	5	4
11	7	6	4
12	9	7	4
13	5	8	4
14	3	9	4
15	0	10	4
16	2	11	4
\.


--
-- Data for Name: members_orgsection; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_orgsection (id, title) FROM stdin;
1	-
\.


--
-- Data for Name: members_payment; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_payment (id, amount, method, status, reference, note, initiated_at, confirmed_at, dues_id, provider, payer_phone, provider_reference, external_id, provider_status, provider_payload, failed_at) FROM stdin;
611c888fad2a402f970e7a2ac139a5bc	5501	cash	confirmed			2026-03-05 13:47:46.675212+00	2026-03-05 13:47:46.677582+00	1	\N	\N	\N	\N	\N	\N	\N
b3852886d60f4e26ae90be64b942ce90	20001	mobile	confirmed			2026-03-05 13:53:56.954118+00	2026-03-05 13:53:56.9568+00	1	\N	\N	\N	\N	\N	\N	\N
c7d1b8a44432406cba2b6c8cf57d90ba	11100	bank	confirmed			2026-03-05 15:22:15.543025+00	2026-03-05 15:22:15.545745+00	1	\N	\N	\N	\N	\N	\N	\N
f01aa096b0ad4e69ab6d225933ac2452	100	mobile	confirmed			2026-03-05 15:22:44.445924+00	2026-03-05 15:22:44.448175+00	1	\N	\N	\N	\N	\N	\N	\N
e5154b52635c4504a5e3437b98dbac03	5500	mobile	confirmed			2026-03-05 15:23:26.696146+00	2026-03-05 15:23:26.699205+00	1	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: members_usermenufragment; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_usermenufragment (id, name) FROM stdin;
1	default
\.


--
-- Data for Name: members_usermenufragmentitem; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.members_usermenufragmentitem (id, sort_order, label, url, only_staff, open_in_new_tab, fragment_id) FROM stdin;
1	0	Mes cotisations	/me/cotisations	f	t	1
2	1	Administration	/admin/	t	f	1
\.


--
-- Data for Name: membres_annualfee; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_annualfee (id, year, amount, currency, is_open) FROM stdin;
\.


--
-- Data for Name: membres_member; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_member (id, role, name, subtitle, photo_id) FROM stdin;
1	Président	Ing. ANDALETIA Victor	Président de l'Ordre	1
2	Vice Président	Ing. MBERI Daniel		2
3	Secrétaire général	Ing. MANGOUELE BEOLEH		3
4	Secrétaire général adjoint	Ing. ESSOBINGOUE NDZANGA		4
5	Trésorière	Ing. NGAMBOMI Doria Vaneça		6
6	Membre du Conseil	Ing. NANA Adrien		7
7	Membre du Conseil	Ing. OSSETE Jean Michel		8
8	Membre du Conseil	Ing. MATOKOT KIBOUKA Benjamin		9
9	Membre du Conseil	Ing. KOUKOUDIA NAMOUNA Sylvain		10
10	Membre du Conseil	Ing. ANDZOUANGOLI Delphin		11
11	Membre du Conseil	Ing. ETOKABEKA Job Sylvanus		12
\.


--
-- Data for Name: membres_memberannualdues; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_memberannualdues (id, created_at, status, amount_due, fee_id, member_id) FROM stdin;
\.


--
-- Data for Name: membres_memberprofile; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_memberprofile (id, member_no, is_active_member, user_id) FROM stdin;
\.


--
-- Data for Name: membres_orgchartpage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_orgchartpage (page_ptr_id, intro) FROM stdin;
24	
26	
\.


--
-- Data for Name: membres_orgchartsection; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_orgchartsection (id, sort_order, page_id, section_id) FROM stdin;
1	0	24	1
2	1	24	1
3	0	26	1
4	1	26	1
\.


--
-- Data for Name: membres_orgchartsectionmember; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_orgchartsectionmember (id, sort_order, member_id, parent_id) FROM stdin;
1	0	1	1
2	0	2	2
3	1	3	2
4	2	4	2
5	3	5	2
6	0	1	3
7	6	2	4
8	4	3	4
9	1	4	4
10	8	5	4
11	7	6	4
12	9	7	4
13	5	8	4
14	3	9	4
15	0	10	4
16	2	11	4
\.


--
-- Data for Name: membres_orgsection; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_orgsection (id, title) FROM stdin;
1	-
\.


--
-- Data for Name: membres_payment; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.membres_payment (id, amount, method, status, reference, note, initiated_at, confirmed_at, dues_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, user_id, extra_data) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key, provider_id, settings) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: wagtailadmin_admin; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailadmin_admin (id) FROM stdin;
\.


--
-- Data for Name: wagtailadmin_editingsession; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailadmin_editingsession (id, object_id, last_seen_at, content_type_id, user_id, is_editing) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_comment; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_comment (id, text, contentpath, "position", created_at, updated_at, resolved_at, page_id, resolved_by_id, revision_created_id, user_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_commentreply; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_commentreply (id, text, created_at, updated_at, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_groupapprovaltask; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_groupapprovaltask (task_ptr_id) FROM stdin;
1
\.


--
-- Data for Name: wagtailcore_groupapprovaltask_groups; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_groupapprovaltask_groups (id, groupapprovaltask_id, group_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	2	106
2	1	1	106
3	1	2	107
4	1	1	107
5	1	2	109
6	1	1	109
7	1	2	110
8	1	1	110
9	1	2	111
10	1	1	111
11	1	2	113
12	1	1	113
\.


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_grouppagepermission (id, group_id, page_id, permission_id) FROM stdin;
1	1	1	66
2	1	1	67
3	1	1	72
4	2	1	66
5	2	1	67
6	1	1	71
7	1	1	73
\.


--
-- Data for Name: wagtailcore_groupsitepermission; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_groupsitepermission (id, group_id, permission_id, site_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_locale; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_locale (id, language_code) FROM stdin;
1	en
\.


--
-- Data for Name: wagtailcore_modellogentry; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_modellogentry (id, label, action, "timestamp", content_changed, deleted, object_id, content_type_id, user_id, uuid, revision_id, data) FROM stdin;
1	localhost [default]	wagtail.edit	2026-02-24 15:22:13.649554+00	t	f	1	5	1	ec06453fc65b421f80b48e315f67c71b	\N	{}
2	main	wagtail.create	2026-02-24 15:23:28.406281+00	t	f	1	34	1	cf96addf30b0407181674f046c37ab14	\N	{}
3	main	wagtail.edit	2026-02-24 15:30:43.58877+00	t	f	1	34	1	aa155b64080148688f4dce101d0397a5	\N	{}
4	main	wagtail.edit	2026-02-24 15:32:30.454712+00	f	f	1	34	1	aea5c84a647e4a99b6a8bfae24c8edb6	\N	{}
5	localhost	wagtail.create	2026-02-24 15:43:41.989695+00	t	f	2	5	1	1e10331db87a429183ee9bdde8a16416	\N	{}
6	OIC	wagtail.edit	2026-02-24 15:44:09.221477+00	t	f	2	5	1	5d776774915d4ee1b9550083ca5c1c1c	\N	{}
7	OIC	wagtail.edit	2026-02-24 15:46:13.104085+00	f	f	2	5	1	d805e036497e4decafd5b92e581585f1	\N	{}
8	main	wagtail.edit	2026-02-24 16:14:10.593298+00	t	f	1	34	1	25229d1c9bb840f4b427d4bf26dfaf61	\N	{}
9	OIC	wagtail.edit	2026-02-24 16:17:02.965743+00	f	f	2	5	1	33cefe485761430ebbbcba99a8301127	\N	{}
10	Copyright	wagtail.create	2026-02-24 16:21:33.462296+00	t	f	1	33	1	bbfc1b288153445ba33f310504784c99	\N	{}
11	main	wagtail.edit	2026-02-24 16:27:02.520605+00	t	f	1	34	1	8ba2f3d4e20946738dab3fa74f1dc567	\N	{}
12	main	wagtail.edit	2026-02-24 16:34:47.651269+00	f	f	1	34	1	a21a78d35a934790ba9770e6ec2f02e2	\N	{}
13	main	wagtail.edit	2026-02-24 16:51:19.429359+00	t	f	1	34	1	44939d9c142d41808d260fd83c77f0a1	\N	{}
14	main	wagtail.edit	2026-02-24 16:52:28.841376+00	t	f	1	34	1	615a102dbd734c1d9a9642cb074466cd	\N	{}
15	OIC [default]	wagtail.edit	2026-02-25 10:32:06.124729+00	t	f	2	5	1	b212996653794999adf063a8aef7f54b	\N	{}
16	Footer (paramètres du site) for OIC [default]	wagtail.edit	2026-02-25 11:29:40.271198+00	t	f	1	52	1	74442d3acadc49a2b2beda74182d3844	\N	{}
17	Président — Ing. ANDALETIA Victor	wagtail.create	2026-02-25 11:44:25.709651+00	t	f	1	53	1	e526ed4a0dad4369bc7e8ac83c6696af	\N	{}
18	Vice Président — Ing. MBERI Daniel	wagtail.create	2026-02-25 11:45:23.721239+00	t	f	2	53	1	290bedc508504f33be2a56b585e6a86e	\N	{}
19	Membres du bureau exécutif	wagtail.create	2026-02-25 11:46:08.693846+00	t	f	1	54	1	a1a4ef1169cc4b5081d14c76f1807a8f	\N	{}
20	Président	wagtail.edit	2026-02-25 11:47:55.556755+00	t	f	1	54	1	c320639ae59543bdb76fb3fee9a726f7	\N	{}
21	main	wagtail.edit	2026-02-25 11:50:13.879013+00	t	f	1	34	1	5c916509b33e46dfad20608d20612cf9	\N	{}
22	Secrétaire général — Ing. MANGOUELE BEOLEH	wagtail.create	2026-02-25 12:01:36.304209+00	t	f	3	53	1	ab12eb252e174aeea48b31ea104b3e04	\N	{}
23	Secrétaire général adjoint — Ing. ESSOBINGOUE NDZANGA	wagtail.create	2026-02-25 12:08:32.286557+00	t	f	4	53	1	b181edeb674a496cb57bde487f2841a8	\N	{}
24	Trésorière — Ing. NGAMBOMI Doria Vaneça	wagtail.create	2026-02-25 12:10:10.634554+00	t	f	5	53	1	3f0009765d794e05814b3cd768bfdde1	\N	{}
25	-	wagtail.edit	2026-02-25 12:25:46.247645+00	t	f	1	54	1	193f9b6bc3b3478fa4c3a9fd3eda5397	\N	{}
26	main	wagtail.edit	2026-02-25 12:34:38.331225+00	t	f	1	34	1	83ba70ee638c42a3b61d243d64eafd99	\N	{}
27	Membre du Conseil — Ing. NANA Adrien	wagtail.create	2026-02-25 12:41:20.939998+00	t	f	6	53	1	9aff3134c0b84d14afed3346f6b146ea	\N	{}
28	Membre du Conseil — Ing. OSSETE Jean Michel	wagtail.create	2026-02-25 12:42:11.251372+00	t	f	7	53	1	12de39d7ddcf4eb3868f365261f27768	\N	{}
29	Membre du Conseil — MATOKOT KIBOUKA Benjamin	wagtail.create	2026-02-25 12:43:32.858951+00	t	f	8	53	1	7e61078aec6e4d499c5110859afe9949	\N	{}
30	Membre du Conseil — Ing. KOUKOUDIA NAMOUNA Sylvain	wagtail.create	2026-02-25 12:44:42.822841+00	t	f	9	53	1	1cca4e2698524c78b132d6c39121b18b	\N	{}
31	Membre du Conseil — Ing. ANDZOUANGOLI Delphin	wagtail.create	2026-02-25 12:45:30.015255+00	t	f	10	53	1	802c2c1c2e674336905044b4e537531f	\N	{}
32	Membre du Conseil — Ing. ETOKABEKA Job Sylvanus	wagtail.create	2026-02-25 12:46:03.766398+00	t	f	11	53	1	73915a494feb4c0c874e86075f672e60	\N	{}
33	main	wagtail.edit	2026-02-25 12:49:34.86106+00	t	f	1	34	1	061633690c3a4b33953917803d9d8004	\N	{}
34	Membre du Conseil — Ing. MATOKOT KIBOUKA Benjamin	wagtail.edit	2026-02-25 12:53:40.397292+00	t	f	8	53	1	8d6d9e79f89c41649991c5e83f5bcd64	\N	{}
35	Rapports publications	wagtail.create	2026-02-25 13:16:50.164513+00	t	f	1	59	1	d842b134dba949d1aed382d3951a118f	\N	{}
36	Textes fondamentaux	wagtail.create	2026-02-25 13:17:10.439511+00	t	f	2	59	1	0f5168a3a3f34fe6bf119e9e3fc51552	\N	{}
37	main	wagtail.edit	2026-02-25 13:22:41.261343+00	t	f	1	34	1	b5e4b68dda234cf7921532f61132e1e3	\N	{}
38	Actualité	wagtail.create	2026-02-28 09:57:04.924326+00	t	f	1	68	1	8044159faec14a4ab6e51c4ad47ef07b	\N	{}
39	Regards ingénieur	wagtail.create	2026-02-28 10:02:21.656515+00	t	f	2	68	1	28d8e07b4b80424887fe504bf9393ff1	\N	{}
40	Footer (paramètres du site) pour OIC [défaut]	wagtail.edit	2026-03-04 12:47:16.032794+00	t	f	1	52	1	93646f18e58e40a586693bdbd060a2bf	\N	{}
41	Footer (paramètres du site) pour OIC [défaut]	wagtail.edit	2026-03-04 12:47:26.354593+00	t	f	1	52	1	9fd01a9c233c4ba6b1ce1a9c2a73b5cf	\N	{}
42	Actualités	wagtail.edit	2026-03-04 12:50:09.446107+00	t	f	1	68	1	b97c7ebf68c74fdf9d483fbfa9c760cc	\N	{}
43	Actualité	wagtail.edit	2026-03-04 12:50:35.570152+00	t	f	1	68	1	f3b2dc7bcb12405dbfa0629a7dcaa2a0	\N	{}
44	main	wagtail.edit	2026-03-04 13:06:10.821711+00	t	f	1	34	1	16d69ccfaf0b41cc835506017cc8e644	\N	{}
45	User menu fragment: default	wagtail.create	2026-03-05 14:26:02.19719+00	t	f	1	87	1	1693428d9b2342679dbec2c278cbf154	\N	{}
46	User menu fragment: default	wagtail.edit	2026-03-05 14:26:54.313753+00	t	f	1	87	1	e8406da1e7ce40078cf5e02c6ef168e4	\N	{}
47	User menu fragment: default	wagtail.edit	2026-03-05 14:31:33.059207+00	t	f	1	87	1	61507383477243a0ab0d31e291aeb4ee	\N	{}
48	User menu fragment: default	wagtail.edit	2026-03-05 14:51:51.593331+00	t	f	1	87	1	92bfbe965e6b4a0aa5103ff4efa4b336	\N	{}
\.


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title, locked_at, locked_by_id, locale_id, translation_key, alias_of_id, latest_revision_id) FROM stdin;
1	0001	1	2	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root	\N	\N	1	ce3313a296de4ecab51680988ee3fb60	\N	\N
2	00010001	2	0	Welcome to your new Wagtail site!	home	t	f	/home/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Welcome to your new Wagtail site!	\N	\N	1	ee07c090b4654488a6406a02b7375dff	\N	\N
6	000100040001	3	16	Actualité	blog	t	f	/accueil/blog/		f		\N	\N	f	50	\N	f	2026-03-03 10:44:49.348775+00	2026-02-24 15:25:52.124091+00	51	2026-03-03 10:44:49.37209+00	Actualité	\N	\N	1	8ec30db44a3c4891b3c7ee48d0fce065	\N	51
7	0001000400010001	4	0	Assemblée générale budgétaire de l'OIC	assemblee-generale-du-29-mars-2025	t	f	/accueil/blog/assemblee-generale-du-29-mars-2025/		f		\N	\N	f	51	\N	f	2026-03-03 13:37:01.238075+00	2026-02-24 15:25:52.180518+00	57	2026-03-03 13:37:01.259611+00	Assemblée générale budgétaire de l'OIC	\N	\N	1	7572fc94fac64e56b6f0459e8d78c3e3	\N	57
8	0001000400010002	4	0	L'OIC : Un engagement solennel au service du développement	ceremonie-du-prestation-de-serment-des-ingenieurs	t	f	/accueil/blog/ceremonie-du-prestation-de-serment-des-ingenieurs/		f		\N	\N	f	51	\N	f	2026-03-03 14:15:54.889703+00	2026-02-24 15:25:52.217045+00	62	2026-03-03 14:15:54.913356+00	L'OIC : Un engagement solennel au service du développement	\N	\N	1	1f0c8987b727493c9700f1a1e3fb1af6	\N	62
9	0001000400010003	4	0	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)	premiere-assemblee-generale-elective-de-lordre-des-ingenieurs-du-congo-oic	t	f	/accueil/blog/premiere-assemblee-generale-elective-de-lordre-des-ingenieurs-du-congo-oic/		f		\N	\N	f	51	\N	f	2026-02-24 15:25:52.243339+00	2026-02-24 15:25:52.252438+00	7	2026-02-24 15:25:52.252438+00	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)	\N	\N	1	7c81ce89f0d1482ea7842684943750f4	\N	7
10	0001000400010004	4	0	Réunion du Conseil National de l'OIC du 22 mars 2025	437-2	t	f	/accueil/blog/437-2/		f		\N	\N	f	51	\N	f	2026-03-03 14:15:04.442484+00	2026-02-24 15:25:52.292209+00	61	2026-03-03 14:15:04.46428+00	Réunion du Conseil National de l'OIC du 22 mars 2025	\N	\N	1	1928c85de9af420e9a5efa5ebbff5827	\N	61
11	0001000400010005	4	0	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)	assemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-oic	t	f	/accueil/blog/assemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-oic/		f		\N	\N	f	51	\N	f	2026-03-03 14:17:00.875279+00	2026-02-24 15:25:52.331598+00	63	2026-03-03 14:17:00.8987+00	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)	\N	\N	1	31a49c02909642d4900f1e01a0cf7151	\N	63
12	0001000400010006	4	0	Discours d’investiture du Président de l’OIC	discours-dinvestiture-du-president-de-loic	t	f	/accueil/blog/discours-dinvestiture-du-president-de-loic/		f		\N	\N	f	51	\N	f	2026-02-24 15:25:52.367979+00	2026-02-24 15:25:52.379941+00	10	2026-02-24 15:25:52.379941+00	Discours d’investiture du Président de l’OIC	\N	\N	1	19e293e2d7224b3086ef1e85b30c27c7	\N	10
13	0001000400010007	4	0	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »	discours-a-loccasion-du-premier-anniversaire-de-lordre-des-ingenieurs-du-congo-oic	t	f	/accueil/blog/discours-a-loccasion-du-premier-anniversaire-de-lordre-des-ingenieurs-du-congo-oic/		f		\N	\N	f	51	\N	f	2026-02-24 15:25:52.425122+00	2026-02-24 15:25:52.442042+00	11	2026-02-24 15:25:52.442042+00	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »	\N	\N	1	9dc860e34938403e9ecb2a696027e296	\N	11
14	0001000400010008	4	0	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025	mot-du-president-de-loic-a-la-ceremonie-de-prestation-de-serment-des-ingenieurs-inscrits-au-tableau-2025	t	f	/accueil/blog/mot-du-president-de-loic-a-la-ceremonie-de-prestation-de-serment-des-ingenieurs-inscrits-au-tableau-2025/		f		\N	\N	f	51	\N	f	2026-03-03 14:17:28.589894+00	2026-02-24 15:25:52.509667+00	64	2026-03-03 14:17:28.611463+00	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025	\N	\N	1	39d4973565b543e9ad414b3bfc2cb837	\N	64
15	0001000400010009	4	0	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »	mot-douverture-de-lassemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-en-sigle-oic	t	f	/accueil/blog/mot-douverture-de-lassemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-en-sigle-oic/		f		\N	\N	f	51	\N	f	2026-02-24 15:25:52.53828+00	2026-02-24 15:25:52.547464+00	13	2026-02-24 15:25:52.547464+00	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »	\N	\N	1	e7964d8b948a496ab550f1a4da486e4b	\N	13
16	000100040001000A	4	0	Fédération des Organisations Africaines d'Ingénierie	federation-des-organisations-africaines-dingenierie	t	f	/accueil/blog/federation-des-organisations-africaines-dingenierie/		f		\N	\N	f	51	\N	f	2026-02-28 09:18:49.164853+00	2026-02-24 15:25:52.582796+00	40	2026-02-28 09:18:49.186475+00	Fédération des Organisations Africaines d'Ingénierie	\N	\N	1	c3bc92e9d1b8410083c9e853881a8248	\N	40
17	000100040001000B	4	0	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo	t	f	/accueil/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/		f		\N	\N	f	51	\N	f	2026-03-03 13:35:45.825418+00	2026-02-24 15:25:52.620016+00	55	2026-03-03 13:35:45.847019+00	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	\N	\N	1	f316ed4994ec4cba9501e75734cb4916	\N	55
18	000100040001000C	4	0	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	ingenieur-bikouta	t	f	/accueil/blog/ingenieur-bikouta/		f		\N	\N	f	51	\N	f	2026-03-03 13:59:15.469145+00	2026-02-24 15:25:52.655432+00	60	2026-03-03 13:59:15.490184+00	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	\N	\N	1	e693b89e80d346e2b7356ae86983019a	\N	60
19	000100040001000D	4	0	Regards d'ingénieurs	regards-dingenieurs	t	f	/accueil/blog/regards-dingenieurs/		f		\N	\N	f	51	\N	f	2026-02-28 10:19:10.336451+00	2026-02-24 15:25:52.693138+00	49	2026-02-28 10:19:10.3588+00	Regards d'ingénieurs	\N	\N	1	090435a9f0a846b5a4bbf5d9b4e59b65	\N	49
20	000100040001000E	4	0	Campagne nationale de recensement et d’adhésion à l’OIC	campagne-nationale-de-recensement-et-dadhesion-a-loic	t	f	/accueil/blog/campagne-nationale-de-recensement-et-dadhesion-a-loic/		f		\N	\N	f	51	\N	f	2026-02-28 09:59:54.854546+00	2026-02-24 15:25:52.730274+00	45	2026-02-28 09:59:54.879233+00	Campagne nationale de recensement et d’adhésion à l’OIC	\N	\N	1	b0076f5d746447f28ddd8ee96fc218da	\N	45
21	000100040001000F	4	0	Deuxième anniversaire de l’OIC	deuxieme-anniversaire-de-loic	t	f	/accueil/blog/deuxieme-anniversaire-de-loic/		f		\N	\N	f	51	\N	f	2026-03-03 11:11:59.630547+00	2026-02-24 15:25:52.76761+00	53	2026-03-03 11:11:59.649779+00	Deuxième anniversaire de l’OIC	\N	\N	1	c2235f9cc8024377a68ac95effbe7c8b	\N	53
22	000100040001000G	4	0	Activités du mois de janvier 2026	rappel-des-activites-de-ce-mois-de-janvier-2026	t	f	/accueil/blog/rappel-des-activites-de-ce-mois-de-janvier-2026/		f		\N	\N	f	51	\N	f	2026-02-28 09:07:14.340038+00	2026-02-24 15:25:52.80366+00	37	2026-02-28 09:07:14.360676+00	Activités du mois de janvier 2026	\N	\N	1	2848f8b35c7b485388b14f35766ebc79	\N	37
23	00010004	2	6	Accueil	accueil	t	f	/accueil/		f		\N	\N	f	49	1	f	2026-03-04 21:35:37.026292+00	2026-02-24 15:34:23.09996+00	73	2026-03-04 21:35:37.0512+00	Accueil	\N	\N	1	ecca36b0550d45a98464253cc3363a1d	\N	73
24	000100040002	3	0	Membres du bureau exécutif	membres-du-bureau-exécutif	t	f	/accueil/membres-du-bureau-exécutif/		f		\N	\N	f	57	1	f	2026-02-25 12:10:51.555411+00	2026-02-25 11:49:04.793043+00	25	2026-02-25 12:10:51.580119+00	Membres du bureau exécutif	\N	\N	1	abb155625e6c46a28e1f606951cb74ac	\N	25
25	000100040003	3	0	Assemblée générale	assemblée-générale	t	f	/accueil/assemblée-générale/		f		\N	\N	f	58	1	f	2026-03-03 11:10:48.743935+00	2026-02-25 12:33:42.922879+00	52	2026-03-03 11:10:48.76453+00	Assemblée générale	\N	\N	1	b2e1ff78f7b2475ea15417eff9b5d3ea	\N	52
26	000100040004	3	0	Conseil national	conseil-national	t	f	/accueil/conseil-national/		f		\N	\N	f	57	1	f	2026-03-05 13:15:39.90869+00	2026-02-25 12:40:26.483803+00	74	2026-03-05 13:15:39.93693+00	Conseil national	\N	\N	1	15e027174eef4067adaf124ca8c48410	\N	74
27	000100040005	3	0	Textes fondamentaux	textes-fondamentaux	t	f	/accueil/textes-fondamentaux/		f		\N	\N	f	61	1	f	2026-02-25 13:34:29.68016+00	2026-02-25 13:21:16.952885+00	35	2026-02-25 13:34:29.704749+00	Textes fondamentaux	\N	\N	1	d805eb5b65f6412fac22beb3de924c20	\N	35
28	000100040006	3	0	A propos de	a-propos-de	t	f	/accueil/a-propos-de/		f		\N	\N	f	58	1	f	2026-03-04 13:05:22.197854+00	2026-03-04 13:05:22.213595+00	65	2026-03-04 13:05:22.213595+00	A propos de	\N	\N	1	b3f1477983c74a9a97996ca59483c59e	\N	65
\.


--
-- Data for Name: wagtailcore_pagelogentry; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_pagelogentry (id, label, action, "timestamp", content_changed, deleted, content_type_id, page_id, revision_id, user_id, uuid, data) FROM stdin;
1	Accueil	wagtail.create	2026-02-24 15:19:43.314323+00	t	f	49	3	\N	1	dc783473e6fa4577b27f27850f07a4bd	{}
2	Accueil	wagtail.edit	2026-02-24 15:19:43.34103+00	t	f	49	3	1	1	dc783473e6fa4577b27f27850f07a4bd	{}
3	Accueil	wagtail.publish	2026-02-24 15:19:43.361042+00	t	f	49	3	1	1	dc783473e6fa4577b27f27850f07a4bd	{}
4	Blog	wagtail.create	2026-02-24 15:20:25.13657+00	t	f	50	4	\N	1	c40588aa9c484a5fa231b86efa4dcaae	{}
5	Blog	wagtail.edit	2026-02-24 15:20:25.166299+00	t	f	50	4	2	1	c40588aa9c484a5fa231b86efa4dcaae	{}
6	Blog	wagtail.publish	2026-02-24 15:20:25.186551+00	t	f	50	4	2	1	c40588aa9c484a5fa231b86efa4dcaae	{}
7	Blog	wagtail.delete	2026-02-24 15:20:48.324015+00	f	t	50	4	\N	1	1d3f8492d7af49deba1ab52a71c725ae	{}
8	Blog	wagtail.create	2026-02-24 15:21:29.772042+00	t	f	50	5	\N	1	4c0e70c0fac1451381e9a655373c5048	{}
9	Blog	wagtail.edit	2026-02-24 15:21:29.800185+00	t	f	50	5	3	1	4c0e70c0fac1451381e9a655373c5048	{}
10	Blog	wagtail.publish	2026-02-24 15:21:29.821312+00	t	f	50	5	3	1	4c0e70c0fac1451381e9a655373c5048	{}
11	Blog	wagtail.create	2026-02-24 15:25:52.099691+00	t	f	50	6	\N	\N	\N	{}
12	Blog	wagtail.publish	2026-02-24 15:25:52.134622+00	t	f	50	6	4	\N	\N	{}
13	Assemblée générale budgétaire de l'OIC	wagtail.create	2026-02-24 15:25:52.161845+00	t	f	51	7	\N	\N	\N	{}
14	Assemblée générale budgétaire de l'OIC	wagtail.publish	2026-02-24 15:25:52.190992+00	t	f	51	7	5	\N	\N	{}
15	L'OIC : Un engagement solennel au service du développement	wagtail.create	2026-02-24 15:25:52.198536+00	t	f	51	8	\N	\N	\N	{}
16	L'OIC : Un engagement solennel au service du développement	wagtail.publish	2026-02-24 15:25:52.2264+00	t	f	51	8	6	\N	\N	{}
17	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)	wagtail.create	2026-02-24 15:25:52.234293+00	t	f	51	9	\N	\N	\N	{}
18	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)	wagtail.publish	2026-02-24 15:25:52.264059+00	t	f	51	9	7	\N	\N	{}
19	Réunion du Conseil National de l'OIC du 22 mars 2025	wagtail.create	2026-02-24 15:25:52.27203+00	t	f	51	10	\N	\N	\N	{}
20	Réunion du Conseil National de l'OIC du 22 mars 2025	wagtail.publish	2026-02-24 15:25:52.302622+00	t	f	51	10	8	\N	\N	{}
21	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)	wagtail.create	2026-02-24 15:25:52.310103+00	t	f	51	11	\N	\N	\N	{}
22	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)	wagtail.publish	2026-02-24 15:25:52.344165+00	t	f	51	11	9	\N	\N	{}
23	Discours d’investiture du Président de l’OIC	wagtail.create	2026-02-24 15:25:52.354962+00	t	f	51	12	\N	\N	\N	{}
24	Discours d’investiture du Président de l’OIC	wagtail.publish	2026-02-24 15:25:52.393245+00	t	f	51	12	10	\N	\N	{}
25	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »	wagtail.create	2026-02-24 15:25:52.401246+00	t	f	51	13	\N	\N	\N	{}
26	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »	wagtail.publish	2026-02-24 15:25:52.476102+00	t	f	51	13	11	\N	\N	{}
27	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025	wagtail.create	2026-02-24 15:25:52.48726+00	t	f	51	14	\N	\N	\N	{}
28	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025	wagtail.publish	2026-02-24 15:25:52.520736+00	t	f	51	14	12	\N	\N	{}
29	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »	wagtail.create	2026-02-24 15:25:52.528906+00	t	f	51	15	\N	\N	\N	{}
30	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »	wagtail.publish	2026-02-24 15:25:52.557767+00	t	f	51	15	13	\N	\N	{}
31	Fédération des Organisations Africaines d'Ingénierie	wagtail.create	2026-02-24 15:25:52.565136+00	t	f	51	16	\N	\N	\N	{}
32	Fédération des Organisations Africaines d'Ingénierie	wagtail.publish	2026-02-24 15:25:52.593224+00	t	f	51	16	14	\N	\N	{}
33	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.create	2026-02-24 15:25:52.600665+00	t	f	51	17	\N	\N	\N	{}
34	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.publish	2026-02-24 15:25:52.630327+00	t	f	51	17	15	\N	\N	{}
35	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.create	2026-02-24 15:25:52.637873+00	t	f	51	18	\N	\N	\N	{}
36	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.publish	2026-02-24 15:25:52.665449+00	t	f	51	18	16	\N	\N	{}
37	Regards d'ingénieurs	wagtail.create	2026-02-24 15:25:52.67344+00	t	f	51	19	\N	\N	\N	{}
38	Regards d'ingénieurs	wagtail.publish	2026-02-24 15:25:52.703444+00	t	f	51	19	17	\N	\N	{}
39	Campagne nationale de recensement et d’adhésion à l’OIC	wagtail.create	2026-02-24 15:25:52.71148+00	t	f	51	20	\N	\N	\N	{}
40	Campagne nationale de recensement et d’adhésion à l’OIC	wagtail.publish	2026-02-24 15:25:52.74053+00	t	f	51	20	18	\N	\N	{}
41	Deuxième anniversaire de l’OIC	wagtail.create	2026-02-24 15:25:52.747763+00	t	f	51	21	\N	\N	\N	{}
42	Deuxième anniversaire de l’OIC	wagtail.publish	2026-02-24 15:25:52.777956+00	t	f	51	21	19	\N	\N	{}
43	Activités du mois de janvier 2026	wagtail.create	2026-02-24 15:25:52.78477+00	t	f	51	22	\N	\N	\N	{}
44	Activités du mois de janvier 2026	wagtail.publish	2026-02-24 15:25:52.81338+00	t	f	51	22	20	\N	\N	{}
45	Blog	wagtail.delete	2026-02-24 15:31:41.327812+00	f	t	50	5	\N	1	5de52a7d6b9b4686b60a30e3f97c3e33	{}
46	Accueil	wagtail.delete	2026-02-24 15:31:41.332912+00	f	t	49	3	\N	1	5de52a7d6b9b4686b60a30e3f97c3e33	{}
47	Accueil	wagtail.create	2026-02-24 15:34:23.06201+00	t	f	49	23	\N	1	a4d2991915e94eaa9f45f5b112cf2cda	{}
48	Accueil	wagtail.edit	2026-02-24 15:34:23.091562+00	t	f	49	23	21	1	a4d2991915e94eaa9f45f5b112cf2cda	{}
49	Accueil	wagtail.publish	2026-02-24 15:34:23.112267+00	t	f	49	23	21	1	a4d2991915e94eaa9f45f5b112cf2cda	{}
50	Blog	wagtail.move	2026-02-24 16:25:50.664836+00	f	f	1	6	\N	1	4da0681419cc49088d131ef82c92970f	{"source": {"id": 1, "title": "Root"}, "destination": {"id": 23, "title": "Accueil"}}
51	Accueil	wagtail.edit	2026-02-25 10:31:08.282301+00	t	f	49	23	22	1	9bbdfd9e4a584d6da8463df6df056f05	{}
52	Accueil	wagtail.publish	2026-02-25 10:31:08.306104+00	f	f	49	23	22	1	9bbdfd9e4a584d6da8463df6df056f05	{}
53	Membres du bureau exécutif	wagtail.create	2026-02-25 11:49:04.745403+00	t	f	57	24	\N	1	46035ec5df434c0d864b532cc754c15f	{}
54	Membres du bureau exécutif	wagtail.edit	2026-02-25 11:49:04.784249+00	t	f	57	24	23	1	46035ec5df434c0d864b532cc754c15f	{}
55	Membres du bureau exécutif	wagtail.publish	2026-02-25 11:49:04.809485+00	t	f	57	24	23	1	46035ec5df434c0d864b532cc754c15f	{}
56	Membres du bureau exécutif	wagtail.edit	2026-02-25 12:03:07.087565+00	t	f	57	24	24	1	a3853696f17a40179d173f706daea0a0	{}
57	Membres du bureau exécutif	wagtail.publish	2026-02-25 12:03:07.131536+00	t	f	57	24	24	1	a3853696f17a40179d173f706daea0a0	{}
58	Membres du bureau exécutif	wagtail.edit	2026-02-25 12:10:51.568581+00	t	f	57	24	25	1	7c4d789b97d14527b3cf42abe0ca0c5f	{}
59	Membres du bureau exécutif	wagtail.publish	2026-02-25 12:10:51.612473+00	t	f	57	24	25	1	7c4d789b97d14527b3cf42abe0ca0c5f	{}
60	Assemblée générale	wagtail.create	2026-02-25 12:33:42.884695+00	t	f	58	25	\N	1	fe4fa9c661a94e04929f05815bfa37e8	{}
61	Assemblée générale	wagtail.edit	2026-02-25 12:33:42.91516+00	t	f	58	25	26	1	fe4fa9c661a94e04929f05815bfa37e8	{}
62	Assemblée générale	wagtail.publish	2026-02-25 12:33:42.935571+00	t	f	58	25	26	1	fe4fa9c661a94e04929f05815bfa37e8	{}
63	Conseil national	wagtail.create	2026-02-25 12:40:26.437239+00	t	f	57	26	\N	1	031a6680e0504bb693e5c3818531d5cd	{}
64	Conseil national	wagtail.edit	2026-02-25 12:40:26.4751+00	t	f	57	26	27	1	031a6680e0504bb693e5c3818531d5cd	{}
65	Conseil national	wagtail.publish	2026-02-25 12:40:26.50383+00	t	f	57	26	27	1	031a6680e0504bb693e5c3818531d5cd	{}
66	Conseil national	wagtail.edit	2026-02-25 12:48:49.926833+00	t	f	57	26	28	1	3bbcc08af70340b4bd8923ef5ed231b4	{}
67	Conseil national	wagtail.publish	2026-02-25 12:48:49.984109+00	t	f	57	26	28	1	3bbcc08af70340b4bd8923ef5ed231b4	{}
68	Conseil national	wagtail.edit	2026-02-25 12:53:01.297568+00	t	f	57	26	29	1	50456ac4287648a5b3a112b26e5e8ae4	{}
69	Conseil national	wagtail.publish	2026-02-25 12:53:01.348556+00	t	f	57	26	29	1	50456ac4287648a5b3a112b26e5e8ae4	{}
70	Textes fondamentaux	wagtail.create	2026-02-25 13:21:16.914081+00	t	f	61	27	\N	1	2b1c2241c3a0414fbc76a9d9bff327d8	{}
71	Textes fondamentaux	wagtail.edit	2026-02-25 13:21:16.945275+00	t	f	61	27	30	1	2b1c2241c3a0414fbc76a9d9bff327d8	{}
72	Textes fondamentaux	wagtail.publish	2026-02-25 13:21:16.967832+00	t	f	61	27	30	1	2b1c2241c3a0414fbc76a9d9bff327d8	{}
73	Textes fondamentaux	wagtail.edit	2026-02-25 13:28:42.01822+00	t	f	61	27	31	1	cbd62711b87c4757bd3d04673851dd6b	{}
74	Textes fondamentaux	wagtail.publish	2026-02-25 13:28:42.042611+00	t	f	61	27	31	1	cbd62711b87c4757bd3d04673851dd6b	{}
75	Textes fondamentaux	wagtail.edit	2026-02-25 13:28:54.545063+00	t	f	61	27	32	1	45fc4eef278f4e89aa9abd1a517c407d	{}
76	Textes fondamentaux	wagtail.publish	2026-02-25 13:28:54.57411+00	t	f	61	27	32	1	45fc4eef278f4e89aa9abd1a517c407d	{}
77	Textes fondamentaux	wagtail.edit	2026-02-25 13:30:47.992131+00	t	f	61	27	33	1	9a9961d5a1a44f8aa784346c1ed545ff	{}
78	Textes fondamentaux	wagtail.publish	2026-02-25 13:30:48.021686+00	t	f	61	27	33	1	9a9961d5a1a44f8aa784346c1ed545ff	{}
79	Textes fondamentaux	wagtail.edit	2026-02-25 13:33:18.220926+00	t	f	61	27	34	1	2364f45bc2954aa89cb82029adc270de	{}
80	Textes fondamentaux	wagtail.publish	2026-02-25 13:33:18.25258+00	t	f	61	27	34	1	2364f45bc2954aa89cb82029adc270de	{}
81	Textes fondamentaux	wagtail.edit	2026-02-25 13:34:29.693403+00	t	f	61	27	35	1	73834386a7b343e581a5783f0c6387f2	{}
82	Textes fondamentaux	wagtail.publish	2026-02-25 13:34:29.728382+00	t	f	61	27	35	1	73834386a7b343e581a5783f0c6387f2	{}
83	Activités du mois de janvier 2026	wagtail.edit	2026-02-28 09:06:26.635521+00	t	f	51	22	36	1	fd722f95a4f14bdc8260d4489c168698	{}
84	Activités du mois de janvier 2026	wagtail.publish	2026-02-28 09:06:26.654186+00	t	f	51	22	36	1	fd722f95a4f14bdc8260d4489c168698	{}
85	Activités du mois de janvier 2026	wagtail.edit	2026-02-28 09:07:14.353235+00	t	f	51	22	37	1	d592144b94574bd28f2dd17b2194119d	{}
86	Activités du mois de janvier 2026	wagtail.publish	2026-02-28 09:07:14.374166+00	t	f	51	22	37	1	d592144b94574bd28f2dd17b2194119d	{}
87	Deuxième anniversaire de l’OIC	wagtail.publish	2026-02-28 09:13:28.394067+00	t	f	51	21	38	\N	\N	{}
88	Deuxième anniversaire de l’OIC	wagtail.publish	2026-02-28 09:16:29.299282+00	t	f	51	21	39	\N	\N	{}
89	Fédération des Organisations Africaines d'Ingénierie	wagtail.edit	2026-02-28 09:18:49.179+00	t	f	51	16	40	1	a20588ea83af4f589fd77bb1b283b076	{}
90	Fédération des Organisations Africaines d'Ingénierie	wagtail.publish	2026-02-28 09:18:49.200258+00	t	f	51	16	40	1	a20588ea83af4f589fd77bb1b283b076	{}
91	L'OIC : Un engagement solennel au service du développement	wagtail.edit	2026-02-28 09:42:47.464394+00	t	f	51	8	41	1	273f9330b7964b39b9df32f83a3d7df8	{}
92	L'OIC : Un engagement solennel au service du développement	wagtail.publish	2026-02-28 09:42:47.483139+00	t	f	51	8	41	1	273f9330b7964b39b9df32f83a3d7df8	{}
93	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.edit	2026-02-28 09:44:13.492012+00	t	f	51	17	42	1	3401291d603448148ad0caff52d844f2	{}
94	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.publish	2026-02-28 09:44:13.511094+00	t	f	51	17	42	1	3401291d603448148ad0caff52d844f2	{}
95	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.edit	2026-02-28 09:57:30.475516+00	t	f	51	17	43	1	9472a98630334761925e85e85443ebdc	{}
96	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.publish	2026-02-28 09:57:30.499345+00	t	f	51	17	43	1	9472a98630334761925e85e85443ebdc	{}
97	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.edit	2026-02-28 09:58:34.396316+00	t	f	51	17	44	1	341d30200b1f438d8daecbb808ae4e26	{}
98	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.publish	2026-02-28 09:58:34.420068+00	t	f	51	17	44	1	341d30200b1f438d8daecbb808ae4e26	{}
99	Campagne nationale de recensement et d’adhésion à l’OIC	wagtail.edit	2026-02-28 09:59:54.871141+00	t	f	51	20	45	1	f83c4b00621247cd82adf5cd83b5600b	{}
100	Campagne nationale de recensement et d’adhésion à l’OIC	wagtail.publish	2026-02-28 09:59:54.895657+00	t	f	51	20	45	1	f83c4b00621247cd82adf5cd83b5600b	{}
101	Regards d'ingénieurs	wagtail.edit	2026-02-28 10:12:19.06426+00	t	f	51	19	46	1	616533cce3f64482a7c25561a54714f4	{}
102	Regards d'ingénieurs	wagtail.publish	2026-02-28 10:12:19.08658+00	t	f	51	19	46	1	616533cce3f64482a7c25561a54714f4	{}
103	Deuxième anniversaire de l’OIC	wagtail.edit	2026-02-28 10:18:03.700061+00	t	f	51	21	47	1	496f4a2dc97843379d3caff672c1ea5a	{}
104	Deuxième anniversaire de l’OIC	wagtail.publish	2026-02-28 10:18:03.72287+00	t	f	51	21	47	1	496f4a2dc97843379d3caff672c1ea5a	{}
105	Deuxième anniversaire de l’OIC	wagtail.edit	2026-02-28 10:18:54.654425+00	t	f	51	21	48	1	aef9849786b646da8bd718ef53b07625	{}
106	Deuxième anniversaire de l’OIC	wagtail.publish	2026-02-28 10:18:54.679403+00	t	f	51	21	48	1	aef9849786b646da8bd718ef53b07625	{}
107	Regards d'ingénieurs	wagtail.edit	2026-02-28 10:19:10.351061+00	t	f	51	19	49	1	930395f266e84064ad4d1b2d0a120e70	{}
108	Regards d'ingénieurs	wagtail.publish	2026-02-28 10:19:10.375302+00	t	f	51	19	49	1	930395f266e84064ad4d1b2d0a120e70	{}
109	Blog	wagtail.edit	2026-02-28 10:21:18.676849+00	t	f	50	6	50	1	e9f1412c84154b17a10614a2a2a6045b	{}
110	Actualité	wagtail.rename	2026-02-28 10:21:18.698242+00	f	f	50	6	50	1	e9f1412c84154b17a10614a2a2a6045b	{"title": {"old": "Blog", "new": "Actualit\\u00e9"}}
111	Actualité	wagtail.publish	2026-02-28 10:21:18.701102+00	t	f	50	6	50	1	e9f1412c84154b17a10614a2a2a6045b	{"title": {"old": "Blog", "new": "Actualit\\u00e9"}}
112	Actualité	wagtail.edit	2026-03-03 10:44:49.36549+00	t	f	50	6	51	1	d879bebf79414f0a9cdcd064b901b9f0	{}
113	Actualité	wagtail.publish	2026-03-03 10:44:49.386014+00	t	f	50	6	51	1	d879bebf79414f0a9cdcd064b901b9f0	{}
114	Assemblée générale	wagtail.edit	2026-03-03 11:10:48.757274+00	t	f	58	25	52	1	bb42eaef838747439b75c46311ba4901	{}
115	Assemblée générale	wagtail.publish	2026-03-03 11:10:48.77935+00	t	f	58	25	52	1	bb42eaef838747439b75c46311ba4901	{}
116	Deuxième anniversaire de l’OIC	wagtail.edit	2026-03-03 11:11:59.642361+00	t	f	51	21	53	1	83e069a54eff4817b688d00735fc9fde	{}
117	Deuxième anniversaire de l’OIC	wagtail.publish	2026-03-03 11:11:59.665048+00	t	f	51	21	53	1	83e069a54eff4817b688d00735fc9fde	{}
118	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.edit	2026-03-03 13:35:10.6039+00	t	f	51	17	54	1	b65a2834bc9240fd9e990098e5d763fc	{}
119	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.publish	2026-03-03 13:35:10.623653+00	t	f	51	17	54	1	b65a2834bc9240fd9e990098e5d763fc	{}
120	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.edit	2026-03-03 13:35:45.83911+00	t	f	51	17	55	1	d3151ca0bb104c1d92205664badee547	{}
121	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO	wagtail.publish	2026-03-03 13:35:45.8605+00	f	f	51	17	55	1	d3151ca0bb104c1d92205664badee547	{}
122	Assemblée générale budgétaire de l'OIC	wagtail.edit	2026-03-03 13:36:52.644441+00	t	f	51	7	56	1	d537425eff8044b6a503a664f5d9c518	{}
123	Assemblée générale budgétaire de l'OIC	wagtail.publish	2026-03-03 13:36:52.668792+00	t	f	51	7	56	1	d537425eff8044b6a503a664f5d9c518	{}
124	Assemblée générale budgétaire de l'OIC	wagtail.edit	2026-03-03 13:37:01.251653+00	t	f	51	7	57	1	340d75d9fa6b430eab35a196b84c5eb1	{}
125	Assemblée générale budgétaire de l'OIC	wagtail.publish	2026-03-03 13:37:01.274663+00	t	f	51	7	57	1	340d75d9fa6b430eab35a196b84c5eb1	{}
126	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.edit	2026-03-03 13:57:50.413959+00	t	f	51	18	58	1	7d94528877d54f9d9d1055a64e09e726	{}
127	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.publish	2026-03-03 13:57:50.43618+00	t	f	51	18	58	1	7d94528877d54f9d9d1055a64e09e726	{}
128	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.edit	2026-03-03 13:58:52.346344+00	t	f	51	18	59	1	e8172f9170e740c9a0a59c076e410407	{}
129	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.publish	2026-03-03 13:58:52.367649+00	t	f	51	18	59	1	e8172f9170e740c9a0a59c076e410407	{}
130	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.edit	2026-03-03 13:59:15.482622+00	t	f	51	18	60	1	3de688a1a991400fb7727031623b096f	{}
131	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora	wagtail.publish	2026-03-03 13:59:15.505681+00	t	f	51	18	60	1	3de688a1a991400fb7727031623b096f	{}
132	Réunion du Conseil National de l'OIC du 22 mars 2025	wagtail.edit	2026-03-03 14:15:04.457444+00	t	f	51	10	61	1	e02f4a17d5024cc0b7c4c11f953650b4	{}
133	Réunion du Conseil National de l'OIC du 22 mars 2025	wagtail.publish	2026-03-03 14:15:04.477308+00	t	f	51	10	61	1	e02f4a17d5024cc0b7c4c11f953650b4	{}
134	L'OIC : Un engagement solennel au service du développement	wagtail.edit	2026-03-03 14:15:54.90335+00	t	f	51	8	62	1	0fefe3c8342343038133d4cfd0b4fe48	{}
135	L'OIC : Un engagement solennel au service du développement	wagtail.publish	2026-03-03 14:15:54.929061+00	t	f	51	8	62	1	0fefe3c8342343038133d4cfd0b4fe48	{}
136	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)	wagtail.edit	2026-03-03 14:17:00.889006+00	t	f	51	11	63	1	44ae28eb76674f05aa261b953daf09b9	{}
137	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)	wagtail.publish	2026-03-03 14:17:00.917217+00	t	f	51	11	63	1	44ae28eb76674f05aa261b953daf09b9	{}
138	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025	wagtail.edit	2026-03-03 14:17:28.604092+00	t	f	51	14	64	1	c0e2d47fd1c74d57b78cc217bf0e0bf1	{}
139	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025	wagtail.publish	2026-03-03 14:17:28.627199+00	t	f	51	14	64	1	c0e2d47fd1c74d57b78cc217bf0e0bf1	{}
140	A propos de	wagtail.create	2026-03-04 13:05:22.183182+00	t	f	58	28	\N	1	7d5ec1d94e5d41d9b4cb47ed2a5dc15f	{}
141	A propos de	wagtail.edit	2026-03-04 13:05:22.207135+00	t	f	58	28	65	1	7d5ec1d94e5d41d9b4cb47ed2a5dc15f	{}
142	A propos de	wagtail.publish	2026-03-04 13:05:22.224351+00	t	f	58	28	65	1	7d5ec1d94e5d41d9b4cb47ed2a5dc15f	{}
143	Accueil	wagtail.edit	2026-03-04 21:09:56.984253+00	t	f	49	23	66	1	431f55479cf545218ba7bafaa334d4fc	{}
144	Accueil	wagtail.edit	2026-03-04 21:11:55.909761+00	t	f	49	23	67	1	51143bd8609747d4a2364cba34c6cafa	{}
145	Accueil	wagtail.publish	2026-03-04 21:11:55.95353+00	t	f	49	23	67	1	51143bd8609747d4a2364cba34c6cafa	{}
146	Accueil	wagtail.edit	2026-03-04 21:22:07.318359+00	t	f	49	23	68	1	78e56af807294098bcf77e57802d48f3	{}
147	Accueil	wagtail.publish	2026-03-04 21:22:07.353016+00	t	f	49	23	68	1	78e56af807294098bcf77e57802d48f3	{}
148	Accueil	wagtail.edit	2026-03-04 21:24:34.78303+00	t	f	49	23	69	1	58e4d596f127453288a437f198b57ef1	{}
149	Accueil	wagtail.publish	2026-03-04 21:24:34.817026+00	t	f	49	23	69	1	58e4d596f127453288a437f198b57ef1	{}
150	Accueil	wagtail.edit	2026-03-04 21:25:43.700079+00	t	f	49	23	70	1	9285ad9e054c47a59737b11e5e83c00b	{}
151	Accueil	wagtail.publish	2026-03-04 21:25:43.732592+00	t	f	49	23	70	1	9285ad9e054c47a59737b11e5e83c00b	{}
152	Accueil	wagtail.edit	2026-03-04 21:30:52.266009+00	t	f	49	23	71	1	47c2a6b6dd244e3dbeb49c1e051329bf	{}
153	Accueil	wagtail.publish	2026-03-04 21:30:52.299965+00	t	f	49	23	71	1	47c2a6b6dd244e3dbeb49c1e051329bf	{}
154	Accueil	wagtail.edit	2026-03-04 21:34:52.695982+00	t	f	49	23	72	1	5809b6ffd2d2411fbfdeb8b0acb5a866	{}
155	Accueil	wagtail.publish	2026-03-04 21:34:52.799192+00	t	f	49	23	72	1	5809b6ffd2d2411fbfdeb8b0acb5a866	{}
156	Accueil	wagtail.edit	2026-03-04 21:35:37.040234+00	t	f	49	23	73	1	6c06d5f6c8c04a7ca5bdb3b4d43691dd	{}
157	Accueil	wagtail.publish	2026-03-04 21:35:37.075296+00	t	f	49	23	73	1	6c06d5f6c8c04a7ca5bdb3b4d43691dd	{}
158	Conseil national	wagtail.edit	2026-03-05 13:15:39.925135+00	t	f	57	26	74	1	b205547c7c8f4d8489904e9db9af7d75	{}
159	Conseil national	wagtail.publish	2026-03-05 13:15:39.975636+00	f	f	57	26	74	1	b205547c7c8f4d8489904e9db9af7d75	{}
\.


--
-- Data for Name: wagtailcore_pagesubscription; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_pagesubscription (id, comment_notifications, page_id, user_id) FROM stdin;
4	f	6	1
5	t	23	1
6	f	2	1
7	f	12	1
8	t	24	1
9	t	25	1
10	t	26	1
11	t	27	1
12	f	22	1
13	f	21	1
14	f	19	1
15	f	16	1
16	f	15	1
17	f	13	1
18	f	8	1
19	f	7	1
20	f	14	1
21	f	17	1
22	f	18	1
23	f	11	1
24	f	10	1
25	f	20	1
26	t	28	1
\.


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_referenceindex; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_referenceindex (id, object_id, to_object_id, model_path, content_path, content_path_hash, base_content_type_id, content_type_id, to_content_type_id) FROM stdin;
4	1	6	items.item.link_page	items.1.link_page	eeee81ec4a945d5e9e1dfc1e63d1ed83	34	34	1
6	1	6	items.item.link_page	items.2.link_page	9ff1c0afad945dabadcd11a49ed9bcee	34	34	1
7	1	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
8	1	1	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
9	2	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
10	2	2	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
11	24	1	sections.item.members.item.member	sections.1.members.1.member	8df81166172355db8f72cc1564db65da	1	57	53
12	24	1	sections.item.section	sections.1.section	8badc08e85c35c35a9034a901b957cff	1	57	54
13	1	24	items.item.children.item.link_page	items.3.children.1.link_page	292eecf90e815b4da4e5d6d36f5c1b98	34	34	1
14	3	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
15	3	3	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
16	24	2	sections.item.members.item.member	sections.2.members.2.member	d6b8338f755c58abad02accf2cb4f380	1	57	53
17	24	1	sections.item.section	sections.2.section	abe23856ecd45521b943566b2161c0fe	1	57	54
18	24	3	sections.item.members.item.member	sections.2.members.3.member	fd71c1e49af15139a79c53b106b9ba78	1	57	53
19	4	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
20	4	4	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
21	5	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
22	6	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
23	5	6	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
24	24	4	sections.item.members.item.member	sections.2.members.4.member	6c48544a4aa35596ae493233b3cf8163	1	57	53
25	24	5	sections.item.members.item.member	sections.2.members.5.member	73ef840644d859df952c2439f731815b	1	57	53
26	1	25	items.item.children.item.link_page	items.3.children.2.link_page	65974953cb185c20b2b316ac73e9e73b	34	34	1
30	7	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
31	6	7	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
32	8	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
33	7	8	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
34	9	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
35	8	9	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
36	10	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
37	9	10	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
38	11	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
39	10	11	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
40	12	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
41	11	12	photo	photo	1d1b3137d363525b8440c5cc5553f415	53	53	28
52	1	26	items.item.children.item.link_page	items.3.children.3.link_page	b908daa6541a550285f2f0c18763f556	34	34	1
53	1	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	27	27	10
54	27	1	items.item.document	items.1.document	e27dd532a10055bd9078b7d22580642d	1	61	27
55	27	2	items.item.category	items.1.category	3021d9d91b485e069a56854219471310	1	61	59
56	1	27	items.item.link_page	items.4.link_page	15a02d0904015a9f9b13273682acd2bf	34	34	1
57	2	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	27	27	10
58	27	2	items.item.document	items.2.document	d5e214c1a34a535db86e0ae590423e20	1	61	27
59	27	2	items.item.category	items.2.category	02202037a23e5f048743e7adee615021	1	61	59
60	3	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	27	27	10
61	27	2	items.item.category	items.3.category	4aa852cd5c28567f9d020be5119add1e	1	61	59
62	27	3	items.item.document	items.3.document	a17e98b67b495055888bc1e885cdd7cc	1	61	27
63	4	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	27	27	10
64	27	4	items.item.document	items.4.document	fd0c28a80a555c519d14edf1b5bc0248	1	61	27
65	5	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	27	27	10
66	27	5	items.item.document	items.5.document	1f7ae34a40f852bc86a44f46bd10ac40	1	61	27
67	25	12	hero_image	hero_image	2960929c7feb5d2b8541ed36105c53fd	1	58	28
68	21	12	image	image	3cb1a537a728548bb2078423b6010580	1	51	28
69	17	1	image	image	3cb1a537a728548bb2078423b6010580	1	51	28
70	7	1	image	image	3cb1a537a728548bb2078423b6010580	1	51	28
71	1	28	items.item.link_page	items.5.link_page	0dcba9389dba5dad9c427f2471dcf879	34	34	1
72	13	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
73	14	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
74	15	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	28	28	10
75	23	13	quick_links.item.image	quick_links.1.image	b7171a609a215cd9933b518525974b82	1	49	28
76	23	14	quick_links.item.image	quick_links.2.image	01119abeef6f5f1ca5a6d767da49dda8	1	49	28
77	23	15	quick_links.item.image	quick_links.4.image	f07dc383f9e059f2a3e37a982f26d9d0	1	49	28
78	23	8	hero_slides.item.image	hero_slides.3.image	7fba8ca8431f53329ba90ed1acb952f5	1	49	28
79	23	11	hero_slides.item.image	hero_slides.1.image	cb616249d0525116a5d87f7ba8fe0fc4	1	49	28
80	26	11	sections.item.members.item.member	sections.4.members.16.member	00127f7fd17c533abf52ef4568b004c2	1	57	76
81	26	3	sections.item.members.item.member	sections.4.members.8.member	78e83d5a384e5a2a8e7c8c9b80d900c5	1	57	76
82	26	6	sections.item.members.item.member	sections.4.members.11.member	4824733768bd5579bbcaef49edd178e4	1	57	76
83	26	8	sections.item.members.item.member	sections.4.members.13.member	2c1c82fb128359f4a117ac08c52cda35	1	57	76
84	26	1	sections.item.section	sections.4.section	ff71a9c515a459b2a2364b44fc465010	1	57	77
85	26	10	sections.item.members.item.member	sections.4.members.15.member	fea4a9a6b54f5d5289bfeba9ab0d8af7	1	57	76
86	26	7	sections.item.members.item.member	sections.4.members.12.member	66bd6b2e1fac517bbc33ca0365b99200	1	57	76
87	26	9	sections.item.members.item.member	sections.4.members.14.member	59c7104daae5576fbe6d40bc35944c0f	1	57	76
88	26	1	sections.item.section	sections.3.section	173124acea70576d86327f95b41eb70f	1	57	77
89	26	4	sections.item.members.item.member	sections.4.members.9.member	d6dfc67f3cd754508c5e42c703d9c86d	1	57	76
90	26	5	sections.item.members.item.member	sections.4.members.10.member	c21fe59e78f05caab565f1a2efdbff03	1	57	76
91	26	2	sections.item.members.item.member	sections.4.members.7.member	8efb0afda787595ba6252f0ea2ce899e	1	57	76
92	26	1	sections.item.members.item.member	sections.3.members.6.member	89ca429ccc6c5bf680bde2a770c322c5	1	57	76
\.


--
-- Data for Name: wagtailcore_revision; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_revision (id, created_at, approved_go_live_at, user_id, content, object_id, content_type_id, base_content_type_id, object_str) FROM stdin;
4	2026-02-24 15:25:52.114124+00	\N	\N	{"pk": 6, "path": "00010003", "depth": 2, "numchild": 0, "translation_key": "8ec30db4-4a3c-4891-b3c7-ee48d0fce065", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Blog", "draft_title": "Blog", "slug": "blog", "content_type": 50, "url_path": "/blog/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "intro": "", "wagtail_admin_comments": []}	6	50	1	Blog
5	2026-02-24 15:25:52.171526+00	\N	\N	{"pk": 7, "path": "000100030001", "depth": 3, "numchild": 0, "translation_key": "7572fc94-fac6-4e56-b6f0-459e8d78c3e3", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire de l'OIC", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire de l'OIC", "slug": "assemblee-generale-du-29-mars-2025", "content_type": 51, "url_path": "/blog/assemblee-generale-du-29-mars-2025/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-03-29", "body": "<!-- wp:paragraph -->\\n<p>Le 29 mars 2025, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son assembl\\u00e9e g\\u00e9n\\u00e9rale dite budg\\u00e9taire \\u00e0 l'H\\u00f4tel PEFACO. Cette rencontre strat\\u00e9gique a r\\u00e9uni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'ann\\u00e9e 2025.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:themeisle-blocks/slider {\\"id\\":\\"wp-block-themeisle-blocks-slider-620287ac\\"} -->\\n<div id=\\"wp-block-themeisle-blocks-slider-620287ac\\" class=\\"wp-block-themeisle-blocks-slider glide\\" data-per-view=\\"1\\" data-gap=\\"0\\" data-peek=\\"0\\" data-autoplay=\\"true\\" data-height=\\"400px\\" data-hide-arrows=\\"false\\"><div class=\\"glide__track\\" data-glide-el=\\"track\\"><div class=\\"glide__slides\\"><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/21429AFD-779B-4417-9A64-4F0CB8F25C6C.png\\" alt=\\"\\" title=\\"\\" data-id=\\"561\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/3719BD63-3897-4534-96C0-B3FBD098E50F.png\\" alt=\\"\\" title=\\"\\" data-id=\\"563\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/C5E7EE3C-6DF8-409D-B332-9171F6DF60A1.png\\" alt=\\"\\" title=\\"\\" data-id=\\"566\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/773E17B5-C571-4B7F-A361-00497D622B9A.png\\" alt=\\"\\" title=\\"\\" data-id=\\"562\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/483893B5-5617-4CAF-8ED2-B72FFBB99869.png\\" alt=\\"\\" title=\\"\\" data-id=\\"565\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/32DCDBDA-6BF8-4CEC-8370-460638FD1F8E.png\\" alt=\\"\\" title=\\"\\" data-id=\\"564\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/607F31F6-7C00-485B-88BC-4863D5E30CD1.jpeg\\" alt=\\"\\" title=\\"\\" data-id=\\"559\\"/><figcaption>Screenshot</figcaption></figure></div></div><div class=\\"glide__bullets\\" data-glide-el=\\"controls[nav]\\"><button class=\\"glide__bullet\\" data-glide-dir=\\"=0\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=1\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=2\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=3\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=4\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=5\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=6\\"></button></div></div></div>\\n<!-- /wp:themeisle-blocks/slider -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Sous la pr\\u00e9sidence du bureau ex\\u00e9cutif de l'OIC, l'assembl\\u00e9e g\\u00e9n\\u00e9rale a permis de passer en revue les priorit\\u00e9s de l'ann\\u00e9e \\u00e0 venir, en tenant compte des d\\u00e9fis et des perspectives du secteur de l'ing\\u00e9nierie au Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Au cours de cette assembl\\u00e9e, le programme 2025 a \\u00e9t\\u00e9 pr\\u00e9sent\\u00e9 et d\\u00e9battu par les membres pr\\u00e9sents. Apr\\u00e8s des \\u00e9changes constructifs et des propositions d'am\\u00e9lioration, le programme a \\u00e9t\\u00e9 adopt\\u00e9 \\u00e0 l'unanimit\\u00e9.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Le point central de l'assembl\\u00e9e \\u00e9tait l'examen du budget pr\\u00e9visionnel pour l'ann\\u00e9e 2025. Le budget, fix\\u00e9 \\u00e0 52 millions de francs CFA, a \\u00e9t\\u00e9 minutieusement discut\\u00e9 avant d'\\u00eatre soumis au vote. Les membres ont pris le temps d'\\u00e9valuer les diff\\u00e9rentes rubriques budg\\u00e9taires et ont approuv\\u00e9 ce budget, qui vise \\u00e0 renforcer les actions de l'OIC en faveur du d\\u00e9veloppement professionnel des ing\\u00e9nieurs.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>En plus de l'adoption du budget et du programme, l'assembl\\u00e9e g\\u00e9n\\u00e9rale a \\u00e9t\\u00e9 marqu\\u00e9e par des d\\u00e9lib\\u00e9rations sur divers sujets li\\u00e9s aux activit\\u00e9s futures de l'organisation et aux projets en cours.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Cette rencontre t\\u00e9moigne de l'engagement de l'OIC \\u00e0 assurer une gestion rigoureuse et transparente de ses ressources financi\\u00e8res, tout en poursuivant ses actions en faveur de l'am\\u00e9lioration continue des comp\\u00e9tences des ing\\u00e9nieurs congolais.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>L'Ordre des Ing\\u00e9nieurs du Congo remercie tous les participants pour leur implication et leur volont\\u00e9 de contribuer \\u00e0 la r\\u00e9alisation des objectifs de l'ann\\u00e9e 2025.</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	7	51	1	Assemblée générale budgétaire de l'OIC
6	2026-02-24 15:25:52.208272+00	\N	\N	{"pk": 8, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "1f0c8987-b727-493c-9700-f1a1e3fb1af6", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "L'OIC : Un engagement solennel au service du d\\u00e9veloppement", "draft_title": "L'OIC : Un engagement solennel au service du d\\u00e9veloppement", "slug": "ceremonie-du-prestation-de-serment-des-ingenieurs", "content_type": 51, "url_path": "/blog/ceremonie-du-prestation-de-serment-des-ingenieurs/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-02-08", "body": "<!-- wp:video {\\"id\\":301} -->\\n<figure class=\\"wp-block-video\\"><video controls src=\\"https://oic.cg/wp-content/uploads/2025/04/VIDEO-2025-02-08-17-29-02-Serment.mp4\\" playsinline></video></figure>\\n<!-- /wp:video -->\\n\\n<!-- wp:paragraph -->\\n<p></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Le 8 f\\u00e9vrier 2025, les tours jumelles de Mpila ont accueilli la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs, un \\u00e9v\\u00e9nement marquant plac\\u00e9 sous le haut patronage du Monsieur Jean Jacques BOUYA, Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement, de l'Equipement du Territoire et des Grands Travaux. Cette c\\u00e9r\\u00e9monie a \\u00e9galement enregistr\\u00e9 la pr\\u00e9sence remarqu\\u00e9e de l'Honorable Blaise AMBETO, d\\u00e9put\\u00e9 \\u00e0 l'Assembl\\u00e9e nationale.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Au cours de cette c\\u00e9r\\u00e9monie solennelle, 154 ing\\u00e9nieurs ont pr\\u00eat\\u00e9 serment, marquant ainsi leur engagement \\u00e0 servir la nation avec int\\u00e9grit\\u00e9, professionnalisme et d\\u00e9vouement. Cet acte symbolique rev\\u00eat une importance capitale, t\\u00e9moignant de la volont\\u00e9 des ing\\u00e9nieurs congolais de contribuer activement aux projets d'infrastructures et au d\\u00e9veloppement du pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Dans son allocution, le Ministre d'\\u00c9tat a salu\\u00e9 l'enthousiasme et l'engagement des nouveaux ing\\u00e9nieurs, rappelant que leur mission est essentielle pour soutenir les grands travaux entrepris par le pays. De son c\\u00f4t\\u00e9, l'Honorable Blaise AMBETO a encourag\\u00e9 les ing\\u00e9nieurs \\u00e0 faire preuve de responsabilit\\u00e9 et d'innovation dans la r\\u00e9alisation de leurs projets.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L'Ordre des Ing\\u00e9nieurs du Congo (OIC) se f\\u00e9licite de l'organisation r\\u00e9ussie de cette c\\u00e9r\\u00e9monie et tient \\u00e0 f\\u00e9liciter chaleureusement l'ensemble des ing\\u00e9nieurs qui ont pr\\u00eat\\u00e9 serment. Ce moment fort t\\u00e9moigne de la volont\\u00e9 de renforcer l'excellence et la responsabilit\\u00e9 au sein de la profession d'ing\\u00e9nieur au Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L'OIC reste engag\\u00e9 \\u00e0 accompagner ses membres dans l'accomplissement de leurs missions et \\u00e0 promouvoir les valeurs d'\\u00e9thique et de professionnalisme au sein de la communaut\\u00e9 des ing\\u00e9nieurs congolais.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Pour plus d'informations sur l'Ordre des Ing\\u00e9nieurs du Congo et ses activit\\u00e9s, n'h\\u00e9sitez pas \\u00e0 consulter notre site internet.</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	8	51	1	L'OIC : Un engagement solennel au service du développement
7	2026-02-24 15:25:52.243339+00	\N	\N	{"pk": 9, "path": "000100030003", "depth": 3, "numchild": 0, "translation_key": "7c81ce89-f0d1-482e-a784-2684943750f4", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale constitutive de l'Ordre des Ing\\u00e9nieurs du Congo (OIC)", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale constitutive de l'Ordre des Ing\\u00e9nieurs du Congo (OIC)", "slug": "premiere-assemblee-generale-elective-de-lordre-des-ingenieurs-du-congo-oic", "content_type": 51, "url_path": "/blog/premiere-assemblee-generale-elective-de-lordre-des-ingenieurs-du-congo-oic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2023-07-08", "body": "<!-- wp:gallery {\\"linkTo\\":\\"none\\"} -->\\n<figure class=\\"wp-block-gallery has-nested-images columns-default is-cropped\\"><!-- wp:image {\\"id\\":422,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.28-2-1024x576.jpeg\\" alt=\\"\\" class=\\"wp-image-422\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":427,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.28-1-1024x683.jpeg\\" alt=\\"\\" class=\\"wp-image-427\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":426,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.26-2-1024x683.jpeg\\" alt=\\"\\" class=\\"wp-image-426\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":421,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.26-1-1024x576.jpeg\\" alt=\\"\\" class=\\"wp-image-421\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":425,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.26-1024x683.jpeg\\" alt=\\"\\" class=\\"wp-image-425\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":424,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.28-1024x683.jpeg\\" alt=\\"\\" class=\\"wp-image-424\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":423,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.29-1-1024x683.jpeg\\" alt=\\"\\" class=\\"wp-image-423\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:image {\\"id\\":428,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-08-at-08.17.29-1024x683.jpeg\\" alt=\\"\\" class=\\"wp-image-428\\"/></figure>\\n<!-- /wp:image --></figure>\\n<!-- /wp:gallery -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Le samedi 8 juillet 2023, l\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son Assembl\\u00e9e G\\u00e9n\\u00e9rale Constitutive au Grand H\\u00f4tel de Kint\\u00e9l\\u00e9 sous le haut patronage du Ministre de la construction de l'urbanisme et de l'habitat , repr\\u00e9sent\\u00e9 par son Directeur de cabinet .<br>Cet \\u00e9v\\u00e9nement historique, v\\u00e9ritable jalon dans la structuration et la reconnaissance de la profession d\\u2019ing\\u00e9nieur en R\\u00e9publique du Congo, a marqu\\u00e9 un tournant d\\u00e9cisif pour le secteur. Il a r\\u00e9uni un large \\u00e9ventail d\\u2019acteurs nationaux de l\\u2019ing\\u00e9nierie \\u2013 toutes sp\\u00e9cialit\\u00e9s confondues \\u2013 ainsi que des chefs d'entreprises, des autorit\\u00e9s administratives et institutionnelles venues saluer cette avanc\\u00e9e majeure.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"></h4>\\n<!-- /wp:heading -->", "wagtail_admin_comments": []}	9	51	1	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)
8	2026-02-24 15:25:52.282419+00	\N	\N	{"pk": 10, "path": "000100030004", "depth": 3, "numchild": 0, "translation_key": "1928c85d-e9af-420e-9a5e-fa5ebbff5827", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "R\\u00e9union du Conseil National de l'OIC du 22 mars 2025", "draft_title": "R\\u00e9union du Conseil National de l'OIC du 22 mars 2025", "slug": "437-2", "content_type": 51, "url_path": "/blog/437-2/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-03-22", "body": "<!-- wp:paragraph -->\\n<p>Le samedi 22 mars 2025, le Conseil National de l\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) s\\u2019est r\\u00e9uni au <strong>Minist\\u00e8re de l'Am\\u00e9nagement du Territoire et des Grands Travaux</strong>, dans la <strong>Salle Alima</strong> de la mezzanine. Cette rencontre strat\\u00e9gique, plac\\u00e9e sous le signe de l\\u2019\\u00e9valuation et de la prospective, a permis aux membres du Conseil d\\u2019examiner les grandes orientations de l\\u2019OIC pour l\\u2019ann\\u00e9e en cours.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Un ordre du jour ax\\u00e9 sur l'\\u00e9valuation et la planification</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:gallery {\\"linkTo\\":\\"none\\"} -->\\n<figure class=\\"wp-block-gallery has-nested-images columns-default is-cropped\\"><!-- wp:image {\\"id\\":442,\\"sizeSlug\\":\\"large\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-large\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/03/WhatsApp-Image-2025-03-22-at-10.20.13-1024x768.jpeg\\" alt=\\"\\" class=\\"wp-image-442\\"/></figure>\\n<!-- /wp:image --></figure>\\n<!-- /wp:gallery -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Les travaux ont port\\u00e9 principalement sur trois points essentiels :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list {\\"ordered\\":true} -->\\n<ol class=\\"wp-block-list\\"><!-- wp:list-item -->\\n<li><strong>Examen des rapports d'activit\\u00e9s de l'ann\\u00e9e 2024.</strong></li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>\\u00c9tude des projets de programme et de budget pour l'ann\\u00e9e 2025.</strong></li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>Analyse de trois projets de d\\u00e9cisions majeurs pour le fonctionnement de l'OIC.</strong></li>\\n<!-- /wp:list-item --></ol>\\n<!-- /wp:list -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Le Conseil National a consacr\\u00e9 une large partie de la s\\u00e9ance \\u00e0 l\\u2019examen des rapports d'activit\\u00e9s de 2024, soulignant les r\\u00e9alisations majeures ainsi que les d\\u00e9fis rencontr\\u00e9s au cours de l'ann\\u00e9e \\u00e9coul\\u00e9e. La discussion a permis d\\u2019apporter des \\u00e9clairages sur certains projets en cours et d\\u2019identifier des axes d'am\\u00e9lioration pour renforcer l'impact des actions men\\u00e9es par l'OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Des perspectives ambitieuses pour 2025</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>L\\u2019un des points forts de la r\\u00e9union a \\u00e9t\\u00e9 la pr\\u00e9sentation des <strong>projets de programme et de budget 2025</strong>. Les membres du Conseil ont discut\\u00e9 des priorit\\u00e9s strat\\u00e9giques pour l\\u2019ann\\u00e9e en cours, avec un accent particulier sur le renforcement des capacit\\u00e9s des ing\\u00e9nieurs et la promotion de l\\u2019excellence professionnelle. Le budget, articul\\u00e9 autour des projets prioritaires, a fait l\\u2019objet de discussions approfondies pour garantir une gestion efficiente et transparente des ressources de l\\u2019Ordre.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Trois projets de d\\u00e9cisions examin\\u00e9s</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>En outre, trois projets de d\\u00e9cisions ont \\u00e9t\\u00e9 examin\\u00e9s lors de cette s\\u00e9ance. Ces d\\u00e9cisions visent \\u00e0 :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list {\\"ordered\\":true} -->\\n<ol class=\\"wp-block-list\\"><!-- wp:list-item -->\\n<li><strong>Am\\u00e9liorer la gouvernance interne de l\\u2019OIC.</strong></li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>Renforcer la transparence dans la gestion des ressources financi\\u00e8res.</strong></li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>Optimiser les m\\u00e9canismes de coordination entre les diff\\u00e9rentes instances r\\u00e9gionales et nationales.</strong></li>\\n<!-- /wp:list-item --></ol>\\n<!-- /wp:list -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Apr\\u00e8s un d\\u00e9bat constructif, le Conseil National a pris note des propositions d\\u2019amendement pour enrichir ces projets de d\\u00e9cisions avant leur adoption d\\u00e9finitive.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Vers un OIC plus fort et plus structur\\u00e9</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Cette r\\u00e9union du Conseil National a d\\u00e9montr\\u00e9 une fois de plus l\\u2019engagement des membres \\u00e0 faire de l\\u2019OIC une institution solide et structur\\u00e9e. La volont\\u00e9 d\\u2019am\\u00e9liorer les pratiques de gouvernance et de renforcer les capacit\\u00e9s des ing\\u00e9nieurs congolais reste au c\\u0153ur des priorit\\u00e9s pour 2025.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>L\\u2019OIC tient \\u00e0 remercier tous les participants pour leur implication active dans les \\u00e9changes et r\\u00e9affirme son engagement \\u00e0 accompagner les ing\\u00e9nieurs dans leur \\u00e9volution professionnelle et \\u00e0 contribuer au d\\u00e9veloppement durable du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Vive l'Ordre des Ing\\u00e9nieurs du Congo !<br>Vive l\\u2019ing\\u00e9nierie congolaise !</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	10	51	1	Réunion du Conseil National de l'OIC du 22 mars 2025
9	2026-02-24 15:25:52.320761+00	\N	\N	{"pk": 11, "path": "000100030005", "depth": 3, "numchild": 0, "translation_key": "31a49c02-9096-42d4-900f-1e01a0cf7151", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale de l'Ordre des Ing\\u00e9nieurs du Congo (OIC)", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale de l'Ordre des Ing\\u00e9nieurs du Congo (OIC)", "slug": "assemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-oic", "content_type": 51, "url_path": "/blog/assemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-oic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2024-03-30", "body": "<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Le samedi 30 mars 2024, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale aux Tours Jumelles de Mpila, marquant une \\u00e9tape significative dans la structuration et la mise en place op\\u00e9rationnelle de l'institution. Cet \\u00e9v\\u00e9nement fait suite \\u00e0 l'Assembl\\u00e9e G\\u00e9n\\u00e9rale \\u00c9lective organis\\u00e9e une ann\\u00e9e auparavant, qui avait permis d'\\u00e9lire le Conseil national et le Bureau ex\\u00e9cutif de l'OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:image {\\"id\\":542,\\"sizeSlug\\":\\"full\\",\\"linkDestination\\":\\"none\\"} -->\\n<figure class=\\"wp-block-image size-full\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/inaug2.jpg\\" alt=\\"\\" class=\\"wp-image-542\\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Un haut patronage qui honore la profession</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Cette assembl\\u00e9e inaugurale s'est tenue sous le haut patronage de Monsieur <strong>Jean Jacques BOUYA</strong>, Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux. Sa pr\\u00e9sence t\\u00e9moigne de l'importance accord\\u00e9e par les autorit\\u00e9s publiques \\u00e0 l'organisation et \\u00e0 la reconnaissance de la profession d'ing\\u00e9nieur au Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Un moment historique pour la profession d'ing\\u00e9nieur</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Cet \\u00e9v\\u00e9nement a rassembl\\u00e9 de nombreux ing\\u00e9nieurs issus de divers secteurs d'activit\\u00e9, ainsi que des personnalit\\u00e9s de premier plan engag\\u00e9es dans le d\\u00e9veloppement de l'ing\\u00e9nierie au Congo. La tenue de cette assembl\\u00e9e inaugurale marque un tournant d\\u00e9cisif dans la structuration de l'Ordre, d\\u00e9sormais pleinement op\\u00e9rationnel pour d\\u00e9fendre les int\\u00e9r\\u00eats des ing\\u00e9nieurs congolais et promouvoir l'excellence professionnelle.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Objectifs de l'Assembl\\u00e9e Inaugurale</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>L'Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale avait pour principal objectif de valider les textes fondamentaux r\\u00e9gissant l'Ordre, notamment les statuts et le r\\u00e8glement int\\u00e9rieur, \\u00e9labor\\u00e9s en concertation avec les membres du Conseil national et du Bureau ex\\u00e9cutif. Ces documents d\\u00e9finissent les missions, les valeurs et les principes \\u00e9thiques que l'OIC s'engage \\u00e0 promouvoir.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Les d\\u00e9bats ont \\u00e9galement port\\u00e9 sur les grandes orientations strat\\u00e9giques \\u00e0 adopter pour assurer la reconnaissance et la valorisation des ing\\u00e9nieurs dans le contexte socio-\\u00e9conomique du Congo. Les participants ont partag\\u00e9 leurs r\\u00e9flexions sur les d\\u00e9fis \\u00e0 relever, notamment en mati\\u00e8re de formation continue, de certification des comp\\u00e9tences et d'\\u00e9thique professionnelle.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Le Bureau et le Conseil en action</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Au cours de cette assembl\\u00e9e, le Bureau ex\\u00e9cutif, soutenu par le Conseil national, a pr\\u00e9sent\\u00e9 son programme d'action pour les prochaines ann\\u00e9es, incluant des initiatives concr\\u00e8tes pour renforcer l'accompagnement des ing\\u00e9nieurs dans leur parcours professionnel. Les membres ont pu d\\u00e9battre des projets \\u00e0 venir, notamment la mise en place de commissions sp\\u00e9cialis\\u00e9es pour r\\u00e9pondre aux probl\\u00e9matiques techniques et r\\u00e9glementaires propres aux diff\\u00e9rents corps d'ing\\u00e9nieurs.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Vers une dynamique collective</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Les \\u00e9changes constructifs ont mis en lumi\\u00e8re l'importance de la solidarit\\u00e9 entre les ing\\u00e9nieurs congolais pour relever les d\\u00e9fis de d\\u00e9veloppement du pays. Le Pr\\u00e9sident du Bureau ex\\u00e9cutif a insist\\u00e9 sur la n\\u00e9cessit\\u00e9 de travailler en synergie avec les autorit\\u00e9s publiques et les partenaires priv\\u00e9s pour faire de l'OIC un acteur incontournable du progr\\u00e8s technique et \\u00e9conomique au Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Une mobilisation exemplaire</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>La forte participation \\u00e0 cette Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale t\\u00e9moigne de l'adh\\u00e9sion collective des ing\\u00e9nieurs congolais \\u00e0 ce projet f\\u00e9d\\u00e9rateur. Les membres pr\\u00e9sents ont exprim\\u00e9 leur volont\\u00e9 de contribuer activement aux projets de l'OIC, convaincus que l'Ordre repr\\u00e9sente un levier essentiel pour la reconnaissance et la valorisation de leur m\\u00e9tier.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"level\\":4,\\"className\\":\\"\\"} -->\\n<h4 class=\\"wp-block-heading\\"><strong>Un avenir prometteur</strong></h4>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Cette assembl\\u00e9e inaugurale marque le v\\u00e9ritable lancement op\\u00e9rationnel de l'Ordre des Ing\\u00e9nieurs du Congo. En posant les bases solides de son fonctionnement, l'OIC s'engage \\u00e0 promouvoir l'excellence, l'\\u00e9thique et l'innovation au sein de la profession d'ing\\u00e9nieur.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>L'Ordre des Ing\\u00e9nieurs du Congo remercie tous les participants pour leur engagement et leur d\\u00e9termination \\u00e0 faire de cette assembl\\u00e9e une r\\u00e9ussite. L'OIC est d\\u00e9sormais pr\\u00eat \\u00e0 jouer pleinement son r\\u00f4le dans la structuration de la profession et le d\\u00e9veloppement durable du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Vive l'Ordre des Ing\\u00e9nieurs du Congo !<br>Vive l'ing\\u00e9nierie congolaise !</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	11	51	1	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)
10	2026-02-24 15:25:52.367979+00	\N	\N	{"pk": 12, "path": "000100030006", "depth": 3, "numchild": 0, "translation_key": "19e293e2-d722-4b30-86ef-1e85b30c27c7", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Discours d\\u2019investiture du Pr\\u00e9sident de l\\u2019OIC", "draft_title": "Discours d\\u2019investiture du Pr\\u00e9sident de l\\u2019OIC", "slug": "discours-dinvestiture-du-president-de-loic", "content_type": 51, "url_path": "/blog/discours-dinvestiture-du-president-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2023-07-08", "body": "<!-- wp:paragraph -->\\n<p><em>Brazzaville, le 8 juillet 2023</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>M</strong><strong>onsieur&nbsp;</strong><a></a><strong>le&nbsp;</strong><strong>Directeur de cabinet du M</strong><strong>inistre&nbsp;</strong><strong>de la construction de l\\u2019urbanisme et de l\\u2019habitat</strong><strong>&nbsp;;</strong><strong></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Honorable d\\u00e9put\\u00e9 Blaise AMBETO</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Chers confr\\u00e8res ing\\u00e9nieurs ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Distingu\\u00e9s invit\\u00e9s ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mesdames et messieurs&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Mon&nbsp;\\u00e9motion&nbsp;est grande&nbsp;!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Cela</strong><strong>&nbsp;</strong><strong>fait</strong><strong>, plus de</strong><strong>&nbsp;</strong><strong>cinq&nbsp;</strong><strong>(5)</strong><strong>&nbsp;</strong><strong>ans&nbsp;</strong><strong>que nous attendons ce jour</strong>&nbsp;!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Le Congo,&nbsp;notre pays,&nbsp;\\u00e9tait malheureusement absent des grandes rencontres scientifiques et technologiques organis\\u00e9es par la f\\u00e9d\\u00e9ration mondiale et&nbsp;la f\\u00e9d\\u00e9ration&nbsp;africaine des&nbsp;organisations d\\u2019ing\\u00e9nierie&nbsp;;(FMO et FAOI).</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Aujourd\\u2019hui, nous venons de parachever le processus de cr\\u00e9ation</strong>&nbsp;de l\\u2019ordre des ing\\u00e9nieurs&nbsp;du Congo,&nbsp;en sigle&nbsp;OIC, par la mise en place du conseil national&nbsp;de l\\u2019ordre&nbsp;et de son&nbsp;bureau ex\\u00e9cutif.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je&nbsp;</strong><strong>tiens \\u00e0&nbsp;</strong><strong>remercie</strong><strong>r</strong><strong>&nbsp;</strong><strong>mes</strong><strong>&nbsp;</strong><strong>chers&nbsp;</strong><strong>confr\\u00e8res ing\\u00e9nieurs</strong>pour la confiance renouvel\\u00e9e \\u00e0 ma&nbsp;modeste personne&nbsp;apr\\u00e8s avoir \\u00e9t\\u00e9 pr\\u00e9sident de la commission pr\\u00e9paratoire&nbsp;de&nbsp;l\\u2019OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Pour ma part, je prends l\\u2019engagement,&nbsp;une fois de plus,de donner le meilleur de moi-m\\u00eame&nbsp;et&nbsp;transmettre aux jeunes g\\u00e9n\\u00e9rations cet h\\u00e9ritage pr\\u00e9cieux pour le d\\u00e9veloppement de&nbsp;notre&nbsp;pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>En ce jour m\\u00e9morable,</strong>&nbsp;permettez-moi d\\u2019avoir une pens\\u00e9e pieuse pour nos confr\\u00e8res&nbsp;d\\u00e9c\\u00e9d\\u00e9s&nbsp;au cours des cinq (5) derni\\u00e8res ann\\u00e9es.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Eux&nbsp;qui&nbsp;r\\u00eavaient,&nbsp;comme nous&nbsp;tous,&nbsp;d\\u2019\\u00eatre dans cette salle pour&nbsp;c\\u00e9l\\u00e9brer cet&nbsp;\\u00e9v\\u00e8nement&nbsp;de la naissance de l\\u2019OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>J\\u2019ai cit\\u00e9&nbsp;:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>-&nbsp;<strong>MBOUSSA Alphonse</strong>,&nbsp;ing\\u00e9nieur&nbsp;en g\\u00e9nie-civil Directeur g\\u00e9n\\u00e9ral de la soci\\u00e9t\\u00e9 \\u00ab&nbsp;Congo engineering&nbsp;\\u00bb,&nbsp;qui \\u00e9tait l\\u2019un des pr\\u00e9curseurs de cette initiative ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>-&nbsp;<strong>L\\u2019honorable NIANG</strong><strong>A ELENGA</strong>&nbsp;<strong>Andr\\u00e9</strong>, Ing\\u00e9nieur de mines, Directeur g\\u00e9n\\u00e9ral de l\\u2019ONEMO&nbsp;;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>-&nbsp;<strong>NDOUNIAMA Alphonse</strong>&nbsp;ing\\u00e9nieur en g\\u00e9nie-civil ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>-&nbsp;<strong>FOUAKAFOUENI Guy Ars\\u00e8ne</strong>&nbsp;ing\\u00e9nieur en g\\u00e9nie-civil.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Qu\\u2019ils re\\u00e7oivent l\\u00e0-haut paix et lumi\\u00e8re \\u00e0 leur&nbsp;\\u00e2me&nbsp;!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je vous prie&nbsp;</strong><strong>d\\u2019ailleurs&nbsp;</strong><strong>tr\\u00e8s respectueusement</strong><strong>,</strong><strong>&nbsp;</strong><strong>de</strong><strong>bien vouloir&nbsp;</strong><strong>vous</strong><strong>&nbsp;lever pour observer une minute de silence en leurs m\\u00e9moires.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je vous remercie&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res&nbsp;ing\\u00e9nieurs ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Tout le monde&nbsp;se souvient&nbsp;que&nbsp;le processus de cr\\u00e9ation de l\\u2019OIC a \\u00e9t\\u00e9 tr\\u00e8s difficile.&nbsp;Nos confr\\u00e8res du g\\u00e9nie-civil ont tent\\u00e9&nbsp;cette exp\\u00e9rience&nbsp;\\u00e0 plusieurs reprises sans succ\\u00e8s&nbsp;!&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est pour cela qu\\u2019au nom de tous les ing\\u00e9nieurs ici&nbsp;pr\\u00e9sents,&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je</strong><strong>&nbsp;voudrais remercier le&nbsp;</strong><strong>gouvernement</strong><strong>&nbsp;de la r\\u00e9publique&nbsp;</strong>qui<strong>&nbsp;</strong>par&nbsp;l\\u2019entremise du&nbsp;Ministre d\\u2019\\u00e9tat,ministre&nbsp;de l\\u2019am\\u00e9nagement du territoire,&nbsp;des infrastructures et de&nbsp;l\\u2019entretien&nbsp;routier&nbsp;a toujours mis \\u00e0 notre disposition la confortable&nbsp;salle de r\\u00e9union&nbsp;\\u00ab&nbsp;FLEUVE CONGO&nbsp;\\u00bb&nbsp;du si\\u00e8ge&nbsp;de son minist\\u00e8re,chaque fois que nous en avions&nbsp;eu&nbsp;besoins pour&nbsp;la tenue de&nbsp;nos assembl\\u00e9es&nbsp;g\\u00e9n\\u00e9rales.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u200b&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Aujourd\\u2019hui</strong><strong>,</strong><strong>&nbsp;notre volont\\u00e9 de promouvoir la profession d\\u2019ing\\u00e9nieur au Congo a port\\u00e9&nbsp;</strong><strong>s</strong><strong>es&nbsp;</strong><strong>fruits.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous&nbsp;venons de mettre&nbsp;en place un ordre f\\u00e9d\\u00e9rateur&nbsp;qui&nbsp;regroupe&nbsp;plusieurs sp\\u00e9cialit\\u00e9s.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Dor\\u00e9navant,&nbsp;nous avons&nbsp;deux&nbsp;lois&nbsp;organiques&nbsp;:&nbsp;la loi portant cr\\u00e9ation et organisation de l\\u2019ordre des&nbsp;ing\\u00e9nieurs du Congo&nbsp;en sigle \\u00ab&nbsp;OIC&nbsp;\\u00bb&nbsp;et la loi r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur au Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Permettez-moi de remercier&nbsp;<strong>l\\u2019honorable Blaise AMBETO</strong>&nbsp;qui a port\\u00e9 et d\\u00e9fendu valablement&nbsp;nos&nbsp;deux propositions de loi&nbsp;devant l\\u2019Assembl\\u00e9e National etdevant&nbsp;le S\\u00e9nat.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je voudrais&nbsp;\\u00e9galement&nbsp;remercier, au nom de tous les ing\\u00e9nieurs du Congo,&nbsp;<strong>S</strong><strong>on Excellen</strong><strong>ce Monsieur le Pr\\u00e9sident de la R</strong><strong>\\u00e9publique,</strong><strong>&nbsp;Denis SASSOU&nbsp;</strong><strong>N\\u2019GUESSO,&nbsp;</strong><strong>le Premier M</strong><strong>inistre et son G</strong><strong>ouvernement&nbsp;</strong>pour avoir mis&nbsp;\\u00e0&nbsp;la disposition des ing\\u00e9nieurs congolais un cadre juridique pour l\\u2019exercice de leur&nbsp;profession,&nbsp;je dirai m\\u00eame&nbsp;pour l\\u2019exercice&nbsp;de leurpouvoir d\\u2019acquisition.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Conform\\u00e9ment&nbsp;aux&nbsp;articles&nbsp;<strong>6</strong><strong>&nbsp;et&nbsp;</strong><strong>17</strong>&nbsp;de la loi r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur au Congo, il&nbsp;nous reste \\u00e0 compl\\u00e9ter les textes de l\\u2019ordre&nbsp;par&nbsp;la<strong>&nbsp;loi portant code d\\u00e9ontologique de la profession d\\u2019ing\\u00e9nieur</strong>&nbsp;<strong>au Congo</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est&nbsp;une loi tr\\u00e8s importante pour l\\u2019encadrement de nos comportements&nbsp;!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Et&nbsp;par&nbsp;<strong>le d\\u00e9cret pr\\u00e9cisant la liste&nbsp;</strong><strong>des g\\u00e9nies&nbsp;</strong><strong>composant la profession d\\u2019ing\\u00e9nieur en&nbsp;</strong><strong>R</strong><strong>\\u00e9publique du Congo</strong>.&nbsp;Ce d\\u00e9cret est n\\u00e9cessaire car le mot ing\\u00e9nieur aujourd\\u2019hui va dans tous les sens et commence \\u00e0 perdre son sens originel.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers&nbsp;</strong><strong>confr\\u00e8res&nbsp;ing\\u00e9nieurs</strong><strong>&nbsp;</strong><strong>;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>La loi portant cr\\u00e9ation et organisation de l\\u2019ordre des ing\\u00e9nieurs du Congo&nbsp;en sigle \\u00ab&nbsp;OIC&nbsp;\\u00bb&nbsp;stipule&nbsp;\\u00e0&nbsp;<strong>l\\u2019article 20</strong>&nbsp;que&nbsp;<strong>\\u00ab&nbsp;nul ne peut exercer la profession d\\u2019ing\\u00e9nieur au Congo s\\u2019il n\\u2019est pr\\u00e9alablement inscrit au tableau de&nbsp;</strong><strong>l\\u2019ordre \\u00bb</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>D\\u00e9sormais,&nbsp;tous&nbsp;les&nbsp;ing\\u00e9nieurs, tous les d\\u00e9tenteurs de dipl\\u00f4mes d\\u2019ing\\u00e9nieurs ont&nbsp;l\\u2019obligation d\\u2019adh\\u00e9rer \\u00e0 l\\u2019OIC&nbsp;pour valoriser leur titre d\\u2019ing\\u00e9nieur.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il est&nbsp;donc&nbsp;fait&nbsp;\\u00e9galement&nbsp;obligation aux soci\\u00e9t\\u00e9s d\\u2019ing\\u00e9nierie de se conformer \\u00e0 la loi dans un d\\u00e9lai de 6 mois \\u00e0 compter de la date de la promulgation.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res&nbsp;ing\\u00e9nieurs ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous avons l\\u00e0&nbsp;aussi&nbsp;l\\u2019occasion&nbsp;pour le progr\\u00e8s&nbsp;collectif,de&nbsp;se regrouper,&nbsp;afin&nbsp;de&nbsp;cr\\u00e9er de&nbsp;grandes&nbsp;soci\\u00e9t\\u00e9s&nbsp;d\\u2019ing\\u00e9nierie&nbsp;pour affronter les grands march\\u00e9s de l\\u2019\\u00e9tatet non de&nbsp;se complaire&nbsp;dans la vision \\u00e9triqu\\u00e9e des \\u00e9tablissements personnels.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est pour cela&nbsp;qu\\u2019il nous faut se recycler&nbsp;sans cesse,car,&nbsp;beaucoup&nbsp;d\\u2019entre nous&nbsp;sont devenus des ing\\u00e9nieurs&nbsp;administratifs.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>On parle aujourd\\u2019hui d\\u2019intelligence artificielle</strong>. Ilnous faut profiter du num\\u00e9rique, apprendre les logiciels de calculs qui nous donnent l\\u2019opportunit\\u00e9 de se mesurer aux pays d\\u00e9velopp\\u00e9s.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Monsieur le&nbsp;</strong><strong>Directeur de cabinet du M</strong><strong>inistre de la construction de l\\u2019urbanisme et de l\\u2019habitat&nbsp;;&nbsp;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Honorable d\\u00e9put\\u00e9 Blaise AMBETO</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Chers confr\\u00e8res ing\\u00e9nieurs ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Distingu\\u00e9s invit\\u00e9s ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mesdames et messieurs&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>La cr\\u00e9ation de l\\u2019ordre des ing\\u00e9nieurs du Congo&nbsp;int\\u00e8grebel et bien la vision de son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique consign\\u00e9e&nbsp;<strong>au point 4</strong>&nbsp;de son projet de soci\\u00e9t\\u00e9&nbsp;<strong>\\u00ab&nbsp;Ensemble</strong><strong>,</strong><strong>&nbsp;poursuivons la marche \\u00bb</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est bien beau de cr\\u00e9er des soci\\u00e9t\\u00e9s, mais encore faut-il trouver des march\\u00e9s&nbsp;!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est pourquoi pour \\u00e9pouser cette vision du pr\\u00e9sident de la r\\u00e9publique, il est important d\\u2019encourager les cr\\u00e9ateurs d\\u2019emplois du secteur de l\\u2019ing\\u00e9nierie \\u00e0 l\\u2019acc\\u00e8s auxmarch\\u00e9s&nbsp;publics par&nbsp;<strong>la r\\u00e9vision du code des</strong><strong>&nbsp;march\\u00e9</strong><strong>s</strong><strong></strong><strong>public</strong><strong>s</strong>,&nbsp;conform\\u00e9ment \\u00e0&nbsp;<strong>l\\u2019article 14&nbsp;</strong>de la loi r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur au Congo&nbsp;qui&nbsp;stipule&nbsp;que&nbsp;<strong>\\u00ab&nbsp;la r\\u00e9alisation de tout projet d\\u2019ing\\u00e9nierie dans ses diff\\u00e9rentes \\u00e9tapes&nbsp;</strong><strong>pour les&nbsp;</strong><strong>financement</strong><strong>s</strong><strong>&nbsp;public</strong><strong>s</strong><strong>&nbsp;se fait en associant les \\u00e9tablissement</strong><strong>s</strong><strong>&nbsp;inscrit</strong><strong>s</strong><strong>&nbsp;au tableau de l\\u2019ordre \\u00bb</strong>.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res !</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Souvenez-vous&nbsp;des&nbsp;deux missions&nbsp;essentielles&nbsp;que vous m\\u2019avez&nbsp;confi\\u00e9es,&nbsp;notamment,&nbsp;<strong>faire aboutir les lois</strong>&nbsp;et&nbsp;<strong>mettre en place les instances de l\\u2019ordre</strong>&nbsp;!&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Aujourd\\u2019hui je peux&nbsp;vous dire&nbsp;:&nbsp;<strong>MISSION ACCOMPLIE&nbsp;!</strong><strong></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Rendez-vous&nbsp;pour les trois&nbsp;prochaines&nbsp;ann\\u00e9es !&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Que Dieu b\\u00e9nisse l\\u2019OIC&nbsp;!</strong><strong></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Vive l\\u2019OIC&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong></strong><strong>Vive le Congo</strong><strong>&nbsp;!</strong>&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je</strong><strong>&nbsp;vous remercie</strong>&nbsp;<strong>de</strong><strong>&nbsp;votre aimable attenti</strong></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	12	51	1	Discours d’investiture du Président de l’OIC
11	2026-02-24 15:25:52.425122+00	\N	\N	{"pk": 13, "path": "000100030007", "depth": 3, "numchild": 0, "translation_key": "9dc860e3-4938-403e-9ecb-2a696027e296", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Discours \\u00e0 l\\u2019occasion du premier anniversaire de l\\u2019Ordre des Ing\\u00e9nieurs du Congo \\u00ab\\u00a0OIC\\u00a0\\u00bb", "draft_title": "Discours \\u00e0 l\\u2019occasion du premier anniversaire de l\\u2019Ordre des Ing\\u00e9nieurs du Congo \\u00ab\\u00a0OIC\\u00a0\\u00bb", "slug": "discours-a-loccasion-du-premier-anniversaire-de-lordre-des-ingenieurs-du-congo-oic", "content_type": 51, "url_path": "/blog/discours-a-loccasion-du-premier-anniversaire-de-lordre-des-ingenieurs-du-congo-oic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2023-07-08", "body": "<!-- wp:paragraph -->\\n<p><strong>-&nbsp;</strong><strong>Messieurs les membres du Conseil National,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>- Chers confr\\u00e8res ing\\u00e9nieurs,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>- Notre distingu\\u00e9 inv</strong><strong>it\\u00e9, l\\u2019Honorable Blaise AMBETO,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il y a quelques ann\\u00e9es, nous avons pris l\\u2019initiative de cr\\u00e9er un Ordre f\\u00e9d\\u00e9rateur des Ing\\u00e9nieurs du Congo. Notre ambition \\u00e9tait de mettre en lumi\\u00e8re l\\u2019importance cruciale des m\\u00e9tiers&nbsp;m\\u00e9tiers&nbsp;de l\\u2019ing\\u00e9nierie&nbsp;aupr\\u00e8s de nos gouvernants.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Aujourd\\u2019hui, en jetant un regard sur le chemin parcouru, nous mesurons les sacrifices et la d\\u00e9termination&nbsp;de chacun d\\u2019entre nous&nbsp;qui ont abouti \\u00e0 la promulgation des lois fondatrices de notre ordre par son Excellence, Monsieur Denis SASSOU N'GUESSO, Pr\\u00e9sident de la R\\u00e9publique.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Ces lois sont :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- La loi n\\u00b0 2-2023 du 22 f\\u00e9vrier 2023&nbsp;<strong><em>r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur en R\\u00e9publique du Congo,</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- La loi n\\u00b0 3-2023 du 22 f\\u00e9vrier 2023&nbsp;<strong><em>portant cr\\u00e9ation et organisation de l\\u2019Ordre</em></strong><strong><em>&nbsp;des Ing\\u00e9nieurs du Congo (OIC).</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Gr\\u00e2ce \\u00e0 ces lois, nous avons pu organiser&nbsp;<strong><em>le 8 juillet 2023</em></strong>au Grand H\\u00f4tel de&nbsp;Kint\\u00e9l\\u00e9&nbsp;l\\u2019assembl\\u00e9e g\\u00e9n\\u00e9rale constitutive qui&nbsp;nous&nbsp;a&nbsp;permis de mettre&nbsp;en place les instances de l\\u2019ordre, \\u00e0 savoir le Conseil National de 25 membres et son Bureau Ex\\u00e9cutif de 5 membres.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Cette date du 8 juillet 2023</em></strong>&nbsp;marque d\\u00e9sormais la naissance officielle de l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Aujourd'hui, nous nous retrouvons pour c\\u00e9l\\u00e9brer le premier&nbsp;anniversaire&nbsp;de la cr\\u00e9ation de l\\u2019OIC, marqu\\u00e9e par la d\\u00e9termination et l'engagement de chacun d'entre nous. C\\u2019est&nbsp;ici&nbsp;l\\u2019occasion de rendre&nbsp;hommage \\u00e0 nos confr\\u00e8res d\\u00e9c\\u00e9d\\u00e9s en observant une minute de silence en leur m\\u00e9moire :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>J\\u2019ai cit\\u00e9&nbsp;:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>-&nbsp;<em>MBOUSSA Alphonse,</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><em>- L\\u2019honorable NIANGA ELENGA Andr\\u00e9,</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><em>- NDOUNIAMA Alphonse,</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><em>- FOUAKAFOUENI Guy Ars\\u00e8ne,</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><em>- ODIKA Hyppolite.</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Je vous prie de vous lever.</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Je vous remercie.</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Comme vous&nbsp;le savez bien, nous sommes encore dans le processus de cr\\u00e9ation&nbsp;de l\\u2019OIC, qui exige de nous un certain nombre d\\u2019actions \\u00e0 mener, telles que :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- l\\u2019adoption des textes d\\u2019application \\u00e0 soumettre au gouvernement (le code d\\u00e9ontologique de l\\u2019ing\\u00e9nieur congolais et le d\\u00e9cret d\\u00e9finissant les&nbsp;types de g\\u00e9nies et d'ing\\u00e9nierie devant faire partie de&nbsp;l\\u2019ordre).</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- La mise en place de la chambre d\\u00e9partementale de Pointe-Noire,</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- L\\u2019adoption du premier tableau des ing\\u00e9nieurs autoris\\u00e9s \\u00e0 exercer en R\\u00e9publique du Congo en 2025,</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- L\\u2019organisation de la grande c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs,</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>- Et enfin, la transmission, comme le veut la loi, du tableau au gouvernement, aux pr\\u00e9fets et aux maires.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Pour l\\u2019instant, nous encourageons les ing\\u00e9nieurs et les soci\\u00e9t\\u00e9s d\\u2019ing\\u00e9nierie \\u00e0 s\\u2019inscrire \\u00e0 l\\u2019ordre. Des courriers ont \\u00e9t\\u00e9 adress\\u00e9s \\u00e0 certaines soci\\u00e9t\\u00e9s pour les informer de l\\u2019obligation d\\u2019inscrire leurs ing\\u00e9nieurs et leurs soci\\u00e9t\\u00e9s \\u00e0 l\\u2019OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>D\\u2019ici la fin de l\\u2019ann\\u00e9e, tous les ing\\u00e9nieurs souhaitant exercer au Congo devront figurer sur le tableau de l\\u2019ordre.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je profite de cette occasion pour interpeller chacun de vous \\u00e0 s\\u2019acquitter de ses cotisations annuelles adopt\\u00e9es par l\\u2019assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019OIC doit \\u00eatre le lieu privil\\u00e9gi\\u00e9 o\\u00f9 nous \\u00e9tablissons des normes \\u00e9lev\\u00e9es de professionnalisme, favorisons les \\u00e9changes de connaissances et renfor\\u00e7ons les liens de solidarit\\u00e9 entre ing\\u00e9nieurs.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Notre d\\u00e9vouement permettra, j\\u2019en suis s\\u00fbr, de rehausser&nbsp;le<a></a>niveau de comp\\u00e9tence&nbsp;et d'int\\u00e9grit\\u00e9 des ing\\u00e9nieurs.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous avons un r\\u00f4le crucial \\u00e0 jouer dans le d\\u00e9veloppement du Congo. Nous devons continuer \\u00e0 innover, former les jeunes g\\u00e9n\\u00e9rations et collaborer avec les secteurs public et priv\\u00e9 pour relever les grands d\\u00e9fis technologiques, environnementaux et \\u00e9conomiques de notre pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je tiens \\u00e0 exprimer ma profonde gratitude \\u00e0 chacun de vous, car votre passion et votre&nbsp;engagement sont la cl\\u00e9 de notre succ\\u00e8s. Gr\\u00e2ce \\u00e0 votre d\\u00e9vouement, je suis convaincu que nous continuerons \\u00e0 r\\u00e9aliser des progr\\u00e8s significatifs pour positionner l\\u2019OIC comme un organe incontournablepour le d\\u00e9veloppement du pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Pendant que nous c\\u00e9l\\u00e9brons ce premier anniversaire, je vous invite \\u00e0 renouveler votre engagement pour l\\u2019avenir de l\\u2019OIC. Ensemble, nous contribuerons \\u00e0 l\\u2019\\u00e9dification du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Vive l'Ordre des Ing\\u00e9nieurs du Congo !</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Vive le Congo !</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Que Dieu b\\u00e9nisse l\\u2019OIC !</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Bonne f\\u00eate \\u00e0 tous !</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Je vous remercie.</em></strong></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	13	51	1	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »
12	2026-02-24 15:25:52.499077+00	\N	\N	{"pk": 14, "path": "000100030008", "depth": 3, "numchild": 0, "translation_key": "39d49735-65b5-43e9-ad41-4b3bfc2cb837", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Mot\\u00a0du pr\\u00e9sident de l\\u2019OIC \\u00e0 la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau 2025", "draft_title": "Mot\\u00a0du pr\\u00e9sident de l\\u2019OIC \\u00e0 la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau 2025", "slug": "mot-du-president-de-loic-a-la-ceremonie-de-prestation-de-serment-des-ingenieurs-inscrits-au-tableau-2025", "content_type": 51, "url_path": "/blog/mot-du-president-de-loic-a-la-ceremonie-de-prestation-de-serment-des-ingenieurs-inscrits-au-tableau-2025/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-02-13", "body": "<!-- wp:paragraph -->\\n<p>\\u2022\\u00a0<strong><em>Excellence Monsieur le Ministre d\\u2019</em></strong><strong><em>\\u00e9tat, Ministre de l\\u2019am\\u00e9nagement du territoire\\u00a0</em></strong><strong><em>et\\u00a0</em></strong><strong><em>des\\u00a0</em></strong><strong><em>grands travaux</em></strong> ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Honorable d\\u00e9put\\u00e9 Blaise AMBETO&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Messieurs les membres du Conseil National&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Chers confr\\u00e8res ing\\u00e9nieurs</em></strong><strong><em>&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022\\u00a0<strong><em>Distingu\\u00e9s invit\\u00e9s</em></strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous nous retrouvons aujourd\\u2019hui pour une c\\u00e9r\\u00e9monie historique, marquant&nbsp;<strong>l\\u2019officialisation du premier tableau de l\\u2019Ordre des Ing\\u00e9nieurs du Congo et la prestation de serment des premiers membres de&nbsp;</strong><strong>notre ordre</strong><strong>.&nbsp;</strong>Cet \\u00e9v\\u00e9nement constitue une \\u00e9tape majeure dans la structuration et la valorisation de notre profession.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Permettez-moi, en ce jour solennel, de retracer bri\\u00e8vement le chemin parcouru pour aboutir \\u00e0 ce moment si significatif.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>En 2016,</strong>&nbsp;nous avons pris l\\u2019initiative d\\u2019organiser notre profession en dotant notre pays d\\u2019un Ordre des Ing\\u00e9nieurs, \\u00e0 l\\u2019instar de certains pays de la sous-r\\u00e9gion. Pendant cinq ann\\u00e9es, nous avons travaill\\u00e9 avec d\\u00e9termination \\u00e0 l\\u2019\\u00e9laboration des textes l\\u00e9gislatifs et \\u00e0 la mise en place des strat\\u00e9gies n\\u00e9cessaires pour concr\\u00e9tiser ce projet ambitieux.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Au moment,&nbsp;ou nous&nbsp;publions&nbsp;la liste&nbsp;des premiers membres de l\\u2019OIC, j\\u2019ai une pens\\u00e9e pieuse en m\\u00e9moire de nos confr\\u00e8res ing\\u00e9nieurs &nbsp;d\\u00e9c\\u00e9d\\u00e9s,&nbsp;j\\u2019ai cit\\u00e9&nbsp;:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>-&nbsp;</strong><strong>MBOUSSA Alphonse,</strong><strong>&nbsp;</strong>qui \\u00e9tait l\\u2019un des initiateurs de ce projet</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>- L\\u2019Honorable NIANGA ELENGA Andr\\u00e9,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>- NDOUNIAMA Alphonse,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>- FOUAKAFOUENI Guy Ars\\u00e8ne,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>- ODIKA Hyppolite.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Ainsi, je vous prie tr\\u00e8s respectueusement de bien vouloir vous lever pour&nbsp;observer&nbsp;une minute de silence en leur m\\u00e9moire.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je vous remercie</strong><strong>&nbsp;!</strong><strong>&nbsp;&nbsp;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous&nbsp;avons&nbsp;le devoir de rendre hommage&nbsp;\\u00e0&nbsp;ceux qui ont rendu&nbsp;la&nbsp;r\\u00e9alisation&nbsp;de ce projet&nbsp;possible. Nos sinc\\u00e8res remerciements vont tout d\\u2019abord \\u00e0&nbsp;<strong>Son Excellence Monsieur Denis SASSOU N\\u2019GUESSO,</strong>&nbsp;<strong>Pr\\u00e9sident de la R\\u00e9publique et Chef de l\\u2019\\u00c9tat,</strong>&nbsp;pour avoir promulgu\\u00e9 les lois fondatrices de notre Ordre, d\\u00e9sormais connues sous le nom de&nbsp;<strong>Lois&nbsp;</strong><strong>AMBETO</strong>,</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0&nbsp;savoir&nbsp;<a></a>:<strong>&nbsp;La</strong><strong>&nbsp;loi portant cr\\u00e9ation et organisation de l\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC)&nbsp;</strong><strong>;</strong>et&nbsp;<strong>La loi r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur en R\\u00e9publique du Congo.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous exprimons \\u00e9galement notre profonde gratitude \\u00e0&nbsp;<strong>l\\u2019Honorable Blaise AMBETO</strong>, qui a port\\u00e9 et d\\u00e9fendu ces textes avec conviction devant le Parlement.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nos remerciements s\\u2019adressent aussi \\u00e0&nbsp;<strong>Son Excellence Monsieur le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux,</strong>&nbsp;pour son soutien ind\\u00e9fectible, notamment en mettant&nbsp;toujours&nbsp;\\u00e0 notre disposition la&nbsp;confortable&nbsp;salle de r\\u00e9union&nbsp;<strong>\\u00ab Fleuve Congo \\u00bb</strong>&nbsp;pour nos travaux pr\\u00e9paratoires.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Excellence Monsieur le Ministre d\\u2019\\u00c9tat,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res ing\\u00e9nieurs,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Cette c\\u00e9r\\u00e9monie symbolise la concr\\u00e9tisation de notre engagement \\u00e0 r\\u00e9glementer et \\u00e0 valoriser la profession d\\u2019ing\\u00e9nieur&nbsp;dans notre pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>L\\u2019article 20</strong>&nbsp;de la loi portant cr\\u00e9ation et organisation de l\\u2019Ordre&nbsp;des ing\\u00e9nieurs du Congo&nbsp;stipule sans ambigu\\u00eft\\u00e9 que :&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>\\u00ab Nul ne peut exercer la profession d\\u2019ing\\u00e9nieur au Congo s\\u2019il n\\u2019est pr\\u00e9alablement inscrit au tableau de l\\u2019Ordre. \\u00bb</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Ainsi, nous avons l\\u2019honneur de vous pr\\u00e9senter aujourd\\u2019hui&nbsp;<strong>le premier tableau 2025</strong>&nbsp;de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, avec la classification des ing\\u00e9nieurs selon leurs sp\\u00e9cialit\\u00e9s. Parmi&nbsp;<strong>les nombreux postulants, 1</strong><strong>54</strong><strong>&nbsp;</strong><strong>dont 2 \\u00e9trangers&nbsp;</strong><strong>ont \\u00e9t\\u00e9 retenus</strong>&nbsp;apr\\u00e8s une v\\u00e9rification rigoureuse de leurs qualifications acad\\u00e9miques.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Sur ce tableau nous avons&nbsp;\\u00e9galement&nbsp;<strong>inscrit</strong><strong>&nbsp;19</strong><strong>&nbsp;soci\\u00e9t\\u00e9s d\\u2019ing\\u00e9nierie</strong><strong>, conform\\u00e9ment \\u00e0 la loi.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res ing\\u00e9nieurs,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019acte que nous allons accomplir dans quelques instants est bien plus qu\\u2019une simple formalit\\u00e9 administrative. Pr\\u00eater serment,&nbsp;c\\u2019est s\\u2019engager solennellement \\u00e0 respecter les valeurs fondamentales de notre profession :&nbsp;<strong>l\\u2019\\u00e9thique, l\\u2019excellence technique et la responsabilit\\u00e9 sociale.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Par ce serment, nous affirmons notre d\\u00e9termination \\u00e0 exercer nos missions avec&nbsp;<strong>int\\u00e9grit\\u00e9, comp\\u00e9tence et d\\u00e9vouement</strong>. Nous nous engageons \\u00e0 respecter les r\\u00e8gles de l\\u2019art,&nbsp;et&nbsp;\\u00e0 mettre nos comp\\u00e9tences au service du d\\u00e9veloppement&nbsp;national.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous sommes&nbsp;<strong>les pionniers de ce tableau inaugural, et \\u00e0 ce titre, nous portons une immense responsabilit\\u00e9.</strong>&nbsp;Soyons&nbsp;donc&nbsp;dignes&nbsp;et fiers&nbsp;de cet honneur et \\u0153uvrons ensemble pour&nbsp;faire rayonner notre profession.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo !</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Vive le Congo !</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Vive l\\u2019OIC !</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je vous remercie.</strong></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	14	51	1	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025
13	2026-02-24 15:25:52.53828+00	\N	\N	{"pk": 15, "path": "000100030009", "depth": 3, "numchild": 0, "translation_key": "e7964d8b-948a-496a-b550-f1a4da486e4b", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Mot d\\u2019ouverture de l\\u2019assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale de l\\u2019Ordre des Ing\\u00e9nieurs du Congo en sigle\\u00a0\\u00ab\\u00a0OIC\\u00a0\\u00bb", "draft_title": "Mot d\\u2019ouverture de l\\u2019assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale de l\\u2019Ordre des Ing\\u00e9nieurs du Congo en sigle\\u00a0\\u00ab\\u00a0OIC\\u00a0\\u00bb", "slug": "mot-douverture-de-lassemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-en-sigle-oic", "content_type": 51, "url_path": "/blog/mot-douverture-de-lassemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-en-sigle-oic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2024-03-30", "body": "<!-- wp:paragraph -->\\n<p>Brazzaville le 30 mars 2024</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022\\u00a0<strong><em>Excellence Monsieur le Ministre d\\u2019\\u00e9tat, Ministre de l\\u2019am\\u00e9nagement du territoire des infrastructures et de l\\u2019entretien routier\\u00a0;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Honorable d\\u00e9put\\u00e9</em></strong> ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Messieurs les membres du Conseil National&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Chers confr\\u00e8res ing\\u00e9nieurs</em></strong><strong><em>&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Distingu\\u00e9s invit\\u00e9s</em></strong> ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Mesdames et&nbsp;</em></strong><strong><em>monsieur</em></strong><strong><em>,</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C'est avec un profond sentiment de gratitude et de fiert\\u00e9&nbsp;que&nbsp;je&nbsp;me tiens devant vous&nbsp;aujourd\\u2019hui, en cettepremi\\u00e8re&nbsp;Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale de l'Ordre des Ing\\u00e9nieurs du&nbsp;Congo, en sigle&nbsp;\\u00ab&nbsp;OIC&nbsp;\\u00bb.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je saisis cette opportunit\\u00e9 pour rendre&nbsp;hommage \\u00e0&nbsp;<strong>Son Excellence Monsieur Denis SASSOU N'GUESSO, Pr\\u00e9sident de la R\\u00e9publique et Chef de l'\\u00c9tat</strong>, pour avoir&nbsp;<strong>promulgu\\u00e9</strong><strong>&nbsp;le 22 f\\u00e9vrier 2023</strong><strong>&nbsp;les lois</strong>&nbsp;fondatrices de notre Ordre, connues sous le nom de&nbsp;<strong>lois AMBETO</strong>&nbsp;:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il s\\u2019agit de&nbsp;la loi&nbsp;portant cr\\u00e9ation et organisation de l\\u2019Ordre des ing\\u00e9nieurs du Congo&nbsp;en sigle \\u00ab&nbsp;OIC&nbsp;\\u00bb, et de la loi&nbsp;r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur en R\\u00e9publique du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>La&nbsp;promulgation&nbsp;de ces deux lois&nbsp;marque&nbsp;ainsi&nbsp;le couronnement d'un long processus entam\\u00e9 en&nbsp;<strong>2018,&nbsp;</strong>visant \\u00e0 structurer et r\\u00e9guler&nbsp;l\\u2019exercice&nbsp;de&nbsp;notre&nbsp;profession&nbsp;dans notre&nbsp;pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je tiens \\u00e9galement \\u00e0 exprimer ma sinc\\u00e8re gratitude \\u00e0 Son Excellence Monsieur le Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement du Territoire, des Infrastructures et de l'Entretien Routier, pour sa pr\\u00e9sence distingu\\u00e9e&nbsp;<a></a>parmi nous en d\\u00e9pit de ses obligations multiples.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong><em>Excellence Monsieur le Ministre d\\u2019\\u00e9tat</em></strong><strong><em>,</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Votre soutien et votre engagement envers notre cause sont des t\\u00e9moignages pr\\u00e9cieux de votre attachement au d\\u00e9veloppement de notre pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Mesdames et&nbsp;</strong><strong>Messieurs,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Permettez-moi aussi d'adresser mes salutations distingu\\u00e9es \\u00e0 toutes les personnalit\\u00e9s pr\\u00e9sentes ici aujourd'hui, ainsi qu'\\u00e0 tous nos invit\\u00e9s.&nbsp;&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Votre pr\\u00e9sence t\\u00e9moigne de l'int\\u00e9r\\u00eat que vous portez \\u00e0 l'\\u00e9mergence de notre Ordre et \\u00e0 son r\\u00f4le crucial dans le panorama&nbsp;des organisations&nbsp;professionnelles de notre pays.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Excellence Monsieur le Ministre d\\u2019\\u00e9tat, Ministre de l\\u2019am\\u00e9nagement du territoire des infrastructures et de l\\u2019entretien routier&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Honorable d\\u00e9put\\u00e9</em></strong><strong><em>&nbsp;;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong><em>Chers confr\\u00e8res&nbsp;</em></strong><strong><em>;</em></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mesdames et Messieurs</strong><strong>&nbsp;</strong>;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L'Ordre des Ing\\u00e9nieurs du Congo,&nbsp;en sigle&nbsp;\\u00ab&nbsp;OIC&nbsp;\\u00bb, se dresse d\\u00e9sormais&nbsp;comme le pilier institutionnel&nbsp;incontournable, garantissant l'implication organis\\u00e9e et effective des ing\\u00e9nieurs dans le processus de d\\u00e9veloppement de notre pays.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Nous devons nous rappeler que nul ne peut d\\u00e9sormais exercer la profession d'ing\\u00e9nieur au Congo sans \\u00eatre pr\\u00e9alablement inscrit au tableau de l'Ordre, tel que stipul\\u00e9 par&nbsp;<strong>l'article 20</strong>&nbsp;de la loi portant cr\\u00e9ation et organisation de l\\u2019ordre des ing\\u00e9nieurs du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 cet \\u00e9gard, je&nbsp;voudrais vous&nbsp;annoncer que la Commission charg\\u00e9e de l'examen des dossiers d'inscription&nbsp;au tableau de l\\u2019ordre apr\\u00e8s&nbsp;d\\u00e9lib\\u00e9ration&nbsp;sur&nbsp;139&nbsp;premiers dossiers re\\u00e7us&nbsp;a s\\u00e9lectionn\\u00e9&nbsp;72&nbsp;ing\\u00e9nieursdont les dossiers sont&nbsp;complets,&nbsp;pour figurer sur le premier tableau de l'Ordre des Ing\\u00e9nieurs du Congo.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Ainsi, chers confr\\u00e8res je&nbsp;vous prie de vous lever&nbsp;pour une reconnaissance solennelle.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Merci</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je profite de cette occasion pour&nbsp;lancer&nbsp;un&nbsp;vibrant&nbsp;appel \\u00e0 tous les ing\\u00e9nieurs&nbsp;de s\\u2019inscrire \\u00e0 l\\u2019ordre&nbsp;et de compl\\u00e9ter leur dossier&nbsp;conform\\u00e9ment \\u00e0 la loi pour l'organisation&nbsp;de notre profession.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers Confr\\u00e8res,</strong><strong>&nbsp;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Mesdames et Messieurs,</strong><strong>&nbsp;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Aujourd\\u2019hui, avec l'adoption de notre programme d'activit\\u00e9s et de notre budget annuel, nous nous engageons r\\u00e9solument dans l'action&nbsp;pour le&nbsp;d\\u00e9marrage effectif&nbsp;nos activit\\u00e9s.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Je vous exhorte donc \\u00e0 examiner attentivement les documents qui nous sont soumis \\u00e0 l'ordre du jour afin que nos d\\u00e9lib\\u00e9rations soient&nbsp;fructueuses.<br>Enfin, je vous souhaite plein succ\\u00e8s dans nos travaux et vous invite \\u00e0 s\\u2019investir pleinement dans les activit\\u00e9s de notre Ordre.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Que Dieu b\\u00e9nisse l'Ordre des Ing\\u00e9nieurs du Congo !<br>Vive le Congo&nbsp;!&nbsp;</strong><br><strong>Vive l'OIC !<br>Je vous remercie</strong>.</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	15	51	1	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »
14	2026-02-24 15:25:52.57426+00	\N	\N	{"pk": 16, "path": "00010003000A", "depth": 3, "numchild": 0, "translation_key": "c3bc92e9-d1b8-4100-83c9-e853881a8248", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "F\\u00e9d\\u00e9ration des Organisations Africaines d'Ing\\u00e9nierie", "draft_title": "F\\u00e9d\\u00e9ration des Organisations Africaines d'Ing\\u00e9nierie", "slug": "federation-des-organisations-africaines-dingenierie", "content_type": 51, "url_path": "/blog/federation-des-organisations-africaines-dingenierie/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-04-14", "body": "<!-- wp:paragraph -->\\n<p>La F\\u00e9d\\u00e9ration des Organisations Africaines d\\u2019Ing\\u00e9nierie a le plaisir de vous inviter \\u00e0 la deuxi\\u00e8me session de sa s\\u00e9rie de webinaires en six parties sur le th\\u00e8me : <strong>Faire progresser les normes d'ing\\u00e9nierie en Afrique : la voie vers l\\u2019adh\\u00e9sion \\u00e0 l\\u2019accr\\u00e9ditation internationale</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><a href=\\"https://t.co/0kUEFNCTxx\\">Veuillez vous inscrire ici</a>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:image {\\"lightbox\\":{\\"enabled\\":false},\\"id\\":736,\\"sizeSlug\\":\\"full\\",\\"linkDestination\\":\\"custom\\"} -->\\n<figure class=\\"wp-block-image size-full\\"><a href=\\"https://t.co/0kUEFNCTxx\\"><img src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/GoLKD7IWYAAYYHp.jpg\\" alt=\\"\\" class=\\"wp-image-736\\"/></a></figure>\\n<!-- /wp:image -->", "wagtail_admin_comments": []}	16	51	1	Fédération des Organisations Africaines d'Ingénierie
15	2026-02-24 15:25:52.610085+00	\N	\N	{"pk": 17, "path": "00010003000B", "depth": 3, "numchild": 0, "translation_key": "f316ed49-94ec-4cba-9501-e75734cb4916", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "draft_title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "slug": "remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo", "content_type": 51, "url_path": "/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-02-08", "body": "<!-- wp:video {\\"id\\":762} -->\\n<figure class=\\"wp-block-video\\"><video controls poster=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/IMG_3895.png\\" src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/04/VIDEO-2025-02-08-17-29-01.mp4\\" playsinline></video></figure>\\n<!-- /wp:video -->\\n\\n<!-- wp:paragraph -->\\n<p>En reprenant les paroles du Pr\\u00e9sident de l'Ordre - <strong>\\u00ab Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9 \\u00bb</strong> - le Ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux, a rappel\\u00e9 aux ing\\u00e9nieurs que ces mots r\\u00e9sonnent profond\\u00e9ment avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Pr\\u00e9sident de la R\\u00e9publique, Chef de l'Etat.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:video {\\"id\\":766} -->\\n<figure class=\\"wp-block-video\\"><video controls src=\\"https://oic.kerenes-digital.com/wp-content/uploads/2025/02/VIDEO-2025-02-08-17-29-00.mp4\\" playsinline></video></figure>\\n<!-- /wp:video -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019Honorable Blaise AMBETO, porteur des lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, a solennellement proclam\\u00e9 le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux, <strong>parrain de l\\u2019Ordre</strong>, lors de la remise officielle du tout premier tableau.</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	17	51	1	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
16	2026-02-24 15:25:52.646759+00	\N	\N	{"pk": 18, "path": "00010003000C", "depth": 3, "numchild": 0, "translation_key": "e693b89e-80d3-46e2-b735-6ae86983019a", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "draft_title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "slug": "ingenieur-bikouta", "content_type": 51, "url_path": "/blog/ingenieur-bikouta/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-04-28", "body": "<!-- wp:heading {\\"level\\":1,\\"style\\":{\\"elements\\":{\\"link\\":{\\"color\\":{\\"text\\":\\"var:preset|color|neve-link-hover-color\\"}}}},\\"textColor\\":\\"neve-link-hover-color\\"} -->\\n<h1 class=\\"wp-block-heading has-neve-link-hover-color-color has-text-color has-link-color\\">Un ing\\u00e9nieur, un impact</h1>\\n<!-- /wp:heading -->\\n\\n<!-- wp:themeisle-blocks/slider {\\"id\\":\\"wp-block-themeisle-blocks-slider-4fe76578\\",\\"perView\\":3,\\"height\\":\\"\\",\\"width\\":\\"\\",\\"transition\\":\\"ease-in\\"} -->\\n<div id=\\"wp-block-themeisle-blocks-slider-4fe76578\\" class=\\"wp-block-themeisle-blocks-slider glide\\" data-per-view=\\"3\\" data-gap=\\"0\\" data-peek=\\"0\\" data-autoplay=\\"true\\" data-height=\\"\\" data-hide-arrows=\\"false\\" data-transition=\\"ease-in\\"><div class=\\"glide__track\\" data-glide-el=\\"track\\"><div class=\\"glide__slides\\"><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.cg/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-28-at-11.43.38-1.jpeg\\" alt=\\"\\" title=\\"\\" data-id=\\"876\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.cg/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-28-at-11.43.39-1-2.jpeg\\" alt=\\"\\" title=\\"\\" data-id=\\"879\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.cg/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-28-at-11.43.39-2-1.jpeg\\" alt=\\"\\" title=\\"\\" data-id=\\"875\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.cg/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-28-at-11.43.39-3-1.jpeg\\" alt=\\"\\" title=\\"\\" data-id=\\"878\\"/></figure></div><div class=\\"wp-block-themeisle-blocks-slider-item-wrapper glide__slide\\" tabindex=\\"0\\"><figure><img class=\\"wp-block-themeisle-blocks-slider-item\\" src=\\"https://oic.cg/wp-content/uploads/2025/04/WhatsApp-Image-2025-04-28-at-11.43.39-4.jpeg\\" alt=\\"\\" title=\\"\\" data-id=\\"877\\"/></figure></div></div><div class=\\"glide__bullets\\" data-glide-el=\\"controls[nav]\\"><button class=\\"glide__bullet\\" data-glide-dir=\\"=0\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=1\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=2\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=3\\"></button><button class=\\"glide__bullet\\" data-glide-dir=\\"=4\\"></button></div></div></div>\\n<!-- /wp:themeisle-blocks/slider -->\\n\\n<!-- wp:heading {\\"className\\":\\"\\",\\"style\\":{\\"elements\\":{\\"link\\":{\\"color\\":{\\"text\\":\\"var:preset|color|neve-link-color\\"}}}},\\"textColor\\":\\"neve-link-color\\"} -->\\n<h2 class=\\"wp-block-heading has-neve-link-color-color has-text-color has-link-color\\">Un acteur cl\\u00e9 du d\\u00e9veloppement des projets MEP au Congo</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,&nbsp;<strong>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</strong>&nbsp;s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"className\\":\\"\\",\\"style\\":{\\"elements\\":{\\"link\\":{\\"color\\":{\\"text\\":\\"var:preset|color|neve-link-color\\"}}}},\\"textColor\\":\\"neve-link-color\\"} -->\\n<h2 class=\\"wp-block-heading has-neve-link-color-color has-text-color has-link-color\\">Ses missions</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Au c\\u0153ur de ses interventions :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list -->\\n<ul class=\\"wp-block-list\\"><!-- wp:list-item -->\\n<li>Le&nbsp;<strong>contr\\u00f4le technique</strong>&nbsp;des installations MEP</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>La&nbsp;<strong>conception et les \\u00e9tudes</strong>&nbsp;des syst\\u00e8mes de b\\u00e2timent</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>La&nbsp;<strong>coordination des \\u00e9quipes techniques</strong>&nbsp;sur le terrain</li>\\n<!-- /wp:list-item --></ul>\\n<!-- /wp:list -->\\n\\n<!-- wp:heading {\\"className\\":\\"\\",\\"style\\":{\\"elements\\":{\\"link\\":{\\"color\\":{\\"text\\":\\"var:preset|color|neve-link-color\\"}}}},\\"textColor\\":\\"neve-link-color\\"} -->\\n<h2 class=\\"wp-block-heading has-neve-link-color-color has-text-color has-link-color\\">Projets embl\\u00e9matiques</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p><strong>Sur le terrain, ses comp\\u00e9tences parlent d\\u2019elles-m\\u00eames :</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list -->\\n<ul class=\\"wp-block-list\\"><!-- wp:list-item -->\\n<li><strong>COTEXA CONGO - Projet PSTAT :</strong><br>Contr\\u00f4leur technique des lots MEP</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>COTEXA CONGO - R\\u00e9habilitation du si\\u00e8ge de la BDEAC :</strong><br>Contr\\u00f4leur technique des lots MEP</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>MBTP - Construction de la Tour ACACIA :</strong><br>Ing\\u00e9nieur-assistant des \\u00e9tudes MEP</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li><strong>DAE - Construction de la base BRALICO (proximit\\u00e9 a\\u00e9roport Maya-Maya, Brazzaville) :</strong><br>Responsable des \\u00e9tudes techniques MEP</li>\\n<!-- /wp:list-item --></ul>\\n<!-- /wp:list -->\\n\\n<!-- wp:heading {\\"className\\":\\"\\",\\"style\\":{\\"elements\\":{\\"link\\":{\\"color\\":{\\"text\\":\\"var:preset|color|neve-link-color\\"}}}},\\"textColor\\":\\"neve-link-color\\"} -->\\n<h2 class=\\"wp-block-heading has-neve-link-color-color has-text-color has-link-color\\">Une expertise au service de l\\u2019excellence</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph {\\"className\\":\\"\\"} -->\\n<p>Fort de son expertise, l\\u2019ing\\u00e9nieur BIKOUTA BIAHOUA place la qualit\\u00e9, l'innovation et la ma\\u00eetrise technique au centre de chacun de ses projets. Sa contribution renforce la dynamique de modernisation des infrastructures au Congo et inspire les nouvelles g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading {\\"style\\":{\\"elements\\":{\\"link\\":{\\"color\\":{\\"text\\":\\"var:preset|color|neve-link-color\\"}}}},\\"textColor\\":\\"neve-link-color\\"} -->\\n<h2 class=\\"wp-block-heading has-neve-link-color-color has-text-color has-link-color\\">Contactez-le</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>T\\u00e9l./WhatsApp : <a href=\\"tel:242069951028\\">+242 06 995 10 28</a> / <a href=\\"https://wa.me/242067033232\\">+242 06 703 32 32</a><br>Email : <a href=\\"mailto:dondedieubikouta@gmail.com\\">dondedieubikouta@gmail.com</a><br>LinkedIn : <a href=\\"https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161\\">https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161</a></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	18	51	1	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
17	2026-02-24 15:25:52.683657+00	\N	\N	{"pk": 19, "path": "00010003000D", "depth": 3, "numchild": 0, "translation_key": "090435a9-f0a8-46b5-a4bb-f5d9b4e59b65", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Regards d'ing\\u00e9nieurs", "draft_title": "Regards d'ing\\u00e9nieurs", "slug": "regards-dingenieurs", "content_type": 51, "url_path": "/blog/regards-dingenieurs/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-04-29", "body": "<!-- wp:paragraph -->\\n<p>Cette rubrique explore, d'un point de vue technique, les grands d\\u00e9fis auxquels nos villes sont confront\\u00e9es.<br>Nous donnons la parole aux ing\\u00e9nieurs pour analyser des probl\\u00e9matiques telles que :</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list -->\\n<ul class=\\"wp-block-list\\"><!-- wp:list-item -->\\n<li>L'ensablement des routes et des infrastructures ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>L\\u2019\\u00e9rosion des sols et ses cons\\u00e9quences sur l\\u2019urbanisation ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>Les inondations et les strat\\u00e9gies de gestion des eaux pluviales ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>L'approvisionnement en \\u00e9lectricit\\u00e9 et en eau potable ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>La pr\\u00e9sence de caniveaux \\u00e0 ciel ouvert et les solutions d'assainissement urbain ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>La maintenance des infrastructures et des \\u00e9quipements publics co\\u00fbteusement r\\u00e9alis\\u00e9s ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>La ma\\u00eetrise des co\\u00fbts de construction et de r\\u00e9habilitation ;</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>Les expertises d\\u2019expropriation et les \\u00e9valuations fonci\\u00e8res.</li>\\n<!-- /wp:list-item --></ul>\\n<!-- /wp:list -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 travers des analyses, des \\u00e9tudes de cas et des propositions concr\\u00e8tes, nous mettons en avant l\\u2019expertise technique n\\u00e9cessaire pour construire des villes plus r\\u00e9silientes et durables.</p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	19	51	1	Regards d'ingénieurs
18	2026-02-24 15:25:52.721029+00	\N	\N	{"pk": 20, "path": "00010003000E", "depth": 3, "numchild": 0, "translation_key": "b0076f5d-7464-47f2-8ddd-8ee96fc218da", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Campagne nationale de recensement et d\\u2019adh\\u00e9sion \\u00e0 l\\u2019OIC", "draft_title": "Campagne nationale de recensement et d\\u2019adh\\u00e9sion \\u00e0 l\\u2019OIC", "slug": "campagne-nationale-de-recensement-et-dadhesion-a-loic", "content_type": 51, "url_path": "/blog/campagne-nationale-de-recensement-et-dadhesion-a-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-05-10", "body": "<!-- wp:video {\\"id\\":1040} -->\\n<figure class=\\"wp-block-video\\"><video autoplay controls muted src=\\"https://oic.cg/wp-content/uploads/2025/05/SPOT-FINAL-OIC.mp4\\"></video></figure>\\n<!-- /wp:video -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Samedi 12 juillet 2025</strong> : lancement officiel \\u00e0 Brazzaville lors de la c\\u00e9l\\u00e9bration du 2\\u00e8me anniversaire de l\\u2019OIC, sous le haut patronage du ministre d\\u2019\\u00e9tat, ministre de l\\u2019am\\u00e9nagement du territoire et des grands travaux. </p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Juillet - Ao\\u00fbt - Septembre 2025 :</strong> phase de recensement. </p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	20	51	1	Campagne nationale de recensement et d’adhésion à l’OIC
19	2026-02-24 15:25:52.757781+00	\N	\N	{"pk": 21, "path": "00010003000F", "depth": 3, "numchild": 0, "translation_key": "c2235f9c-c802-4377-a68a-c95effbe7c8b", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "draft_title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "slug": "deuxieme-anniversaire-de-loic", "content_type": 51, "url_path": "/blog/deuxieme-anniversaire-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2025-07-12", "body": "<!-- wp:paragraph -->\\n<p><strong>MOT DU PRESIDENT DE L\\u2019ORDRE DES INGENIEURS DU CONGO (OIC), \\u00c0&nbsp;</strong><strong>L\\u2019OCCASION</strong><strong>DU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D\\u2019ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L\\u2019OIC</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><em>Brazzaville, le 12 juillet 2025</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Monsieur le</strong><strong>&nbsp;Directeur du cabinet du</strong><strong>&nbsp;Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Honorable D\\u00e9put\\u00e9 Blaise AMBETO ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Messieurs les repr\\u00e9sentants des&nbsp;</strong><strong>membres du Gouvernement ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>\\u2022&nbsp;</strong><strong>Monsieur le&nbsp;</strong><strong>Pr\\u00e9sident du C</strong><strong>onseil Municipal, D\\u00e9put\\u00e9-Maire de la Ville de Brazzaville</strong><strong>&nbsp;;</strong><strong></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mesdames et Messieurs les membres du Conseil national de l\\u2019OIC ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Chers confr\\u00e8res ing\\u00e9nieurs ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Distingu\\u00e9s invit\\u00e9s</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>En ce&nbsp;<strong>jour symbolique</strong>, marquant le&nbsp;<strong>deuxi\\u00e8me anniversaire</strong>de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, permettez-moi, au nom de l\\u2019ensemble des membres de l\\u2019OIC, et en mon nom propre, d\\u2019exprimer notre&nbsp;<strong>profonde gratitude</strong>&nbsp;pour votre pr\\u00e9sence \\u00e0 cette&nbsp;<strong>c\\u00e9r\\u00e9monie solennelle</strong>&nbsp;de&nbsp;<strong>lancement de la campagne nationale de recensement et d\\u2019adh\\u00e9sion</strong>&nbsp;des ing\\u00e9nieurs exer\\u00e7ant en R\\u00e9publique du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Souvenons-nous&nbsp;;&nbsp;&nbsp;<br>Le&nbsp;<strong>28 f\\u00e9vrier dernier</strong>, dans cette m\\u00eame salle, nous proc\\u00e9dions \\u00e0 la&nbsp;<strong>publication du tout premier tableau officiel</strong>&nbsp;des ing\\u00e9nieurs inscrits \\u00e0 l\\u2019OIC, suivie d\\u2019une&nbsp;<strong>c\\u00e9r\\u00e9monie historique de prestation de serment</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Ce moment&nbsp;<strong>charg\\u00e9 d\\u2019\\u00e9motion et de responsabilit\\u00e9</strong>&nbsp;restera, pour nous,&nbsp;un&nbsp;<strong>jalon fondateur</strong>&nbsp;dans l\\u2019histoire de notre profession.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019Ordre des Ing\\u00e9nieurs du Congo est une institution&nbsp;<strong>jeune</strong>,<br>mais&nbsp;<strong>r\\u00e9solument tourn\\u00e9e vers l\\u2019avenir</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 ce jour,&nbsp;<strong>154 ing\\u00e9nieurs</strong>&nbsp;ont \\u00e9t\\u00e9 officiellement enregistr\\u00e9s.<br>Ce chiffre, bien qu\\u2019<strong>encourageant</strong>, reste&nbsp;<strong>nettement en dessous du potentiel national</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il r\\u00e9v\\u00e8le surtout que la&nbsp;<strong>majorit\\u00e9 des ing\\u00e9nieurs en activit\\u00e9</strong>op\\u00e8rent encore&nbsp;<strong>en dehors du cadre l\\u00e9gal</strong>. Ceci, tant\\u00f4t&nbsp;<strong>par ignorance</strong>,&nbsp;tant\\u00f4t&nbsp;<strong>par n\\u00e9gligence</strong>, et&nbsp;tant\\u00f4t&nbsp;m\\u00eame&nbsp;<strong>en d\\u00e9fi de la loi</strong>&nbsp;portant cr\\u00e9ation de notre Ordre.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Face \\u00e0 cette r\\u00e9alit\\u00e9, le Conseil national a d\\u00e9cid\\u00e9 de lancer une&nbsp;<strong>vaste campagne nationale de recensement et d\\u2019adh\\u00e9sion</strong>,&nbsp;afin d\\u2019<strong>\\u00e9largir</strong>&nbsp;et de&nbsp;<strong>renforcer</strong>&nbsp;notre communaut\\u00e9&nbsp;professionnelle.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Les objectifs de cette campagne sont&nbsp;</strong><strong>les&nbsp;</strong><strong>suivantes :</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>1.&nbsp;</strong><strong>Faire appliquer les lois existantes</strong>, en incitant tous les ing\\u00e9nieurs \\u00e0 s\\u2019inscrire sans d\\u00e9lai \\u00e0 l\\u2019OIC ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>2.&nbsp;</strong><strong>Constituer une ba</strong><strong>se</strong><strong>&nbsp;de donn\\u00e9es nationale fiable</strong>&nbsp;des ing\\u00e9nieurs en exercice en R\\u00e9publique du Congo ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>3.&nbsp;</strong><strong>Renforcer la gouvernance technique de l\\u2019\\u00c9tat</strong>, en assurant une meilleure r\\u00e9gulation de la profession ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>4.&nbsp;</strong><strong>Lutter contre la prolif\\u00e9ration des faux dipl\\u00f4mes</strong>, qui ternissent l\\u2019image de&nbsp;notre profession.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 l\\u2019issue de cette campagne,&nbsp;nous visons&nbsp;<strong>au moins 300 nouvelles adh\\u00e9sions</strong>&nbsp;pour franchir un cap d\\u00e9cisif dans la&nbsp;<strong>structuration de l\\u2019ing\\u00e9nierie congolaise</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Monsieur le</strong><strong>&nbsp;Directeur du cabinet du</strong><strong>&nbsp;Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux</strong><strong>,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mes</strong><strong>dames et Messieurs</strong><strong>,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>En promulguant les lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo,&nbsp;<strong>Son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique&nbsp;</strong>a dot\\u00e9 notre pays d\\u2019instruments juridiques n\\u00e9cessaires \\u00e0 l\\u2019organisation et \\u00e0 la structuration du secteur de l\\u2019ing\\u00e9nierie. Ces lois ouvrent des perspectives concr\\u00e8tes aux jeunes ing\\u00e9nieurs, en leur permettant&nbsp;de cr\\u00e9er leurs propres soci\\u00e9t\\u00e9s.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 l\\u2019heure o\\u00f9 notre pays est confront\\u00e9 \\u00e0 des d\\u00e9fis majeurs dans des secteurs strat\\u00e9giques tels que le&nbsp;b\\u00e2timent et les travaux publics&nbsp;; les mines et l\\u2019\\u00e9nergie&nbsp;; les eaux et for\\u00eats&nbsp;;&nbsp;l\\u2019agriculture et l\\u2019environnement, il est imp\\u00e9ratif que l\\u2019ing\\u00e9nieur&nbsp;<strong>occupe pleinement sa place dans toutes ces sph\\u00e8res d\\u2019activit\\u00e9s</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est dans cette dynamique que nous&nbsp;pourrons affirmer&nbsp;avec conviction&nbsp;que<strong>&nbsp;l\\u2019ing\\u00e9nieur</strong><strong>&nbsp;</strong><strong>est</strong><strong>&nbsp;v\\u00e9ritablement au c\\u0153ur du d\\u00e9veloppement du Congo.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il est donc essentiel que l\\u2019\\u00c9tat mette en \\u0153uvre les outils juridiques d\\u00e9j\\u00e0 disponibles pour permettre \\u00e0 l\\u2019Ordre des Ing\\u00e9nieurs du Congo de mieux organiser, encadrer et professionnaliser l\\u2019ing\\u00e9nierie nationale. Car c\\u2019est par la&nbsp;<strong>qualit\\u00e9, la s\\u00e9curit\\u00e9 et la durabilit\\u00e9</strong>&nbsp;des ouvrages publics et priv\\u00e9s que nous pourrons r\\u00e9pondre efficacement aux besoins de la population et garantir un d\\u00e9veloppement harmonieux.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Notre souhait est que l\\u2019ing\\u00e9nieur inscrit \\u00e0 l\\u2019Ordre devienne&nbsp;<strong>le r\\u00e9f\\u00e9rent naturel des missions techniques d</strong><strong>e l\\u2019\\u00e9tat</strong>&nbsp;et que les entreprises \\u00e9trang\\u00e8res op\\u00e9rant sur notre territoire se conforment \\u00e0 la loi en d\\u00e9clarant leurs ing\\u00e9nieurs aupr\\u00e8s de l\\u2019OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res ing\\u00e9nieurs,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019adh\\u00e9sion \\u00e0 l\\u2019Ordre est \\u00e0 la fois une&nbsp;<strong>obligation l\\u00e9gale</strong>&nbsp;et un&nbsp;<strong>devoir moral</strong><strong>,&nbsp;</strong>en vue&nbsp;d\\u2019en finir avec:&nbsp;<strong>l</strong><strong>\\u2019exercice ill\\u00e9gal de la profession</strong>,&nbsp;<strong>l</strong><strong>es faux dipl\\u00f4mes</strong>,&nbsp;et aussi&nbsp;<strong>l</strong><strong>\\u2019imposture technocratique</strong>,&nbsp;cette d\\u00e9rive qui donne \\u00e0 certains une&nbsp;<strong>l\\u00e9gitimit\\u00e9 sans comp\\u00e9tence</strong><strong>&nbsp;av\\u00e9r\\u00e9e</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Cette campagne,&nbsp;c\\u2019est aussi l\\u2019occasion&nbsp;d\\u2019<strong>informer</strong>, de&nbsp;<strong>sensibiliser</strong>&nbsp;et de&nbsp;<strong>convaincre</strong>&nbsp;tous les ing\\u00e9nieurs, m\\u00eame ceux qui pensent, \\u00e0 tort,&nbsp;<strong>ne pas \\u00eatre concern\\u00e9s</strong>.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Une fois&nbsp;cette phase termin\\u00e9e, nous passerons \\u00e0&nbsp;<strong>l\\u2019application&nbsp;</strong>des&nbsp;<strong>lois et r\\u00e8glements en vigueur</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Alors,&nbsp;<br><strong>mobilisons-nous</strong>,<br><strong>engageons-nous</strong>,<br><strong>recensons-nous</strong>,<br><strong>enfin,&nbsp;</strong><strong>adh\\u00e9rons tous</strong><strong>&nbsp;\\u00e0 l\\u2019OIC</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Avant de clore mon propos,&nbsp;je tiens \\u00e0 remercier tr\\u00e8s sinc\\u00e8rement les institutions, les personnes et partenaires qui ont contribu\\u00e9 \\u00e0 l\\u2019organisation de cette campagne nationaleparmi lesquelles&nbsp;<strong>le Ministre d\\u2019Etat Jean Jacques BOUYA et l\\u2019honorable Blaise AMBETO</strong><strong>.&nbsp;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><a></a><strong>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</strong><br><strong>Vive&nbsp;</strong><strong>l\\u2019OIC&nbsp;</strong><strong>!</strong><br><strong>Vive la R\\u00e9publique du</strong><strong>&nbsp;Congo</strong><strong>, notre ch\\u00e8re patrie</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je vous remercie.</strong></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	21	51	1	Deuxième anniversaire de l’OIC
20	2026-02-24 15:25:52.794273+00	\N	\N	{"pk": 22, "path": "00010003000G", "depth": 3, "numchild": 0, "translation_key": "2848f8b3-5c7b-4853-88b1-4f35766ebc79", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Activit\\u00e9s du mois de janvier 2026", "draft_title": "Activit\\u00e9s du mois de janvier 2026", "slug": "rappel-des-activites-de-ce-mois-de-janvier-2026", "content_type": 51, "url_path": "/blog/rappel-des-activites-de-ce-mois-de-janvier-2026/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "date": "2026-01-07", "body": "<!-- wp:list -->\\n<ul class=\\"wp-block-list\\"><!-- wp:list-item -->\\n<li>10 janvier 2026 : R\\u00e9union du bureau ex\\u00e9cutif lieu si\\u00e8ge, heure 9 heures pr\\u00e9cises.</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>17 janvier 2026 : R\\u00e9union du Conseil</li>\\n<!-- /wp:list-item -->\\n\\n<!-- wp:list-item -->\\n<li>\\u206031 janvier 2026 : Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire</li>\\n<!-- /wp:list-item --></ul>\\n<!-- /wp:list -->", "wagtail_admin_comments": []}	22	51	1	Activités du mois de janvier 2026
21	2026-02-24 15:34:23.081193+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 0, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "wagtail_admin_comments": []}	23	49	1	Accueil
22	2026-02-25 10:31:08.263502+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 1, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 21, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-02-24T15:34:23.099Z", "live_revision": 21, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:34:23.081Z", "alias_of": null, "wagtail_admin_comments": []}	23	49	1	Accueil
23	2026-02-25 11:49:04.773779+00	\N	1	{"pk": 24, "path": "000100040002", "depth": 3, "numchild": 0, "translation_key": "abb15562-5e6c-46a2-8e1f-606951cb74ac", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Membres du bureau ex\\u00e9cutif", "draft_title": "Membres du bureau ex\\u00e9cutif", "slug": "membres-du-bureau-ex\\u00e9cutif", "content_type": 57, "url_path": "/accueil/membres-du-bureau-ex\\u00e9cutif/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 1, "sort_order": 0, "page": 24, "section": 1, "members": [{"pk": 1, "sort_order": 0, "parent": 1, "member": 1}]}]}	24	57	1	Membres du bureau exécutif
24	2026-02-25 12:03:07.072447+00	\N	1	{"pk": 24, "path": "000100040002", "depth": 3, "numchild": 0, "translation_key": "abb15562-5e6c-46a2-8e1f-606951cb74ac", "locale": 1, "latest_revision": 23, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T11:49:04.793Z", "last_published_at": "2026-02-25T11:49:04.793Z", "live_revision": 23, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Membres du bureau ex\\u00e9cutif", "draft_title": "Membres du bureau ex\\u00e9cutif", "slug": "membres-du-bureau-ex\\u00e9cutif", "content_type": 57, "url_path": "/accueil/membres-du-bureau-ex\\u00e9cutif/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T11:49:04.773Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 1, "sort_order": 0, "page": 24, "section": 1, "members": [{"pk": 1, "sort_order": 0, "parent": 1, "member": 1}]}, {"pk": null, "sort_order": 1, "page": 24, "section": 1, "members": [{"pk": null, "sort_order": 0, "parent": null, "member": 2}, {"pk": null, "sort_order": 1, "parent": null, "member": 3}]}]}	24	57	1	Membres du bureau exécutif
25	2026-02-25 12:10:51.555411+00	\N	1	{"pk": 24, "path": "000100040002", "depth": 3, "numchild": 0, "translation_key": "abb15562-5e6c-46a2-8e1f-606951cb74ac", "locale": 1, "latest_revision": 24, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T11:49:04.793Z", "last_published_at": "2026-02-25T12:03:07.099Z", "live_revision": 24, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Membres du bureau ex\\u00e9cutif", "draft_title": "Membres du bureau ex\\u00e9cutif", "slug": "membres-du-bureau-ex\\u00e9cutif", "content_type": 57, "url_path": "/accueil/membres-du-bureau-ex\\u00e9cutif/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T12:03:07.072Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 1, "sort_order": 0, "page": 24, "section": 1, "members": [{"pk": 1, "sort_order": 0, "parent": 1, "member": 1}]}, {"pk": 2, "sort_order": 1, "page": 24, "section": 1, "members": [{"pk": 2, "sort_order": 0, "parent": 2, "member": 2}, {"pk": 3, "sort_order": 1, "parent": 2, "member": 3}, {"pk": null, "sort_order": 2, "parent": 2, "member": 4}, {"pk": null, "sort_order": 3, "parent": 2, "member": 5}]}]}	24	57	1	Membres du bureau exécutif
26	2026-02-25 12:33:42.905606+00	\N	1	{"pk": 25, "path": "000100040003", "depth": 3, "numchild": 0, "translation_key": "b2e1ff78-f7b2-475e-a154-17eff9b5d3ea", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale", "slug": "assembl\\u00e9e-g\\u00e9n\\u00e9rale", "content_type": 58, "url_path": "/accueil/assembl\\u00e9e-g\\u00e9n\\u00e9rale/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "hero_image": null, "hero_alt": "", "show_toc": true, "intro": "<p data-block-key=\\"uindk\\">L\\u2019assembl\\u00e9e g\\u00e9n\\u00e9rale regroupe l\\u2019ensemble des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre. Elle est l\\u2019instance supr\\u00eame de l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</p><p data-block-key=\\"1ljhg\\">Elle est charg\\u00e9e notamment de :</p><ul><li data-block-key=\\"393oc\\">proc\\u00e9der \\u00e0 l\\u2019\\u00e9lection des membres du conseil national de l\\u2019Ordre ;</li><li data-block-key=\\"8abbp\\">adopter les rapports du conseil national de l\\u2019Ordre ;</li><li data-block-key=\\"9bkiq\\">approuver les comptes de gestion et les comptes administratifs du conseil national de l\\u2019Ordre de l\\u2019ann\\u00e9e \\u00e9coul\\u00e9e ;</li><li data-block-key=\\"fe3oq\\">adopter les projets de d\\u00e9lib\\u00e9rations et de recommandations du conseil national de l\\u2019Ordre ;</li><li data-block-key=\\"40pii\\">approuver les d\\u00e9cisions d\\u2019acceptation ou de refus d\\u2019inscription au tableau de l\\u2019Ordre des nouveaux membres ;</li><li data-block-key=\\"3osp\\">voter le budget de l\\u2019Ordre ;</li><li data-block-key=\\"21ir0\\">adopter le r\\u00e8glement int\\u00e9rieur de l\\u2019Ordre ;</li><li data-block-key=\\"4p1d4\\">fixer les montants des cotisations ;</li><li data-block-key=\\"cdch\\">approuver les orientations de la politique de l\\u2019Ordre.</li></ul>", "body": "[]", "wagtail_admin_comments": []}	25	58	1	Assemblée générale
27	2026-02-25 12:40:26.465454+00	\N	1	{"pk": 26, "path": "000100040004", "depth": 3, "numchild": 0, "translation_key": "15e02717-4eef-4067-adaf-124ca8c48410", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Conseil national", "draft_title": "Conseil national", "slug": "conseil-national", "content_type": 57, "url_path": "/accueil/conseil-national/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 3, "sort_order": 0, "page": 26, "section": 1, "members": [{"pk": 6, "sort_order": 0, "parent": 3, "member": 1}]}, {"pk": 4, "sort_order": 1, "page": 26, "section": 1, "members": []}]}	26	57	1	Conseil national
28	2026-02-25 12:48:49.91361+00	\N	1	{"pk": 26, "path": "000100040004", "depth": 3, "numchild": 0, "translation_key": "15e02717-4eef-4067-adaf-124ca8c48410", "locale": 1, "latest_revision": 27, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T12:40:26.483Z", "last_published_at": "2026-02-25T12:40:26.483Z", "live_revision": 27, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Conseil national", "draft_title": "Conseil national", "slug": "conseil-national", "content_type": 57, "url_path": "/accueil/conseil-national/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T12:40:26.465Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 3, "sort_order": 0, "page": 26, "section": 1, "members": [{"pk": 6, "sort_order": 0, "parent": 3, "member": 1}]}, {"pk": 4, "sort_order": 1, "page": 26, "section": 1, "members": [{"pk": null, "sort_order": 0, "parent": 4, "member": 2}, {"pk": null, "sort_order": 1, "parent": 4, "member": 3}, {"pk": null, "sort_order": 2, "parent": 4, "member": 4}, {"pk": null, "sort_order": 3, "parent": 4, "member": 5}, {"pk": null, "sort_order": 4, "parent": 4, "member": 6}, {"pk": null, "sort_order": 5, "parent": 4, "member": 7}, {"pk": null, "sort_order": 6, "parent": 4, "member": 8}, {"pk": null, "sort_order": 7, "parent": 4, "member": 9}, {"pk": null, "sort_order": 8, "parent": 4, "member": 10}, {"pk": null, "sort_order": 9, "parent": 4, "member": 11}]}]}	26	57	1	Conseil national
29	2026-02-25 12:53:01.285727+00	\N	1	{"pk": 26, "path": "000100040004", "depth": 3, "numchild": 0, "translation_key": "15e02717-4eef-4067-adaf-124ca8c48410", "locale": 1, "latest_revision": 28, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T12:40:26.483Z", "last_published_at": "2026-02-25T12:48:49.940Z", "live_revision": 28, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Conseil national", "draft_title": "Conseil national", "slug": "conseil-national", "content_type": 57, "url_path": "/accueil/conseil-national/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T12:48:49.913Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 3, "sort_order": 0, "page": 26, "section": 1, "members": [{"pk": 6, "sort_order": 0, "parent": 3, "member": 1}]}, {"pk": 4, "sort_order": 1, "page": 26, "section": 1, "members": [{"pk": 15, "sort_order": 0, "parent": 4, "member": 10}, {"pk": 9, "sort_order": 1, "parent": 4, "member": 4}, {"pk": 16, "sort_order": 2, "parent": 4, "member": 11}, {"pk": 14, "sort_order": 3, "parent": 4, "member": 9}, {"pk": 8, "sort_order": 4, "parent": 4, "member": 3}, {"pk": 13, "sort_order": 5, "parent": 4, "member": 8}, {"pk": 7, "sort_order": 6, "parent": 4, "member": 2}, {"pk": 11, "sort_order": 7, "parent": 4, "member": 6}, {"pk": 10, "sort_order": 8, "parent": 4, "member": 5}, {"pk": 12, "sort_order": 9, "parent": 4, "member": 7}]}]}	26	57	1	Conseil national
30	2026-02-25 13:21:16.935849+00	\N	1	{"pk": 27, "path": "000100040005", "depth": 3, "numchild": 0, "translation_key": "d805eb5b-65f6-412f-ac22-beb3de924c20", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Textes fondamentaux", "draft_title": "Textes fondamentaux", "slug": "textes-fondamentaux", "content_type": 61, "url_path": "/accueil/textes-fondamentaux/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "intro": "", "wagtail_admin_comments": [], "items": [{"pk": 1, "sort_order": 0, "page": 27, "title": "Loi n\\u00b0 2-2023 r\\u00e9gissant la profession de l'ing\\u00e9nieur au Congo", "category": 2, "document": 1, "updated_at": "2026-02-25", "download_count": 0}]}	27	61	1	Textes fondamentaux
31	2026-02-25 13:28:42.007552+00	\N	1	{"pk": 27, "path": "000100040005", "depth": 3, "numchild": 0, "translation_key": "d805eb5b-65f6-412f-ac22-beb3de924c20", "locale": 1, "latest_revision": 30, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T13:21:16.952Z", "last_published_at": "2026-02-25T13:21:16.952Z", "live_revision": 30, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Textes fondamentaux", "draft_title": "Textes fondamentaux", "slug": "textes-fondamentaux", "content_type": 61, "url_path": "/accueil/textes-fondamentaux/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T13:21:16.935Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "items": [{"pk": 1, "sort_order": 0, "page": 27, "title": "Loi n\\u00b0 2-2023 r\\u00e9gissant la profession de l'ing\\u00e9nieur au Congo", "category": 2, "document": 1, "updated_at": "2026-02-25", "download_count": 1}, {"pk": null, "sort_order": 1, "page": 27, "title": "Loi n\\u00ba 3-2023 du 22 f\\u00e9vrier 2023 portant cr\\u00e9ation de l'ordre des ing\\u00e9nieurs du Congo", "category": null, "document": 2, "updated_at": "2026-02-25", "download_count": 0}]}	27	61	1	Textes fondamentaux
32	2026-02-25 13:28:54.531394+00	\N	1	{"pk": 27, "path": "000100040005", "depth": 3, "numchild": 0, "translation_key": "d805eb5b-65f6-412f-ac22-beb3de924c20", "locale": 1, "latest_revision": 31, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T13:21:16.952Z", "last_published_at": "2026-02-25T13:28:42.025Z", "live_revision": 31, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Textes fondamentaux", "draft_title": "Textes fondamentaux", "slug": "textes-fondamentaux", "content_type": 61, "url_path": "/accueil/textes-fondamentaux/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T13:28:42.007Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "items": [{"pk": 1, "sort_order": 0, "page": 27, "title": "Loi n\\u00b0 2-2023 r\\u00e9gissant la profession de l'ing\\u00e9nieur au Congo", "category": 2, "document": 1, "updated_at": "2026-02-25", "download_count": 1}, {"pk": 2, "sort_order": 1, "page": 27, "title": "Loi n\\u00ba 3-2023 du 22 f\\u00e9vrier 2023 portant cr\\u00e9ation de l'ordre des ing\\u00e9nieurs du Congo", "category": 2, "document": 2, "updated_at": "2026-02-25", "download_count": 0}]}	27	61	1	Textes fondamentaux
33	2026-02-25 13:30:47.979665+00	\N	1	{"pk": 27, "path": "000100040005", "depth": 3, "numchild": 0, "translation_key": "d805eb5b-65f6-412f-ac22-beb3de924c20", "locale": 1, "latest_revision": 32, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T13:21:16.952Z", "last_published_at": "2026-02-25T13:28:54.554Z", "live_revision": 32, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Textes fondamentaux", "draft_title": "Textes fondamentaux", "slug": "textes-fondamentaux", "content_type": 61, "url_path": "/accueil/textes-fondamentaux/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T13:28:54.531Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "items": [{"pk": 1, "sort_order": 0, "page": 27, "title": "Loi n\\u00b0 2-2023 r\\u00e9gissant la profession de l'ing\\u00e9nieur au Congo", "category": 2, "document": 1, "updated_at": "2026-02-25", "download_count": 1}, {"pk": 2, "sort_order": 1, "page": 27, "title": "Loi n\\u00ba 3-2023 du 22 f\\u00e9vrier 2023 portant cr\\u00e9ation de l'ordre des ing\\u00e9nieurs du Congo", "category": 2, "document": 2, "updated_at": "2026-02-25", "download_count": 0}, {"pk": null, "sort_order": 2, "page": 27, "title": "R\\u00e8glement int\\u00e9rieur de l'OIC", "category": 2, "document": 3, "updated_at": "2026-02-25", "download_count": 0}]}	27	61	1	Textes fondamentaux
34	2026-02-25 13:33:18.207973+00	\N	1	{"pk": 27, "path": "000100040005", "depth": 3, "numchild": 0, "translation_key": "d805eb5b-65f6-412f-ac22-beb3de924c20", "locale": 1, "latest_revision": 33, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T13:21:16.952Z", "last_published_at": "2026-02-25T13:30:48.001Z", "live_revision": 33, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Textes fondamentaux", "draft_title": "Textes fondamentaux", "slug": "textes-fondamentaux", "content_type": 61, "url_path": "/accueil/textes-fondamentaux/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T13:30:47.979Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "items": [{"pk": 1, "sort_order": 0, "page": 27, "title": "Loi n\\u00b0 2-2023 r\\u00e9gissant la profession de l'ing\\u00e9nieur au Congo", "category": 2, "document": 1, "updated_at": "2026-02-25", "download_count": 1}, {"pk": 2, "sort_order": 1, "page": 27, "title": "Loi n\\u00ba 3-2023 du 22 f\\u00e9vrier 2023 portant cr\\u00e9ation de l'ordre des ing\\u00e9nieurs du Congo", "category": 2, "document": 2, "updated_at": "2026-02-25", "download_count": 0}, {"pk": 3, "sort_order": 2, "page": 27, "title": "R\\u00e8glement int\\u00e9rieur de l'OIC", "category": 2, "document": 3, "updated_at": "2026-02-25", "download_count": 0}, {"pk": null, "sort_order": 3, "page": 27, "title": "Liste des ing\\u00e9nieurs inscrits au tableau de l\\u2019ordre pour 2025", "category": null, "document": 4, "updated_at": "2026-02-25", "download_count": 0}]}	27	61	1	Textes fondamentaux
35	2026-02-25 13:34:29.68016+00	\N	1	{"pk": 27, "path": "000100040005", "depth": 3, "numchild": 0, "translation_key": "d805eb5b-65f6-412f-ac22-beb3de924c20", "locale": 1, "latest_revision": 34, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T13:21:16.952Z", "last_published_at": "2026-02-25T13:33:18.231Z", "live_revision": 34, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Textes fondamentaux", "draft_title": "Textes fondamentaux", "slug": "textes-fondamentaux", "content_type": 61, "url_path": "/accueil/textes-fondamentaux/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T13:33:18.207Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "items": [{"pk": 1, "sort_order": 0, "page": 27, "title": "Loi n\\u00b0 2-2023 r\\u00e9gissant la profession de l'ing\\u00e9nieur au Congo", "category": 2, "document": 1, "updated_at": "2026-02-25", "download_count": 1}, {"pk": 2, "sort_order": 1, "page": 27, "title": "Loi n\\u00ba 3-2023 du 22 f\\u00e9vrier 2023 portant cr\\u00e9ation de l'ordre des ing\\u00e9nieurs du Congo", "category": 2, "document": 2, "updated_at": "2026-02-25", "download_count": 0}, {"pk": 3, "sort_order": 2, "page": 27, "title": "R\\u00e8glement int\\u00e9rieur de l'OIC", "category": 2, "document": 3, "updated_at": "2026-02-25", "download_count": 0}, {"pk": 4, "sort_order": 3, "page": 27, "title": "Liste des ing\\u00e9nieurs inscrits au tableau de l\\u2019ordre pour 2025", "category": null, "document": 4, "updated_at": "2026-02-25", "download_count": 0}, {"pk": null, "sort_order": 4, "page": 27, "title": "D\\u00e9lib\\u00e9ration fixant les cotisations annuelles", "category": null, "document": 5, "updated_at": "2026-02-25", "download_count": 0}]}	27	61	1	Textes fondamentaux
36	2026-02-28 09:06:26.591968+00	\N	1	{"pk": 22, "path": "000100040001000G", "depth": 4, "numchild": 0, "translation_key": "2848f8b3-5c7b-4853-88b1-4f35766ebc79", "locale": 1, "latest_revision": 20, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.803Z", "last_published_at": "2026-02-24T15:25:52.803Z", "live_revision": 20, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Activit\\u00e9s du mois de janvier 2026", "draft_title": "Activit\\u00e9s du mois de janvier 2026", "slug": "rappel-des-activites-de-ce-mois-de-janvier-2026", "content_type": 51, "url_path": "/accueil/blog/rappel-des-activites-de-ce-mois-de-janvier-2026/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.794Z", "alias_of": null, "date": "2026-01-07", "intro": "ssss", "image": null, "body": "<ul><li data-block-key=\\"5lv7c\\">10 janvier 2026 : R\\u00e9union du bureau ex\\u00e9cutif lieu si\\u00e8ge, heure 9 heures pr\\u00e9cises.</li><li data-block-key=\\"zogky\\">17 janvier 2026 : R\\u00e9union du Conseil</li><li data-block-key=\\"3gcag\\">\\u206031 janvier 2026 : Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire</li></ul>", "wagtail_admin_comments": []}	22	51	1	Activités du mois de janvier 2026
37	2026-02-28 09:07:14.340038+00	\N	1	{"pk": 22, "path": "000100040001000G", "depth": 4, "numchild": 0, "translation_key": "2848f8b3-5c7b-4853-88b1-4f35766ebc79", "locale": 1, "latest_revision": 36, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.803Z", "last_published_at": "2026-02-28T09:06:26.642Z", "live_revision": 36, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Activit\\u00e9s du mois de janvier 2026", "draft_title": "Activit\\u00e9s du mois de janvier 2026", "slug": "rappel-des-activites-de-ce-mois-de-janvier-2026", "content_type": 51, "url_path": "/accueil/blog/rappel-des-activites-de-ce-mois-de-janvier-2026/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:06:26.591Z", "alias_of": null, "date": "2026-01-07", "intro": "10 janvier 2026 : R\\u00e9union du bureau ex\\u00e9cutif lieu si\\u00e8ge, heure 9 heures pr\\u00e9cises. 17 janvier 2026 : R\\u00e9union du Conseil \\u206031 janvier 2026 : Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire", "image": null, "body": "<ul><li data-block-key=\\"5lv7c\\">10 janvier 2026 : R\\u00e9union du bureau ex\\u00e9cutif lieu si\\u00e8ge, heure 9 heures pr\\u00e9cises.</li><li data-block-key=\\"zogky\\">17 janvier 2026 : R\\u00e9union du Conseil</li><li data-block-key=\\"3gcag\\">\\u206031 janvier 2026 : Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire</li></ul>", "wagtail_admin_comments": []}	22	51	1	Activités du mois de janvier 2026
38	2026-02-28 09:13:28.346494+00	\N	\N	{"pk": 21, "path": "000100040001000F", "depth": 4, "numchild": 0, "translation_key": "c2235f9c-c802-4377-a68a-c95effbe7c8b", "locale": 1, "latest_revision": 19, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.767Z", "last_published_at": "2026-02-24T15:25:52.767Z", "live_revision": 19, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "draft_title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "slug": "deuxieme-anniversaire-de-loic", "content_type": 51, "url_path": "/accueil/blog/deuxieme-anniversaire-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.757Z", "alias_of": null, "date": "2025-07-12", "intro": "", "image": null, "body": "<!-- wp:paragraph -->\\n<p><strong>MOT DU PRESIDENT DE L\\u2019ORDRE DES INGENIEURS DU CONGO (OIC), \\u00c0&nbsp;</strong><strong>L\\u2019OCCASION</strong><strong>DU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D\\u2019ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L\\u2019OIC</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><em>Brazzaville, le 12 juillet 2025</em></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Monsieur le</strong><strong>&nbsp;Directeur du cabinet du</strong><strong>&nbsp;Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Honorable D\\u00e9put\\u00e9 Blaise AMBETO ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Messieurs les repr\\u00e9sentants des&nbsp;</strong><strong>membres du Gouvernement ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>\\u2022&nbsp;</strong><strong>Monsieur le&nbsp;</strong><strong>Pr\\u00e9sident du C</strong><strong>onseil Municipal, D\\u00e9put\\u00e9-Maire de la Ville de Brazzaville</strong><strong>&nbsp;;</strong><strong></strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mesdames et Messieurs les membres du Conseil national de l\\u2019OIC ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Chers confr\\u00e8res ing\\u00e9nieurs ;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Distingu\\u00e9s invit\\u00e9s</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>En ce&nbsp;<strong>jour symbolique</strong>, marquant le&nbsp;<strong>deuxi\\u00e8me anniversaire</strong>de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, permettez-moi, au nom de l\\u2019ensemble des membres de l\\u2019OIC, et en mon nom propre, d\\u2019exprimer notre&nbsp;<strong>profonde gratitude</strong>&nbsp;pour votre pr\\u00e9sence \\u00e0 cette&nbsp;<strong>c\\u00e9r\\u00e9monie solennelle</strong>&nbsp;de&nbsp;<strong>lancement de la campagne nationale de recensement et d\\u2019adh\\u00e9sion</strong>&nbsp;des ing\\u00e9nieurs exer\\u00e7ant en R\\u00e9publique du Congo.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Souvenons-nous&nbsp;;&nbsp;&nbsp;<br>Le&nbsp;<strong>28 f\\u00e9vrier dernier</strong>, dans cette m\\u00eame salle, nous proc\\u00e9dions \\u00e0 la&nbsp;<strong>publication du tout premier tableau officiel</strong>&nbsp;des ing\\u00e9nieurs inscrits \\u00e0 l\\u2019OIC, suivie d\\u2019une&nbsp;<strong>c\\u00e9r\\u00e9monie historique de prestation de serment</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Ce moment&nbsp;<strong>charg\\u00e9 d\\u2019\\u00e9motion et de responsabilit\\u00e9</strong>&nbsp;restera, pour nous,&nbsp;un&nbsp;<strong>jalon fondateur</strong>&nbsp;dans l\\u2019histoire de notre profession.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019Ordre des Ing\\u00e9nieurs du Congo est une institution&nbsp;<strong>jeune</strong>,<br>mais&nbsp;<strong>r\\u00e9solument tourn\\u00e9e vers l\\u2019avenir</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 ce jour,&nbsp;<strong>154 ing\\u00e9nieurs</strong>&nbsp;ont \\u00e9t\\u00e9 officiellement enregistr\\u00e9s.<br>Ce chiffre, bien qu\\u2019<strong>encourageant</strong>, reste&nbsp;<strong>nettement en dessous du potentiel national</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il r\\u00e9v\\u00e8le surtout que la&nbsp;<strong>majorit\\u00e9 des ing\\u00e9nieurs en activit\\u00e9</strong>op\\u00e8rent encore&nbsp;<strong>en dehors du cadre l\\u00e9gal</strong>. Ceci, tant\\u00f4t&nbsp;<strong>par ignorance</strong>,&nbsp;tant\\u00f4t&nbsp;<strong>par n\\u00e9gligence</strong>, et&nbsp;tant\\u00f4t&nbsp;m\\u00eame&nbsp;<strong>en d\\u00e9fi de la loi</strong>&nbsp;portant cr\\u00e9ation de notre Ordre.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Face \\u00e0 cette r\\u00e9alit\\u00e9, le Conseil national a d\\u00e9cid\\u00e9 de lancer une&nbsp;<strong>vaste campagne nationale de recensement et d\\u2019adh\\u00e9sion</strong>,&nbsp;afin d\\u2019<strong>\\u00e9largir</strong>&nbsp;et de&nbsp;<strong>renforcer</strong>&nbsp;notre communaut\\u00e9&nbsp;professionnelle.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Les objectifs de cette campagne sont&nbsp;</strong><strong>les&nbsp;</strong><strong>suivantes :</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>1.&nbsp;</strong><strong>Faire appliquer les lois existantes</strong>, en incitant tous les ing\\u00e9nieurs \\u00e0 s\\u2019inscrire sans d\\u00e9lai \\u00e0 l\\u2019OIC ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>2.&nbsp;</strong><strong>Constituer une ba</strong><strong>se</strong><strong>&nbsp;de donn\\u00e9es nationale fiable</strong>&nbsp;des ing\\u00e9nieurs en exercice en R\\u00e9publique du Congo ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>3.&nbsp;</strong><strong>Renforcer la gouvernance technique de l\\u2019\\u00c9tat</strong>, en assurant une meilleure r\\u00e9gulation de la profession ;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>4.&nbsp;</strong><strong>Lutter contre la prolif\\u00e9ration des faux dipl\\u00f4mes</strong>, qui ternissent l\\u2019image de&nbsp;notre profession.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 l\\u2019issue de cette campagne,&nbsp;nous visons&nbsp;<strong>au moins 300 nouvelles adh\\u00e9sions</strong>&nbsp;pour franchir un cap d\\u00e9cisif dans la&nbsp;<strong>structuration de l\\u2019ing\\u00e9nierie congolaise</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Monsieur le</strong><strong>&nbsp;Directeur du cabinet du</strong><strong>&nbsp;Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux</strong><strong>,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u2022&nbsp;<strong>Mes</strong><strong>dames et Messieurs</strong><strong>,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>En promulguant les lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo,&nbsp;<strong>Son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique&nbsp;</strong>a dot\\u00e9 notre pays d\\u2019instruments juridiques n\\u00e9cessaires \\u00e0 l\\u2019organisation et \\u00e0 la structuration du secteur de l\\u2019ing\\u00e9nierie. Ces lois ouvrent des perspectives concr\\u00e8tes aux jeunes ing\\u00e9nieurs, en leur permettant&nbsp;de cr\\u00e9er leurs propres soci\\u00e9t\\u00e9s.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>\\u00c0 l\\u2019heure o\\u00f9 notre pays est confront\\u00e9 \\u00e0 des d\\u00e9fis majeurs dans des secteurs strat\\u00e9giques tels que le&nbsp;b\\u00e2timent et les travaux publics&nbsp;; les mines et l\\u2019\\u00e9nergie&nbsp;; les eaux et for\\u00eats&nbsp;;&nbsp;l\\u2019agriculture et l\\u2019environnement, il est imp\\u00e9ratif que l\\u2019ing\\u00e9nieur&nbsp;<strong>occupe pleinement sa place dans toutes ces sph\\u00e8res d\\u2019activit\\u00e9s</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>C\\u2019est dans cette dynamique que nous&nbsp;pourrons affirmer&nbsp;avec conviction&nbsp;que<strong>&nbsp;l\\u2019ing\\u00e9nieur</strong><strong>&nbsp;</strong><strong>est</strong><strong>&nbsp;v\\u00e9ritablement au c\\u0153ur du d\\u00e9veloppement du Congo.</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Il est donc essentiel que l\\u2019\\u00c9tat mette en \\u0153uvre les outils juridiques d\\u00e9j\\u00e0 disponibles pour permettre \\u00e0 l\\u2019Ordre des Ing\\u00e9nieurs du Congo de mieux organiser, encadrer et professionnaliser l\\u2019ing\\u00e9nierie nationale. Car c\\u2019est par la&nbsp;<strong>qualit\\u00e9, la s\\u00e9curit\\u00e9 et la durabilit\\u00e9</strong>&nbsp;des ouvrages publics et priv\\u00e9s que nous pourrons r\\u00e9pondre efficacement aux besoins de la population et garantir un d\\u00e9veloppement harmonieux.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Notre souhait est que l\\u2019ing\\u00e9nieur inscrit \\u00e0 l\\u2019Ordre devienne&nbsp;<strong>le r\\u00e9f\\u00e9rent naturel des missions techniques d</strong><strong>e l\\u2019\\u00e9tat</strong>&nbsp;et que les entreprises \\u00e9trang\\u00e8res op\\u00e9rant sur notre territoire se conforment \\u00e0 la loi en d\\u00e9clarant leurs ing\\u00e9nieurs aupr\\u00e8s de l\\u2019OIC.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Chers confr\\u00e8res ing\\u00e9nieurs,</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>L\\u2019adh\\u00e9sion \\u00e0 l\\u2019Ordre est \\u00e0 la fois une&nbsp;<strong>obligation l\\u00e9gale</strong>&nbsp;et un&nbsp;<strong>devoir moral</strong><strong>,&nbsp;</strong>en vue&nbsp;d\\u2019en finir avec:&nbsp;<strong>l</strong><strong>\\u2019exercice ill\\u00e9gal de la profession</strong>,&nbsp;<strong>l</strong><strong>es faux dipl\\u00f4mes</strong>,&nbsp;et aussi&nbsp;<strong>l</strong><strong>\\u2019imposture technocratique</strong>,&nbsp;cette d\\u00e9rive qui donne \\u00e0 certains une&nbsp;<strong>l\\u00e9gitimit\\u00e9 sans comp\\u00e9tence</strong><strong>&nbsp;av\\u00e9r\\u00e9e</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Cette campagne,&nbsp;c\\u2019est aussi l\\u2019occasion&nbsp;d\\u2019<strong>informer</strong>, de&nbsp;<strong>sensibiliser</strong>&nbsp;et de&nbsp;<strong>convaincre</strong>&nbsp;tous les ing\\u00e9nieurs, m\\u00eame ceux qui pensent, \\u00e0 tort,&nbsp;<strong>ne pas \\u00eatre concern\\u00e9s</strong>.&nbsp;</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Une fois&nbsp;cette phase termin\\u00e9e, nous passerons \\u00e0&nbsp;<strong>l\\u2019application&nbsp;</strong>des&nbsp;<strong>lois et r\\u00e8glements en vigueur</strong>.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Alors,&nbsp;<br><strong>mobilisons-nous</strong>,<br><strong>engageons-nous</strong>,<br><strong>recensons-nous</strong>,<br><strong>enfin,&nbsp;</strong><strong>adh\\u00e9rons tous</strong><strong>&nbsp;\\u00e0 l\\u2019OIC</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Avant de clore mon propos,&nbsp;je tiens \\u00e0 remercier tr\\u00e8s sinc\\u00e8rement les institutions, les personnes et partenaires qui ont contribu\\u00e9 \\u00e0 l\\u2019organisation de cette campagne nationaleparmi lesquelles&nbsp;<strong>le Ministre d\\u2019Etat Jean Jacques BOUYA et l\\u2019honorable Blaise AMBETO</strong><strong>.&nbsp;</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><a></a><strong>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</strong><br><strong>Vive&nbsp;</strong><strong>l\\u2019OIC&nbsp;</strong><strong>!</strong><br><strong>Vive la R\\u00e9publique du</strong><strong>&nbsp;Congo</strong><strong>, notre ch\\u00e8re patrie</strong><strong>&nbsp;!</strong></p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p><strong>Je vous remercie.</strong></p>\\n<!-- /wp:paragraph -->", "wagtail_admin_comments": []}	21	51	1	Deuxième anniversaire de l’OIC
39	2026-02-28 09:16:29.266581+00	\N	\N	{"pk": 21, "path": "000100040001000F", "depth": 4, "numchild": 0, "translation_key": "c2235f9c-c802-4377-a68a-c95effbe7c8b", "locale": 1, "latest_revision": 38, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.767Z", "last_published_at": "2026-02-28T09:13:28.376Z", "live_revision": 38, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "draft_title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "slug": "deuxieme-anniversaire-de-loic", "content_type": 51, "url_path": "/accueil/blog/deuxieme-anniversaire-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:13:28.346Z", "alias_of": null, "date": "2025-07-12", "intro": "", "image": null, "body": "<p><strong>MOT DU PRESIDENT DE L\\u2019ORDRE DES INGENIEURS DU CONGO (OIC), \\u00c0&nbsp;</strong><strong>L\\u2019OCCASION</strong><strong>DU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D\\u2019ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L\\u2019OIC</strong></p>\\n\\n<p><em>Brazzaville, le 12 juillet 2025</em></p>\\n\\n<p>\\u2022&nbsp;<strong>Monsieur le</strong><strong>&nbsp;Directeur du cabinet du</strong><strong>&nbsp;Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux ;</strong></p>\\n\\n<p>\\u2022&nbsp;<strong>Honorable D\\u00e9put\\u00e9 Blaise AMBETO ;</strong></p>\\n\\n<p>\\u2022&nbsp;<strong>Messieurs les repr\\u00e9sentants des&nbsp;</strong><strong>membres du Gouvernement ;</strong></p>\\n\\n<p><strong>\\u2022&nbsp;</strong><strong>Monsieur le&nbsp;</strong><strong>Pr\\u00e9sident du C</strong><strong>onseil Municipal, D\\u00e9put\\u00e9-Maire de la Ville de Brazzaville</strong><strong>&nbsp;;</strong><strong></strong></p>\\n\\n<p>\\u2022&nbsp;<strong>Mesdames et Messieurs les membres du Conseil national de l\\u2019OIC ;</strong></p>\\n\\n<p>\\u2022&nbsp;<strong>Chers confr\\u00e8res ing\\u00e9nieurs ;</strong></p>\\n\\n<p>\\u2022&nbsp;<strong>Distingu\\u00e9s invit\\u00e9s</strong><strong>&nbsp;!</strong></p>\\n\\n<p>En ce&nbsp;<strong>jour symbolique</strong>, marquant le&nbsp;<strong>deuxi\\u00e8me anniversaire</strong>de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, permettez-moi, au nom de l\\u2019ensemble des membres de l\\u2019OIC, et en mon nom propre, d\\u2019exprimer notre&nbsp;<strong>profonde gratitude</strong>&nbsp;pour votre pr\\u00e9sence \\u00e0 cette&nbsp;<strong>c\\u00e9r\\u00e9monie solennelle</strong>&nbsp;de&nbsp;<strong>lancement de la campagne nationale de recensement et d\\u2019adh\\u00e9sion</strong>&nbsp;des ing\\u00e9nieurs exer\\u00e7ant en R\\u00e9publique du Congo.</p>\\n\\n<p>Souvenons-nous&nbsp;;&nbsp;&nbsp;<br>Le&nbsp;<strong>28 f\\u00e9vrier dernier</strong>, dans cette m\\u00eame salle, nous proc\\u00e9dions \\u00e0 la&nbsp;<strong>publication du tout premier tableau officiel</strong>&nbsp;des ing\\u00e9nieurs inscrits \\u00e0 l\\u2019OIC, suivie d\\u2019une&nbsp;<strong>c\\u00e9r\\u00e9monie historique de prestation de serment</strong>.</p>\\n\\n<p>Ce moment&nbsp;<strong>charg\\u00e9 d\\u2019\\u00e9motion et de responsabilit\\u00e9</strong>&nbsp;restera, pour nous,&nbsp;un&nbsp;<strong>jalon fondateur</strong>&nbsp;dans l\\u2019histoire de notre profession.&nbsp;</p>\\n\\n<p>L\\u2019Ordre des Ing\\u00e9nieurs du Congo est une institution&nbsp;<strong>jeune</strong>,<br>mais&nbsp;<strong>r\\u00e9solument tourn\\u00e9e vers l\\u2019avenir</strong>.</p>\\n\\n<p>\\u00c0 ce jour,&nbsp;<strong>154 ing\\u00e9nieurs</strong>&nbsp;ont \\u00e9t\\u00e9 officiellement enregistr\\u00e9s.<br>Ce chiffre, bien qu\\u2019<strong>encourageant</strong>, reste&nbsp;<strong>nettement en dessous du potentiel national</strong>.</p>\\n\\n<p>Il r\\u00e9v\\u00e8le surtout que la&nbsp;<strong>majorit\\u00e9 des ing\\u00e9nieurs en activit\\u00e9</strong>op\\u00e8rent encore&nbsp;<strong>en dehors du cadre l\\u00e9gal</strong>. Ceci, tant\\u00f4t&nbsp;<strong>par ignorance</strong>,&nbsp;tant\\u00f4t&nbsp;<strong>par n\\u00e9gligence</strong>, et&nbsp;tant\\u00f4t&nbsp;m\\u00eame&nbsp;<strong>en d\\u00e9fi de la loi</strong>&nbsp;portant cr\\u00e9ation de notre Ordre.</p>\\n\\n<p>Face \\u00e0 cette r\\u00e9alit\\u00e9, le Conseil national a d\\u00e9cid\\u00e9 de lancer une&nbsp;<strong>vaste campagne nationale de recensement et d\\u2019adh\\u00e9sion</strong>,&nbsp;afin d\\u2019<strong>\\u00e9largir</strong>&nbsp;et de&nbsp;<strong>renforcer</strong>&nbsp;notre communaut\\u00e9&nbsp;professionnelle.</p>\\n\\n<p><strong>Les objectifs de cette campagne sont&nbsp;</strong><strong>les&nbsp;</strong><strong>suivantes :</strong></p>\\n\\n<p><strong>1.&nbsp;</strong><strong>Faire appliquer les lois existantes</strong>, en incitant tous les ing\\u00e9nieurs \\u00e0 s\\u2019inscrire sans d\\u00e9lai \\u00e0 l\\u2019OIC ;</p>\\n\\n<p><strong>2.&nbsp;</strong><strong>Constituer une ba</strong><strong>se</strong><strong>&nbsp;de donn\\u00e9es nationale fiable</strong>&nbsp;des ing\\u00e9nieurs en exercice en R\\u00e9publique du Congo ;</p>\\n\\n<p><strong>3.&nbsp;</strong><strong>Renforcer la gouvernance technique de l\\u2019\\u00c9tat</strong>, en assurant une meilleure r\\u00e9gulation de la profession ;</p>\\n\\n<p><strong>4.&nbsp;</strong><strong>Lutter contre la prolif\\u00e9ration des faux dipl\\u00f4mes</strong>, qui ternissent l\\u2019image de&nbsp;notre profession.&nbsp;</p>\\n\\n<p>\\u00c0 l\\u2019issue de cette campagne,&nbsp;nous visons&nbsp;<strong>au moins 300 nouvelles adh\\u00e9sions</strong>&nbsp;pour franchir un cap d\\u00e9cisif dans la&nbsp;<strong>structuration de l\\u2019ing\\u00e9nierie congolaise</strong>.</p>\\n\\n<p>\\u2022&nbsp;<strong>Monsieur le</strong><strong>&nbsp;Directeur du cabinet du</strong><strong>&nbsp;Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux</strong><strong>,</strong></p>\\n\\n<p>\\u2022&nbsp;<strong>Mes</strong><strong>dames et Messieurs</strong><strong>,</strong></p>\\n\\n<p>En promulguant les lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo,&nbsp;<strong>Son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique&nbsp;</strong>a dot\\u00e9 notre pays d\\u2019instruments juridiques n\\u00e9cessaires \\u00e0 l\\u2019organisation et \\u00e0 la structuration du secteur de l\\u2019ing\\u00e9nierie. Ces lois ouvrent des perspectives concr\\u00e8tes aux jeunes ing\\u00e9nieurs, en leur permettant&nbsp;de cr\\u00e9er leurs propres soci\\u00e9t\\u00e9s.&nbsp;</p>\\n\\n<p>\\u00c0 l\\u2019heure o\\u00f9 notre pays est confront\\u00e9 \\u00e0 des d\\u00e9fis majeurs dans des secteurs strat\\u00e9giques tels que le&nbsp;b\\u00e2timent et les travaux publics&nbsp;; les mines et l\\u2019\\u00e9nergie&nbsp;; les eaux et for\\u00eats&nbsp;;&nbsp;l\\u2019agriculture et l\\u2019environnement, il est imp\\u00e9ratif que l\\u2019ing\\u00e9nieur&nbsp;<strong>occupe pleinement sa place dans toutes ces sph\\u00e8res d\\u2019activit\\u00e9s</strong>.</p>\\n\\n<p>C\\u2019est dans cette dynamique que nous&nbsp;pourrons affirmer&nbsp;avec conviction&nbsp;que<strong>&nbsp;l\\u2019ing\\u00e9nieur</strong><strong>&nbsp;</strong><strong>est</strong><strong>&nbsp;v\\u00e9ritablement au c\\u0153ur du d\\u00e9veloppement du Congo.</strong></p>\\n\\n<p>Il est donc essentiel que l\\u2019\\u00c9tat mette en \\u0153uvre les outils juridiques d\\u00e9j\\u00e0 disponibles pour permettre \\u00e0 l\\u2019Ordre des Ing\\u00e9nieurs du Congo de mieux organiser, encadrer et professionnaliser l\\u2019ing\\u00e9nierie nationale. Car c\\u2019est par la&nbsp;<strong>qualit\\u00e9, la s\\u00e9curit\\u00e9 et la durabilit\\u00e9</strong>&nbsp;des ouvrages publics et priv\\u00e9s que nous pourrons r\\u00e9pondre efficacement aux besoins de la population et garantir un d\\u00e9veloppement harmonieux.</p>\\n\\n<p>Notre souhait est que l\\u2019ing\\u00e9nieur inscrit \\u00e0 l\\u2019Ordre devienne&nbsp;<strong>le r\\u00e9f\\u00e9rent naturel des missions techniques d</strong><strong>e l\\u2019\\u00e9tat</strong>&nbsp;et que les entreprises \\u00e9trang\\u00e8res op\\u00e9rant sur notre territoire se conforment \\u00e0 la loi en d\\u00e9clarant leurs ing\\u00e9nieurs aupr\\u00e8s de l\\u2019OIC.</p>\\n\\n<p><strong>Chers confr\\u00e8res ing\\u00e9nieurs,</strong></p>\\n\\n<p>L\\u2019adh\\u00e9sion \\u00e0 l\\u2019Ordre est \\u00e0 la fois une&nbsp;<strong>obligation l\\u00e9gale</strong>&nbsp;et un&nbsp;<strong>devoir moral</strong><strong>,&nbsp;</strong>en vue&nbsp;d\\u2019en finir avec:&nbsp;<strong>l</strong><strong>\\u2019exercice ill\\u00e9gal de la profession</strong>,&nbsp;<strong>l</strong><strong>es faux dipl\\u00f4mes</strong>,&nbsp;et aussi&nbsp;<strong>l</strong><strong>\\u2019imposture technocratique</strong>,&nbsp;cette d\\u00e9rive qui donne \\u00e0 certains une&nbsp;<strong>l\\u00e9gitimit\\u00e9 sans comp\\u00e9tence</strong><strong>&nbsp;av\\u00e9r\\u00e9e</strong>.</p>\\n\\n<p>Cette campagne,&nbsp;c\\u2019est aussi l\\u2019occasion&nbsp;d\\u2019<strong>informer</strong>, de&nbsp;<strong>sensibiliser</strong>&nbsp;et de&nbsp;<strong>convaincre</strong>&nbsp;tous les ing\\u00e9nieurs, m\\u00eame ceux qui pensent, \\u00e0 tort,&nbsp;<strong>ne pas \\u00eatre concern\\u00e9s</strong>.&nbsp;</p>\\n\\n<p>Une fois&nbsp;cette phase termin\\u00e9e, nous passerons \\u00e0&nbsp;<strong>l\\u2019application&nbsp;</strong>des&nbsp;<strong>lois et r\\u00e8glements en vigueur</strong>.</p>\\n\\n<p>Alors,&nbsp;<br><strong>mobilisons-nous</strong>,<br><strong>engageons-nous</strong>,<br><strong>recensons-nous</strong>,<br><strong>enfin,&nbsp;</strong><strong>adh\\u00e9rons tous</strong><strong>&nbsp;\\u00e0 l\\u2019OIC</strong><strong>&nbsp;!</strong></p>\\n\\n<p>Avant de clore mon propos,&nbsp;je tiens \\u00e0 remercier tr\\u00e8s sinc\\u00e8rement les institutions, les personnes et partenaires qui ont contribu\\u00e9 \\u00e0 l\\u2019organisation de cette campagne nationaleparmi lesquelles&nbsp;<strong>le Ministre d\\u2019Etat Jean Jacques BOUYA et l\\u2019honorable Blaise AMBETO</strong><strong>.&nbsp;</strong></p>\\n\\n<p><a></a><strong>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</strong><br><strong>Vive&nbsp;</strong><strong>l\\u2019OIC&nbsp;</strong><strong>!</strong><br><strong>Vive la R\\u00e9publique du</strong><strong>&nbsp;Congo</strong><strong>, notre ch\\u00e8re patrie</strong><strong>&nbsp;!</strong></p>\\n\\n<p><strong>Je vous remercie.</strong></p>", "wagtail_admin_comments": []}	21	51	1	Deuxième anniversaire de l’OIC
40	2026-02-28 09:18:49.164853+00	\N	1	{"pk": 16, "path": "000100040001000A", "depth": 4, "numchild": 0, "translation_key": "c3bc92e9-d1b8-4100-83c9-e853881a8248", "locale": 1, "latest_revision": 14, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.582Z", "last_published_at": "2026-02-24T15:25:52.582Z", "live_revision": 14, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "F\\u00e9d\\u00e9ration des Organisations Africaines d'Ing\\u00e9nierie", "draft_title": "F\\u00e9d\\u00e9ration des Organisations Africaines d'Ing\\u00e9nierie", "slug": "federation-des-organisations-africaines-dingenierie", "content_type": 51, "url_path": "/accueil/blog/federation-des-organisations-africaines-dingenierie/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.574Z", "alias_of": null, "date": "2025-04-14", "intro": "La F\\u00e9d\\u00e9ration des Organisations Africaines d\\u2019Ing\\u00e9nierie a le plaisir de vous inviter \\u00e0 la deuxi\\u00e8me session de sa s\\u00e9rie de webinaires en six parties sur le th\\u00e8me : Faire progresser les normes d'ing\\u00e9nierie en Afrique : la voie vers l\\u2019adh\\u00e9sion \\u00e0 l\\u2019accr\\u00e9ditat", "image": null, "body": "<p data-block-key=\\"cje8f\\">La F\\u00e9d\\u00e9ration des Organisations Africaines d\\u2019Ing\\u00e9nierie a le plaisir de vous inviter \\u00e0 la deuxi\\u00e8me session de sa s\\u00e9rie de webinaires en six parties sur le th\\u00e8me : <b>Faire progresser les normes d'ing\\u00e9nierie en Afrique : la voie vers l\\u2019adh\\u00e9sion \\u00e0 l\\u2019accr\\u00e9ditation internationale</b>.</p><p data-block-key=\\"3ea62\\"><a href=\\"https://t.co/0kUEFNCTxx\\">Veuillez vous inscrire ici</a>.</p><p data-block-key=\\"14syd\\"></p>", "wagtail_admin_comments": []}	16	51	1	Fédération des Organisations Africaines d'Ingénierie
41	2026-02-28 09:42:47.453015+00	\N	1	{"pk": 8, "path": "0001000400010002", "depth": 4, "numchild": 0, "translation_key": "1f0c8987-b727-493c-9700-f1a1e3fb1af6", "locale": 1, "latest_revision": 6, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.217Z", "last_published_at": "2026-02-24T15:25:52.217Z", "live_revision": 6, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "L'OIC : Un engagement solennel au service du d\\u00e9veloppement", "draft_title": "L'OIC : Un engagement solennel au service du d\\u00e9veloppement", "slug": "ceremonie-du-prestation-de-serment-des-ingenieurs", "content_type": 51, "url_path": "/accueil/blog/ceremonie-du-prestation-de-serment-des-ingenieurs/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.208Z", "alias_of": null, "date": "2025-02-08", "intro": "", "image": null, "body": "<p data-block-key=\\"tr0vx\\">Le 8 f\\u00e9vrier 2025, les tours jumelles de Mpila ont accueilli la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs, un \\u00e9v\\u00e9nement marquant plac\\u00e9 sous le haut patronage du Monsieur Jean Jacques BOUYA, Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement, de l'Equipement du Territoire et des Grands Travaux. Cette c\\u00e9r\\u00e9monie a \\u00e9galement enregistr\\u00e9 la pr\\u00e9sence remarqu\\u00e9e de l'Honorable Blaise AMBETO, d\\u00e9put\\u00e9 \\u00e0 l'Assembl\\u00e9e nationale.</p><p data-block-key=\\"ok47h\\">Au cours de cette c\\u00e9r\\u00e9monie solennelle, 154 ing\\u00e9nieurs ont pr\\u00eat\\u00e9 serment, marquant ainsi leur engagement \\u00e0 servir la nation avec int\\u00e9grit\\u00e9, professionnalisme et d\\u00e9vouement. Cet acte symbolique rev\\u00eat une importance capitale, t\\u00e9moignant de la volont\\u00e9 des ing\\u00e9nieurs congolais de contribuer activement aux projets d'infrastructures et au d\\u00e9veloppement du pays.</p><p data-block-key=\\"efjqx\\">Dans son allocution, le Ministre d'\\u00c9tat a salu\\u00e9 l'enthousiasme et l'engagement des nouveaux ing\\u00e9nieurs, rappelant que leur mission est essentielle pour soutenir les grands travaux entrepris par le pays. De son c\\u00f4t\\u00e9, l'Honorable Blaise AMBETO a encourag\\u00e9 les ing\\u00e9nieurs \\u00e0 faire preuve de responsabilit\\u00e9 et d'innovation dans la r\\u00e9alisation de leurs projets.</p><p data-block-key=\\"3gwrq\\">L'Ordre des Ing\\u00e9nieurs du Congo (OIC) se f\\u00e9licite de l'organisation r\\u00e9ussie de cette c\\u00e9r\\u00e9monie et tient \\u00e0 f\\u00e9liciter chaleureusement l'ensemble des ing\\u00e9nieurs qui ont pr\\u00eat\\u00e9 serment. Ce moment fort t\\u00e9moigne de la volont\\u00e9 de renforcer l'excellence et la responsabilit\\u00e9 au sein de la profession d'ing\\u00e9nieur au Congo.</p><p data-block-key=\\"o37ii\\">L'OIC reste engag\\u00e9 \\u00e0 accompagner ses membres dans l'accomplissement de leurs missions et \\u00e0 promouvoir les valeurs d'\\u00e9thique et de professionnalisme au sein de la communaut\\u00e9 des ing\\u00e9nieurs congolais.</p><p data-block-key=\\"4hbtb\\">Pour plus d'informations sur l'Ordre des Ing\\u00e9nieurs du Congo et ses activit\\u00e9s, n'h\\u00e9sitez pas \\u00e0 consulter notre site internet.</p>", "wagtail_admin_comments": []}	8	51	1	L'OIC : Un engagement solennel au service du développement
42	2026-02-28 09:44:13.474982+00	\N	1	{"pk": 17, "path": "000100040001000B", "depth": 4, "numchild": 0, "translation_key": "f316ed49-94ec-4cba-9501-e75734cb4916", "locale": 1, "latest_revision": 15, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.620Z", "last_published_at": "2026-02-24T15:25:52.620Z", "live_revision": 15, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "draft_title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "slug": "remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo", "content_type": 51, "url_path": "/accueil/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.610Z", "alias_of": null, "date": "2025-02-08", "intro": "Le Ministre d\\u2019\\u00c9tat a rappel\\u00e9 que les ing\\u00e9nieurs ont le devoir de contribuer au progr\\u00e8s et \\u00e0 la prosp\\u00e9rit\\u00e9 du Congo, en \\u00e9cho \\u00e0 la vision du Pr\\u00e9sident de la R\\u00e9publique, Denis Sassou Nguesso. Par ailleurs, l\\u2019Honorable Blaise Ambeto, initiateur des lois fonda", "image": null, "body": "<p data-block-key=\\"3rcwy\\">En reprenant les paroles du Pr\\u00e9sident de l'Ordre - <b>\\u00ab Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9 \\u00bb</b> - le Ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux, a rappel\\u00e9 aux ing\\u00e9nieurs que ces mots r\\u00e9sonnent profond\\u00e9ment avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Pr\\u00e9sident de la R\\u00e9publique, Chef de l'Etat.</p><p data-block-key=\\"9rede\\"></p><p data-block-key=\\"3pqv2\\">L\\u2019Honorable Blaise AMBETO, porteur des lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, a solennellement proclam\\u00e9 le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux, <b>parrain de l\\u2019Ordre</b>, lors de la remise officielle du tout premier tableau.</p>", "wagtail_admin_comments": []}	17	51	1	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
43	2026-02-28 09:57:30.458533+00	\N	1	{"pk": 17, "path": "000100040001000B", "depth": 4, "numchild": 0, "translation_key": "f316ed49-94ec-4cba-9501-e75734cb4916", "locale": 1, "latest_revision": 42, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.620Z", "last_published_at": "2026-02-28T09:44:13.498Z", "live_revision": 42, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "draft_title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "slug": "remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo", "content_type": 51, "url_path": "/accueil/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:44:13.474Z", "alias_of": null, "date": "2025-02-08", "intro": "<p data-block-key=\\"5f4er\\">Le Ministre d\\u2019\\u00c9tat a rappel\\u00e9 que les ing\\u00e9nieurs ont le devoir de contribuer au progr\\u00e8s et \\u00e0 la prosp\\u00e9rit\\u00e9 du Congo, en \\u00e9cho \\u00e0 la vision du Pr\\u00e9sident de la R\\u00e9publique, Denis Sassou Nguesso. Par ailleurs, l\\u2019Honorable Blaise Ambeto, initiateur des lois fonda</p>", "body": "<p data-block-key=\\"3rcwy\\">En reprenant les paroles du Pr\\u00e9sident de l'Ordre - <b>\\u00ab Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9 \\u00bb</b> - le Ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux, a rappel\\u00e9 aux ing\\u00e9nieurs que ces mots r\\u00e9sonnent profond\\u00e9ment avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Pr\\u00e9sident de la R\\u00e9publique, Chef de l'Etat.</p><p data-block-key=\\"9rede\\"></p><p data-block-key=\\"3pqv2\\">L\\u2019Honorable Blaise AMBETO, porteur des lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, a solennellement proclam\\u00e9 le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux, <b>parrain de l\\u2019Ordre</b>, lors de la remise officielle du tout premier tableau.</p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	17	51	1	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
44	2026-02-28 09:58:34.381217+00	\N	1	{"pk": 17, "path": "000100040001000B", "depth": 4, "numchild": 0, "translation_key": "f316ed49-94ec-4cba-9501-e75734cb4916", "locale": 1, "latest_revision": 43, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.620Z", "last_published_at": "2026-02-28T09:57:30.483Z", "live_revision": 43, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "draft_title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "slug": "remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo", "content_type": 51, "url_path": "/accueil/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:57:30.458Z", "alias_of": null, "date": "2025-02-08", "intro": "<p data-block-key=\\"5f4er\\">Le Ministre d\\u2019\\u00c9tat a rappel\\u00e9 que les ing\\u00e9nieurs ont le devoir de contribuer au progr\\u00e8s et \\u00e0 la prosp\\u00e9rit\\u00e9 du Congo, en \\u00e9cho \\u00e0 la vision du Pr\\u00e9sident de la R\\u00e9publique, Denis Sassou Nguesso. Par ailleurs, l\\u2019Honorable Blaise Ambeto, initiateur des lois fonda</p>", "body": "<p data-block-key=\\"3rcwy\\">En reprenant les paroles du Pr\\u00e9sident de l'Ordre - <b>\\u00ab Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9 \\u00bb</b> - le Ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux, a rappel\\u00e9 aux ing\\u00e9nieurs que ces mots r\\u00e9sonnent profond\\u00e9ment avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Pr\\u00e9sident de la R\\u00e9publique, Chef de l'Etat.</p><p data-block-key=\\"9rede\\"></p><p data-block-key=\\"3pqv2\\">L\\u2019Honorable Blaise AMBETO, porteur des lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, a solennellement proclam\\u00e9 le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux, <b>parrain de l\\u2019Ordre</b>, lors de la remise officielle du tout premier tableau.</p>", "image": null, "featured": true, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	17	51	1	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
45	2026-02-28 09:59:54.854546+00	\N	1	{"pk": 20, "path": "000100040001000E", "depth": 4, "numchild": 0, "translation_key": "b0076f5d-7464-47f2-8ddd-8ee96fc218da", "locale": 1, "latest_revision": 18, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.730Z", "last_published_at": "2026-02-24T15:25:52.730Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Campagne nationale de recensement et d\\u2019adh\\u00e9sion \\u00e0 l\\u2019OIC", "draft_title": "Campagne nationale de recensement et d\\u2019adh\\u00e9sion \\u00e0 l\\u2019OIC", "slug": "campagne-nationale-de-recensement-et-dadhesion-a-loic", "content_type": 51, "url_path": "/accueil/blog/campagne-nationale-de-recensement-et-dadhesion-a-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.721Z", "alias_of": null, "date": "2025-05-10", "intro": "<p data-block-key=\\"rj9l8\\">Lancement officiel \\u00e0 Brazzaville lors de la c\\u00e9l\\u00e9bration du 2\\u00e8me anniversaire de l\\u2019OIC, sous le haut patronage du ministre d\\u2019\\u00e9tat, ministre de l\\u2019am\\u00e9nagement du territoire et des grands travaux</p>", "body": "<p data-block-key=\\"ilggj\\"></p><p data-block-key=\\"1vy2j\\"><b>Samedi 12 juillet 2025</b> : lancement officiel \\u00e0 Brazzaville lors de la c\\u00e9l\\u00e9bration du 2\\u00e8me anniversaire de l\\u2019OIC, sous le haut patronage du ministre d\\u2019\\u00e9tat, ministre de l\\u2019am\\u00e9nagement du territoire et des grands travaux.</p><p data-block-key=\\"9eyah\\"><b>Juillet - Ao\\u00fbt - Septembre 2025 :</b> phase de recensement.</p><p data-block-key=\\"k5pf0\\"></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	20	51	1	Campagne nationale de recensement et d’adhésion à l’OIC
46	2026-02-28 10:12:19.049465+00	\N	1	{"pk": 19, "path": "000100040001000D", "depth": 4, "numchild": 0, "translation_key": "090435a9-f0a8-46b5-a4bb-f5d9b4e59b65", "locale": 1, "latest_revision": 17, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.693Z", "last_published_at": "2026-02-24T15:25:52.693Z", "live_revision": 17, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Regards d'ing\\u00e9nieurs", "draft_title": "Regards d'ing\\u00e9nieurs", "slug": "regards-dingenieurs", "content_type": 51, "url_path": "/accueil/blog/regards-dingenieurs/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.683Z", "alias_of": null, "date": "2025-04-29", "intro": "<p data-block-key=\\"abqpi\\">Cette rubrique explore, d\\u2019un point de vue technique, les grands d\\u00e9fis auxquels nos villes sont confront\\u00e9es.</p>", "body": "<p data-block-key=\\"6m2ni\\">Cette rubrique explore, d\\u2019un point de vue technique, les grands d\\u00e9fis auxquels nos villes sont confront\\u00e9es.<br/>Nous donnons la parole aux ing\\u00e9nieurs pour analyser des probl\\u00e9matiques telles que :</p><ul><li data-block-key=\\"e1n3j\\">L\\u2019ensablement des routes et des infrastructures ;</li><li data-block-key=\\"acprn\\">L\\u2019\\u00e9rosion des sols et ses cons\\u00e9quences sur l\\u2019urbanisation ;</li><li data-block-key=\\"am287\\">Les inondations et les strat\\u00e9gies de gestion des eaux pluviales ;</li><li data-block-key=\\"fminm\\">L\\u2019approvisionnement en \\u00e9lectricit\\u00e9 et en eau potable ;</li><li data-block-key=\\"b2mff\\">La pr\\u00e9sence de caniveaux \\u00e0 ciel ouvert et les solutions d\\u2019assainissement urbain ;</li><li data-block-key=\\"66d0o\\">La maintenance des infrastructures et des \\u00e9quipements publics co\\u00fbteusement r\\u00e9alis\\u00e9s ;</li><li data-block-key=\\"2fr6v\\">La ma\\u00eetrise des co\\u00fbts de construction et de r\\u00e9habilitation ;</li><li data-block-key=\\"d3ckf\\">Les expertises d\\u2019expropriation et les \\u00e9valuations fonci\\u00e8res.</li></ul><p data-block-key=\\"cai6\\">\\u00c0 travers des analyses, des \\u00e9tudes de cas et des propositions concr\\u00e8tes, nous mettons en avant l\\u2019expertise technique n\\u00e9cessaire pour construire des villes plus r\\u00e9silientes et durables.</p>", "image": null, "featured": true, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	19	51	1	Regards d'ingénieurs
47	2026-02-28 10:18:03.686699+00	\N	1	{"pk": 21, "path": "000100040001000F", "depth": 4, "numchild": 0, "translation_key": "c2235f9c-c802-4377-a68a-c95effbe7c8b", "locale": 1, "latest_revision": 39, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.767Z", "last_published_at": "2026-02-28T09:16:29.284Z", "live_revision": 39, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "draft_title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "slug": "deuxieme-anniversaire-de-loic", "content_type": 51, "url_path": "/accueil/blog/deuxieme-anniversaire-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:16:29.266Z", "alias_of": null, "date": "2025-07-12", "intro": "<p data-block-key=\\"5tx5u\\"><b>Mot du pr\\u00e9sident de l'Ordre des Ing\\u00e9nieurs du Congo (OIC), \\u00e0 l'occasion du lancement de la campagne nationale de recensement et d'adh\\u00e9sion coupl\\u00e9e au deuxi\\u00e8me anniversaire de l'OIC.</b></p>", "body": "<p data-block-key=\\"y23u6\\"><b>MOT DU PRESIDENT DE L\\u2019ORDRE DES INGENIEURS DU CONGO (OIC), \\u00c0\\u00a0L\\u2019OCCASIONDU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D\\u2019ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L\\u2019OIC</b></p><p data-block-key=\\"bnjv\\"><i>Brazzaville, le 12 juillet 2025</i></p><ul><li data-block-key=\\"coa2f\\">\\u00a0<b>Monsieur le\\u00a0Directeur du cabinet du\\u00a0Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux ;</b></li><li data-block-key=\\"5lgtq\\">\\u00a0<b>Honorable D\\u00e9put\\u00e9 Blaise AMBETO ;</b></li><li data-block-key=\\"f59mt\\">\\u00a0<b>Messieurs les repr\\u00e9sentants des\\u00a0membres du Gouvernement ;</b></li><li data-block-key=\\"brre5\\"><b>\\u00a0Monsieur le\\u00a0Pr\\u00e9sident du Conseil Municipal, D\\u00e9put\\u00e9-Maire de la Ville de Brazzaville\\u00a0;</b></li><li data-block-key=\\"bimuc\\">\\u00a0<b>Mesdames et Messieurs les membres du Conseil national de l\\u2019OIC ;</b></li><li data-block-key=\\"fe2pa\\">\\u00a0<b>Chers confr\\u00e8res ing\\u00e9nieurs ;</b></li><li data-block-key=\\"1ag0v\\">\\u00a0<b>Distingu\\u00e9s invit\\u00e9s\\u00a0!</b></li></ul><p data-block-key=\\"5lea8\\">En ce\\u00a0<b>jour symbolique</b>, marquant le\\u00a0<b>deuxi\\u00e8me anniversaire</b>de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, permettez-moi, au nom de l\\u2019ensemble des membres de l\\u2019OIC, et en mon nom propre, d\\u2019exprimer notre\\u00a0<b>profonde gratitude</b>\\u00a0pour votre pr\\u00e9sence \\u00e0 cette\\u00a0<b>c\\u00e9r\\u00e9monie solennelle</b>\\u00a0de\\u00a0<b>lancement de la campagne nationale de recensement et d\\u2019adh\\u00e9sion</b>\\u00a0des ing\\u00e9nieurs exer\\u00e7ant en R\\u00e9publique du Congo.</p><p data-block-key=\\"efc8r\\">Souvenons-nous\\u00a0;\\u00a0\\u00a0<br/>Le\\u00a0<b>28 f\\u00e9vrier dernier</b>, dans cette m\\u00eame salle, nous proc\\u00e9dions \\u00e0 la\\u00a0<b>publication du tout premier tableau officiel</b>\\u00a0des ing\\u00e9nieurs inscrits \\u00e0 l\\u2019OIC, suivie d\\u2019une\\u00a0<b>c\\u00e9r\\u00e9monie historique de prestation de serment</b>.</p><p data-block-key=\\"61pl4\\">Ce moment\\u00a0<b>charg\\u00e9 d\\u2019\\u00e9motion et de responsabilit\\u00e9</b>\\u00a0restera, pour nous,\\u00a0un\\u00a0<b>jalon fondateur</b>\\u00a0dans l\\u2019histoire de notre profession.\\u00a0</p><p data-block-key=\\"acn4t\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo est une institution\\u00a0<b>jeune</b>,<br/>mais\\u00a0<b>r\\u00e9solument tourn\\u00e9e vers l\\u2019avenir</b>.</p><p data-block-key=\\"fbj4h\\">\\u00c0 ce jour,\\u00a0<b>154 ing\\u00e9nieurs</b>\\u00a0ont \\u00e9t\\u00e9 officiellement enregistr\\u00e9s.<br/>Ce chiffre, bien qu\\u2019<b>encourageant</b>, reste\\u00a0<b>nettement en dessous du potentiel national</b>.</p><p data-block-key=\\"d8s9c\\">Il r\\u00e9v\\u00e8le surtout que la\\u00a0<b>majorit\\u00e9 des ing\\u00e9nieurs en activit\\u00e9</b>op\\u00e8rent encore\\u00a0<b>en dehors du cadre l\\u00e9gal</b>. Ceci, tant\\u00f4t\\u00a0<b>par ignorance</b>,\\u00a0tant\\u00f4t\\u00a0<b>par n\\u00e9gligence</b>, et\\u00a0tant\\u00f4t\\u00a0m\\u00eame\\u00a0<b>en d\\u00e9fi de la loi</b>\\u00a0portant cr\\u00e9ation de notre Ordre.</p><p data-block-key=\\"f01j2\\">Face \\u00e0 cette r\\u00e9alit\\u00e9, le Conseil national a d\\u00e9cid\\u00e9 de lancer une\\u00a0<b>vaste campagne nationale de recensement et d\\u2019adh\\u00e9sion</b>,\\u00a0afin d\\u2019<b>\\u00e9largir</b>\\u00a0et de\\u00a0<b>renforcer</b>\\u00a0notre communaut\\u00e9\\u00a0professionnelle.</p><p data-block-key=\\"5smrq\\"><b>Les objectifs de cette campagne sont\\u00a0les\\u00a0suivantes :</b></p><p data-block-key=\\"t3b8\\"><b>1.\\u00a0Faire appliquer les lois existantes</b>, en incitant tous les ing\\u00e9nieurs \\u00e0 s\\u2019inscrire sans d\\u00e9lai \\u00e0 l\\u2019OIC ;</p><p data-block-key=\\"a9f52\\"><b>2.\\u00a0Constituer une base\\u00a0de donn\\u00e9es nationale fiable</b>\\u00a0des ing\\u00e9nieurs en exercice en R\\u00e9publique du Congo ;</p><p data-block-key=\\"dpqtn\\"><b>3.\\u00a0Renforcer la gouvernance technique de l\\u2019\\u00c9tat</b>, en assurant une meilleure r\\u00e9gulation de la profession ;</p><p data-block-key=\\"6pnbi\\"><b>4.\\u00a0Lutter contre la prolif\\u00e9ration des faux dipl\\u00f4mes</b>, qui ternissent l\\u2019image de\\u00a0notre profession.\\u00a0</p><p data-block-key=\\"7enag\\">\\u00c0 l\\u2019issue de cette campagne,\\u00a0nous visons\\u00a0<b>au moins 300 nouvelles adh\\u00e9sions</b>\\u00a0pour franchir un cap d\\u00e9cisif dans la\\u00a0<b>structuration de l\\u2019ing\\u00e9nierie congolaise</b>.</p><ul><li data-block-key=\\"fg4te\\">\\u00a0<b>Monsieur le\\u00a0Directeur du cabinet du\\u00a0Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux,</b></li><li data-block-key=\\"gl5p\\">\\u00a0<b>Mesdames et Messieurs,</b></li></ul><p data-block-key=\\"a91tb\\">En promulguant les lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo,\\u00a0<b>Son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique\\u00a0</b>a dot\\u00e9 notre pays d\\u2019instruments juridiques n\\u00e9cessaires \\u00e0 l\\u2019organisation et \\u00e0 la structuration du secteur de l\\u2019ing\\u00e9nierie. Ces lois ouvrent des perspectives concr\\u00e8tes aux jeunes ing\\u00e9nieurs, en leur permettant\\u00a0de cr\\u00e9er leurs propres soci\\u00e9t\\u00e9s.\\u00a0</p><p data-block-key=\\"4djtj\\">\\u00c0 l\\u2019heure o\\u00f9 notre pays est confront\\u00e9 \\u00e0 des d\\u00e9fis majeurs dans des secteurs strat\\u00e9giques tels que le\\u00a0b\\u00e2timent et les travaux publics\\u00a0; les mines et l\\u2019\\u00e9nergie\\u00a0; les eaux et for\\u00eats\\u00a0;\\u00a0l\\u2019agriculture et l\\u2019environnement, il est imp\\u00e9ratif que l\\u2019ing\\u00e9nieur\\u00a0<b>occupe pleinement sa place dans toutes ces sph\\u00e8res d\\u2019activit\\u00e9s</b>.</p><p data-block-key=\\"1esma\\">C\\u2019est dans cette dynamique que nous\\u00a0pourrons affirmer\\u00a0avec conviction\\u00a0que<b>\\u00a0l\\u2019ing\\u00e9nieur</b> <b>est\\u00a0v\\u00e9ritablement au c\\u0153ur du d\\u00e9veloppement du Congo.</b></p><p data-block-key=\\"6d33f\\">Il est donc essentiel que l\\u2019\\u00c9tat mette en \\u0153uvre les outils juridiques d\\u00e9j\\u00e0 disponibles pour permettre \\u00e0 l\\u2019Ordre des Ing\\u00e9nieurs du Congo de mieux organiser, encadrer et professionnaliser l\\u2019ing\\u00e9nierie nationale. Car c\\u2019est par la\\u00a0<b>qualit\\u00e9, la s\\u00e9curit\\u00e9 et la durabilit\\u00e9</b>\\u00a0des ouvrages publics et priv\\u00e9s que nous pourrons r\\u00e9pondre efficacement aux besoins de la population et garantir un d\\u00e9veloppement harmonieux.</p><p data-block-key=\\"7jc83\\">Notre souhait est que l\\u2019ing\\u00e9nieur inscrit \\u00e0 l\\u2019Ordre devienne\\u00a0<b>le r\\u00e9f\\u00e9rent naturel des missions techniques de l\\u2019\\u00e9tat</b>\\u00a0et que les entreprises \\u00e9trang\\u00e8res op\\u00e9rant sur notre territoire se conforment \\u00e0 la loi en d\\u00e9clarant leurs ing\\u00e9nieurs aupr\\u00e8s de l\\u2019OIC.</p><p data-block-key=\\"5i8ld\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs,</b></p><p data-block-key=\\"8e3nt\\">L\\u2019adh\\u00e9sion \\u00e0 l\\u2019Ordre est \\u00e0 la fois une\\u00a0<b>obligation l\\u00e9gale</b>\\u00a0et un\\u00a0<b>devoir moral,\\u00a0</b>en vue\\u00a0d\\u2019en finir avec:\\u00a0<b>l\\u2019exercice ill\\u00e9gal de la profession</b>,\\u00a0<b>les faux dipl\\u00f4mes</b>,\\u00a0et aussi\\u00a0<b>l\\u2019imposture technocratique</b>,\\u00a0cette d\\u00e9rive qui donne \\u00e0 certains une\\u00a0<b>l\\u00e9gitimit\\u00e9 sans comp\\u00e9tence\\u00a0av\\u00e9r\\u00e9e</b>.</p><p data-block-key=\\"cf8tq\\">Cette campagne,\\u00a0c\\u2019est aussi l\\u2019occasion\\u00a0d\\u2019<b>informer</b>, de\\u00a0<b>sensibiliser</b>\\u00a0et de\\u00a0<b>convaincre</b>\\u00a0tous les ing\\u00e9nieurs, m\\u00eame ceux qui pensent, \\u00e0 tort,\\u00a0<b>ne pas \\u00eatre concern\\u00e9s</b>.\\u00a0</p><p data-block-key=\\"73ciu\\">Une fois\\u00a0cette phase termin\\u00e9e, nous passerons \\u00e0\\u00a0<b>l\\u2019application\\u00a0</b>des\\u00a0<b>lois et r\\u00e8glements en vigueur</b>.</p><p data-block-key=\\"1m07l\\">Alors,\\u00a0<br/><b>mobilisons-nous</b>,<br/><b>engageons-nous</b>,<br/><b>recensons-nous</b>,<br/><b>enfin,\\u00a0adh\\u00e9rons tous\\u00a0\\u00e0 l\\u2019OIC\\u00a0!</b></p><p data-block-key=\\"1p4mh\\">Avant de clore mon propos,\\u00a0je tiens \\u00e0 remercier tr\\u00e8s sinc\\u00e8rement les institutions, les personnes et partenaires qui ont contribu\\u00e9 \\u00e0 l\\u2019organisation de cette campagne nationaleparmi lesquelles\\u00a0<b>le Ministre d\\u2019Etat Jean Jacques BOUYA et l\\u2019honorable Blaise AMBETO.\\u00a0</b></p><p data-block-key=\\"80up\\"><b>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</b><br/><b>Vive\\u00a0l\\u2019OIC\\u00a0!</b><br/><b>Vive la R\\u00e9publique du\\u00a0Congo, notre ch\\u00e8re patrie\\u00a0!</b></p><p data-block-key=\\"e1jf6\\"><b>Je vous remercie.</b></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	21	51	1	Deuxième anniversaire de l’OIC
48	2026-02-28 10:18:54.64003+00	\N	1	{"pk": 21, "path": "000100040001000F", "depth": 4, "numchild": 0, "translation_key": "c2235f9c-c802-4377-a68a-c95effbe7c8b", "locale": 1, "latest_revision": 47, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.767Z", "last_published_at": "2026-02-28T10:18:03.708Z", "live_revision": 47, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "draft_title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "slug": "deuxieme-anniversaire-de-loic", "content_type": 51, "url_path": "/accueil/blog/deuxieme-anniversaire-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T10:18:03.686Z", "alias_of": null, "date": "2025-07-12", "intro": "<p data-block-key=\\"5tx5u\\"><b>Mot du pr\\u00e9sident de l'Ordre des Ing\\u00e9nieurs du Congo (OIC), \\u00e0 l'occasion du lancement de la campagne nationale de recensement et d'adh\\u00e9sion coupl\\u00e9e au deuxi\\u00e8me anniversaire de l'OIC.</b></p>", "body": "<p data-block-key=\\"y23u6\\"><b>MOT DU PRESIDENT DE L\\u2019ORDRE DES INGENIEURS DU CONGO (OIC), \\u00c0\\u00a0L\\u2019OCCASIONDU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D\\u2019ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L\\u2019OIC</b></p><p data-block-key=\\"bnjv\\"><i>Brazzaville, le 12 juillet 2025</i></p><ul><li data-block-key=\\"coa2f\\"><b>Monsieur le\\u00a0Directeur du cabinet du\\u00a0Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux ;</b></li><li data-block-key=\\"5lgtq\\"><b>Honorable D\\u00e9put\\u00e9 Blaise AMBETO ;</b></li><li data-block-key=\\"f59mt\\"><b>Messieurs les repr\\u00e9sentants des\\u00a0membres du Gouvernement ;</b></li><li data-block-key=\\"brre5\\"><b>Monsieur le\\u00a0Pr\\u00e9sident du Conseil Municipal, D\\u00e9put\\u00e9-Maire de la Ville de Brazzaville\\u00a0;</b></li><li data-block-key=\\"bimuc\\"><b>Mesdames et Messieurs les membres du Conseil national de l\\u2019OIC ;</b></li><li data-block-key=\\"fe2pa\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs ;</b></li><li data-block-key=\\"1ag0v\\"><b>Distingu\\u00e9s invit\\u00e9s\\u00a0!</b></li></ul><p data-block-key=\\"5lea8\\">En ce\\u00a0<b>jour symbolique</b>, marquant le\\u00a0<b>deuxi\\u00e8me anniversaire</b>de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, permettez-moi, au nom de l\\u2019ensemble des membres de l\\u2019OIC, et en mon nom propre, d\\u2019exprimer notre\\u00a0<b>profonde gratitude</b>\\u00a0pour votre pr\\u00e9sence \\u00e0 cette\\u00a0<b>c\\u00e9r\\u00e9monie solennelle</b>\\u00a0de\\u00a0<b>lancement de la campagne nationale de recensement et d\\u2019adh\\u00e9sion</b>\\u00a0des ing\\u00e9nieurs exer\\u00e7ant en R\\u00e9publique du Congo.</p><p data-block-key=\\"efc8r\\">Souvenons-nous\\u00a0;\\u00a0\\u00a0<br/>Le\\u00a0<b>28 f\\u00e9vrier dernier</b>, dans cette m\\u00eame salle, nous proc\\u00e9dions \\u00e0 la\\u00a0<b>publication du tout premier tableau officiel</b>\\u00a0des ing\\u00e9nieurs inscrits \\u00e0 l\\u2019OIC, suivie d\\u2019une\\u00a0<b>c\\u00e9r\\u00e9monie historique de prestation de serment</b>.</p><p data-block-key=\\"61pl4\\">Ce moment\\u00a0<b>charg\\u00e9 d\\u2019\\u00e9motion et de responsabilit\\u00e9</b>\\u00a0restera, pour nous,\\u00a0un\\u00a0<b>jalon fondateur</b>\\u00a0dans l\\u2019histoire de notre profession.\\u00a0</p><p data-block-key=\\"acn4t\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo est une institution\\u00a0<b>jeune</b>,<br/>mais\\u00a0<b>r\\u00e9solument tourn\\u00e9e vers l\\u2019avenir</b>.</p><p data-block-key=\\"fbj4h\\">\\u00c0 ce jour,\\u00a0<b>154 ing\\u00e9nieurs</b>\\u00a0ont \\u00e9t\\u00e9 officiellement enregistr\\u00e9s.<br/>Ce chiffre, bien qu\\u2019<b>encourageant</b>, reste\\u00a0<b>nettement en dessous du potentiel national</b>.</p><p data-block-key=\\"d8s9c\\">Il r\\u00e9v\\u00e8le surtout que la\\u00a0<b>majorit\\u00e9 des ing\\u00e9nieurs en activit\\u00e9</b>op\\u00e8rent encore\\u00a0<b>en dehors du cadre l\\u00e9gal</b>. Ceci, tant\\u00f4t\\u00a0<b>par ignorance</b>,\\u00a0tant\\u00f4t\\u00a0<b>par n\\u00e9gligence</b>, et\\u00a0tant\\u00f4t\\u00a0m\\u00eame\\u00a0<b>en d\\u00e9fi de la loi</b>\\u00a0portant cr\\u00e9ation de notre Ordre.</p><p data-block-key=\\"f01j2\\">Face \\u00e0 cette r\\u00e9alit\\u00e9, le Conseil national a d\\u00e9cid\\u00e9 de lancer une\\u00a0<b>vaste campagne nationale de recensement et d\\u2019adh\\u00e9sion</b>,\\u00a0afin d\\u2019<b>\\u00e9largir</b>\\u00a0et de\\u00a0<b>renforcer</b>\\u00a0notre communaut\\u00e9\\u00a0professionnelle.</p><p data-block-key=\\"5smrq\\"><b>Les objectifs de cette campagne sont\\u00a0les\\u00a0suivantes :</b></p><p data-block-key=\\"t3b8\\"><b>1.\\u00a0Faire appliquer les lois existantes</b>, en incitant tous les ing\\u00e9nieurs \\u00e0 s\\u2019inscrire sans d\\u00e9lai \\u00e0 l\\u2019OIC ;</p><p data-block-key=\\"a9f52\\"><b>2.\\u00a0Constituer une base\\u00a0de donn\\u00e9es nationale fiable</b>\\u00a0des ing\\u00e9nieurs en exercice en R\\u00e9publique du Congo ;</p><p data-block-key=\\"dpqtn\\"><b>3.\\u00a0Renforcer la gouvernance technique de l\\u2019\\u00c9tat</b>, en assurant une meilleure r\\u00e9gulation de la profession ;</p><p data-block-key=\\"6pnbi\\"><b>4.\\u00a0Lutter contre la prolif\\u00e9ration des faux dipl\\u00f4mes</b>, qui ternissent l\\u2019image de\\u00a0notre profession.\\u00a0</p><p data-block-key=\\"7enag\\">\\u00c0 l\\u2019issue de cette campagne,\\u00a0nous visons\\u00a0<b>au moins 300 nouvelles adh\\u00e9sions</b>\\u00a0pour franchir un cap d\\u00e9cisif dans la\\u00a0<b>structuration de l\\u2019ing\\u00e9nierie congolaise</b>.</p><ul><li data-block-key=\\"fg4te\\"><b>Monsieur le\\u00a0Directeur du cabinet du\\u00a0Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux,</b></li><li data-block-key=\\"gl5p\\"><b>Mesdames et Messieurs,</b></li></ul><p data-block-key=\\"a91tb\\">En promulguant les lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo,\\u00a0<b>Son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique\\u00a0</b>a dot\\u00e9 notre pays d\\u2019instruments juridiques n\\u00e9cessaires \\u00e0 l\\u2019organisation et \\u00e0 la structuration du secteur de l\\u2019ing\\u00e9nierie. Ces lois ouvrent des perspectives concr\\u00e8tes aux jeunes ing\\u00e9nieurs, en leur permettant\\u00a0de cr\\u00e9er leurs propres soci\\u00e9t\\u00e9s.\\u00a0</p><p data-block-key=\\"4djtj\\">\\u00c0 l\\u2019heure o\\u00f9 notre pays est confront\\u00e9 \\u00e0 des d\\u00e9fis majeurs dans des secteurs strat\\u00e9giques tels que le\\u00a0b\\u00e2timent et les travaux publics\\u00a0; les mines et l\\u2019\\u00e9nergie\\u00a0; les eaux et for\\u00eats\\u00a0;\\u00a0l\\u2019agriculture et l\\u2019environnement, il est imp\\u00e9ratif que l\\u2019ing\\u00e9nieur\\u00a0<b>occupe pleinement sa place dans toutes ces sph\\u00e8res d\\u2019activit\\u00e9s</b>.</p><p data-block-key=\\"1esma\\">C\\u2019est dans cette dynamique que nous\\u00a0pourrons affirmer\\u00a0avec conviction\\u00a0que<b>\\u00a0l\\u2019ing\\u00e9nieur</b> <b>est\\u00a0v\\u00e9ritablement au c\\u0153ur du d\\u00e9veloppement du Congo.</b></p><p data-block-key=\\"6d33f\\">Il est donc essentiel que l\\u2019\\u00c9tat mette en \\u0153uvre les outils juridiques d\\u00e9j\\u00e0 disponibles pour permettre \\u00e0 l\\u2019Ordre des Ing\\u00e9nieurs du Congo de mieux organiser, encadrer et professionnaliser l\\u2019ing\\u00e9nierie nationale. Car c\\u2019est par la\\u00a0<b>qualit\\u00e9, la s\\u00e9curit\\u00e9 et la durabilit\\u00e9</b>\\u00a0des ouvrages publics et priv\\u00e9s que nous pourrons r\\u00e9pondre efficacement aux besoins de la population et garantir un d\\u00e9veloppement harmonieux.</p><p data-block-key=\\"7jc83\\">Notre souhait est que l\\u2019ing\\u00e9nieur inscrit \\u00e0 l\\u2019Ordre devienne\\u00a0<b>le r\\u00e9f\\u00e9rent naturel des missions techniques de l\\u2019\\u00e9tat</b>\\u00a0et que les entreprises \\u00e9trang\\u00e8res op\\u00e9rant sur notre territoire se conforment \\u00e0 la loi en d\\u00e9clarant leurs ing\\u00e9nieurs aupr\\u00e8s de l\\u2019OIC.</p><p data-block-key=\\"5i8ld\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs,</b></p><p data-block-key=\\"8e3nt\\">L\\u2019adh\\u00e9sion \\u00e0 l\\u2019Ordre est \\u00e0 la fois une\\u00a0<b>obligation l\\u00e9gale</b>\\u00a0et un\\u00a0<b>devoir moral,\\u00a0</b>en vue\\u00a0d\\u2019en finir avec:\\u00a0<b>l\\u2019exercice ill\\u00e9gal de la profession</b>,\\u00a0<b>les faux dipl\\u00f4mes</b>,\\u00a0et aussi\\u00a0<b>l\\u2019imposture technocratique</b>,\\u00a0cette d\\u00e9rive qui donne \\u00e0 certains une\\u00a0<b>l\\u00e9gitimit\\u00e9 sans comp\\u00e9tence\\u00a0av\\u00e9r\\u00e9e</b>.</p><p data-block-key=\\"cf8tq\\">Cette campagne,\\u00a0c\\u2019est aussi l\\u2019occasion\\u00a0d\\u2019<b>informer</b>, de\\u00a0<b>sensibiliser</b>\\u00a0et de\\u00a0<b>convaincre</b>\\u00a0tous les ing\\u00e9nieurs, m\\u00eame ceux qui pensent, \\u00e0 tort,\\u00a0<b>ne pas \\u00eatre concern\\u00e9s</b>.\\u00a0</p><p data-block-key=\\"73ciu\\">Une fois\\u00a0cette phase termin\\u00e9e, nous passerons \\u00e0\\u00a0<b>l\\u2019application\\u00a0</b>des\\u00a0<b>lois et r\\u00e8glements en vigueur</b>.</p><p data-block-key=\\"1m07l\\">Alors,\\u00a0<br/><b>mobilisons-nous</b>,<br/><b>engageons-nous</b>,<br/><b>recensons-nous</b>,<br/><b>enfin,\\u00a0adh\\u00e9rons tous\\u00a0\\u00e0 l\\u2019OIC\\u00a0!</b></p><p data-block-key=\\"1p4mh\\">Avant de clore mon propos,\\u00a0je tiens \\u00e0 remercier tr\\u00e8s sinc\\u00e8rement les institutions, les personnes et partenaires qui ont contribu\\u00e9 \\u00e0 l\\u2019organisation de cette campagne nationaleparmi lesquelles\\u00a0<b>le Ministre d\\u2019Etat Jean Jacques BOUYA et l\\u2019honorable Blaise AMBETO.\\u00a0</b></p><p data-block-key=\\"80up\\"><b>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</b><br/><b>Vive\\u00a0l\\u2019OIC\\u00a0!</b><br/><b>Vive la R\\u00e9publique du\\u00a0Congo, notre ch\\u00e8re patrie\\u00a0!</b></p><p data-block-key=\\"e1jf6\\"><b>Je vous remercie.</b></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	21	51	1	Deuxième anniversaire de l’OIC
49	2026-02-28 10:19:10.336451+00	\N	1	{"pk": 19, "path": "000100040001000D", "depth": 4, "numchild": 0, "translation_key": "090435a9-f0a8-46b5-a4bb-f5d9b4e59b65", "locale": 1, "latest_revision": 46, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.693Z", "last_published_at": "2026-02-28T10:12:19.072Z", "live_revision": 46, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Regards d'ing\\u00e9nieurs", "draft_title": "Regards d'ing\\u00e9nieurs", "slug": "regards-dingenieurs", "content_type": 51, "url_path": "/accueil/blog/regards-dingenieurs/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T10:12:19.049Z", "alias_of": null, "date": "2025-04-29", "intro": "<p data-block-key=\\"abqpi\\">Cette rubrique explore, d\\u2019un point de vue technique, les grands d\\u00e9fis auxquels nos villes sont confront\\u00e9es.</p>", "body": "<p data-block-key=\\"6m2ni\\">Cette rubrique explore, d\\u2019un point de vue technique, les grands d\\u00e9fis auxquels nos villes sont confront\\u00e9es.<br/>Nous donnons la parole aux ing\\u00e9nieurs pour analyser des probl\\u00e9matiques telles que :</p><ul><li data-block-key=\\"e1n3j\\">L\\u2019ensablement des routes et des infrastructures ;</li><li data-block-key=\\"acprn\\">L\\u2019\\u00e9rosion des sols et ses cons\\u00e9quences sur l\\u2019urbanisation ;</li><li data-block-key=\\"am287\\">Les inondations et les strat\\u00e9gies de gestion des eaux pluviales ;</li><li data-block-key=\\"fminm\\">L\\u2019approvisionnement en \\u00e9lectricit\\u00e9 et en eau potable ;</li><li data-block-key=\\"b2mff\\">La pr\\u00e9sence de caniveaux \\u00e0 ciel ouvert et les solutions d\\u2019assainissement urbain ;</li><li data-block-key=\\"66d0o\\">La maintenance des infrastructures et des \\u00e9quipements publics co\\u00fbteusement r\\u00e9alis\\u00e9s ;</li><li data-block-key=\\"2fr6v\\">La ma\\u00eetrise des co\\u00fbts de construction et de r\\u00e9habilitation ;</li><li data-block-key=\\"d3ckf\\">Les expertises d\\u2019expropriation et les \\u00e9valuations fonci\\u00e8res.</li></ul><p data-block-key=\\"cai6\\">\\u00c0 travers des analyses, des \\u00e9tudes de cas et des propositions concr\\u00e8tes, nous mettons en avant l\\u2019expertise technique n\\u00e9cessaire pour construire des villes plus r\\u00e9silientes et durables.</p>", "image": null, "featured": true, "wagtail_admin_comments": [], "tagged_items": [], "categories": [2]}	19	51	1	Regards d'ingénieurs
50	2026-02-28 10:21:18.661661+00	\N	1	{"pk": 6, "path": "000100040001", "depth": 3, "numchild": 16, "translation_key": "8ec30db4-4a3c-4891-b3c7-ee48d0fce065", "locale": 1, "latest_revision": 4, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.124Z", "last_published_at": "2026-02-24T15:25:52.124Z", "live_revision": 4, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Actualit\\u00e9", "draft_title": "Blog", "slug": "blog", "content_type": 50, "url_path": "/accueil/blog/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.114Z", "alias_of": null, "intro": "", "wagtail_admin_comments": []}	6	50	1	Actualité
51	2026-03-03 10:44:49.348775+00	\N	1	{"pk": 6, "path": "000100040001", "depth": 3, "numchild": 16, "translation_key": "8ec30db4-4a3c-4891-b3c7-ee48d0fce065", "locale": 1, "latest_revision": 50, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.124Z", "last_published_at": "2026-02-28T10:21:18.684Z", "live_revision": 50, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Actualit\\u00e9", "draft_title": "Actualit\\u00e9", "slug": "blog", "content_type": 50, "url_path": "/accueil/blog/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T10:21:18.661Z", "alias_of": null, "intro": "<p data-block-key=\\"526zl\\">Toutes nos actualit\\u00e9s</p>", "wagtail_admin_comments": []}	6	50	1	Actualité
52	2026-03-03 11:10:48.743935+00	\N	1	{"pk": 25, "path": "000100040003", "depth": 3, "numchild": 0, "translation_key": "b2e1ff78-f7b2-475e-a154-17eff9b5d3ea", "locale": 1, "latest_revision": 26, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T12:33:42.922Z", "last_published_at": "2026-02-25T12:33:42.922Z", "live_revision": 26, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale", "slug": "assembl\\u00e9e-g\\u00e9n\\u00e9rale", "content_type": 58, "url_path": "/accueil/assembl\\u00e9e-g\\u00e9n\\u00e9rale/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T12:33:42.905Z", "alias_of": null, "hero_image": 12, "hero_alt": "", "show_toc": true, "intro": "<p data-block-key=\\"uindk\\">L\\u2019assembl\\u00e9e g\\u00e9n\\u00e9rale regroupe l\\u2019ensemble des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre. Elle est l\\u2019instance supr\\u00eame de l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</p><p data-block-key=\\"1ljhg\\">Elle est charg\\u00e9e notamment de :</p><ul><li data-block-key=\\"393oc\\">proc\\u00e9der \\u00e0 l\\u2019\\u00e9lection des membres du conseil national de l\\u2019Ordre ;</li><li data-block-key=\\"8abbp\\">adopter les rapports du conseil national de l\\u2019Ordre ;</li><li data-block-key=\\"9bkiq\\">approuver les comptes de gestion et les comptes administratifs du conseil national de l\\u2019Ordre de l\\u2019ann\\u00e9e \\u00e9coul\\u00e9e ;</li><li data-block-key=\\"fe3oq\\">adopter les projets de d\\u00e9lib\\u00e9rations et de recommandations du conseil national de l\\u2019Ordre ;</li><li data-block-key=\\"40pii\\">approuver les d\\u00e9cisions d\\u2019acceptation ou de refus d\\u2019inscription au tableau de l\\u2019Ordre des nouveaux membres ;</li><li data-block-key=\\"3osp\\">voter le budget de l\\u2019Ordre ;</li><li data-block-key=\\"21ir0\\">adopter le r\\u00e8glement int\\u00e9rieur de l\\u2019Ordre ;</li><li data-block-key=\\"4p1d4\\">fixer les montants des cotisations ;</li><li data-block-key=\\"cdch\\">approuver les orientations de la politique de l\\u2019Ordre.</li></ul>", "body": "[]", "wagtail_admin_comments": []}	25	58	1	Assemblée générale
53	2026-03-03 11:11:59.630547+00	\N	1	{"pk": 21, "path": "000100040001000F", "depth": 4, "numchild": 0, "translation_key": "c2235f9c-c802-4377-a68a-c95effbe7c8b", "locale": 1, "latest_revision": 48, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.767Z", "last_published_at": "2026-02-28T10:18:54.664Z", "live_revision": 48, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "draft_title": "Deuxi\\u00e8me anniversaire de l\\u2019OIC", "slug": "deuxieme-anniversaire-de-loic", "content_type": 51, "url_path": "/accueil/blog/deuxieme-anniversaire-de-loic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T10:18:54.640Z", "alias_of": null, "date": "2025-07-12", "intro": "<p data-block-key=\\"5tx5u\\"><b>Mot du pr\\u00e9sident de l'Ordre des Ing\\u00e9nieurs du Congo (OIC), \\u00e0 l'occasion du lancement de la campagne nationale de recensement et d'adh\\u00e9sion coupl\\u00e9e au deuxi\\u00e8me anniversaire de l'OIC.</b></p>", "body": "<p data-block-key=\\"y23u6\\"><b>MOT DU PRESIDENT DE L\\u2019ORDRE DES INGENIEURS DU CONGO (OIC), \\u00c0\\u00a0L\\u2019OCCASIONDU LANCEMENT DE LA CAMPAGNE NATIONALE DE RECENSEMENT ET D\\u2019ADHESION COUPLEE AU DEUXIEME ANNIVERSAIRE DE L\\u2019OIC</b></p><p data-block-key=\\"bnjv\\"><i>Brazzaville, le 12 juillet 2025</i></p><ul><li data-block-key=\\"coa2f\\"><b>Monsieur le\\u00a0Directeur du cabinet du\\u00a0Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux ;</b></li><li data-block-key=\\"5lgtq\\"><b>Honorable D\\u00e9put\\u00e9 Blaise AMBETO ;</b></li><li data-block-key=\\"f59mt\\"><b>Messieurs les repr\\u00e9sentants des\\u00a0membres du Gouvernement ;</b></li><li data-block-key=\\"brre5\\"><b>Monsieur le\\u00a0Pr\\u00e9sident du Conseil Municipal, D\\u00e9put\\u00e9-Maire de la Ville de Brazzaville\\u00a0;</b></li><li data-block-key=\\"bimuc\\"><b>Mesdames et Messieurs les membres du Conseil national de l\\u2019OIC ;</b></li><li data-block-key=\\"fe2pa\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs ;</b></li><li data-block-key=\\"1ag0v\\"><b>Distingu\\u00e9s invit\\u00e9s\\u00a0!</b></li></ul><p data-block-key=\\"5lea8\\">En ce\\u00a0<b>jour symbolique</b>, marquant le\\u00a0<b>deuxi\\u00e8me anniversaire</b>de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, permettez-moi, au nom de l\\u2019ensemble des membres de l\\u2019OIC, et en mon nom propre, d\\u2019exprimer notre\\u00a0<b>profonde gratitude</b>\\u00a0pour votre pr\\u00e9sence \\u00e0 cette\\u00a0<b>c\\u00e9r\\u00e9monie solennelle</b>\\u00a0de\\u00a0<b>lancement de la campagne nationale de recensement et d\\u2019adh\\u00e9sion</b>\\u00a0des ing\\u00e9nieurs exer\\u00e7ant en R\\u00e9publique du Congo.</p><p data-block-key=\\"efc8r\\">Souvenons-nous\\u00a0;\\u00a0\\u00a0<br/>Le\\u00a0<b>28 f\\u00e9vrier dernier</b>, dans cette m\\u00eame salle, nous proc\\u00e9dions \\u00e0 la\\u00a0<b>publication du tout premier tableau officiel</b>\\u00a0des ing\\u00e9nieurs inscrits \\u00e0 l\\u2019OIC, suivie d\\u2019une\\u00a0<b>c\\u00e9r\\u00e9monie historique de prestation de serment</b>.</p><p data-block-key=\\"61pl4\\">Ce moment\\u00a0<b>charg\\u00e9 d\\u2019\\u00e9motion et de responsabilit\\u00e9</b>\\u00a0restera, pour nous,\\u00a0un\\u00a0<b>jalon fondateur</b>\\u00a0dans l\\u2019histoire de notre profession.\\u00a0</p><p data-block-key=\\"acn4t\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo est une institution\\u00a0<b>jeune</b>,<br/>mais\\u00a0<b>r\\u00e9solument tourn\\u00e9e vers l\\u2019avenir</b>.</p><p data-block-key=\\"fbj4h\\">\\u00c0 ce jour,\\u00a0<b>154 ing\\u00e9nieurs</b>\\u00a0ont \\u00e9t\\u00e9 officiellement enregistr\\u00e9s.<br/>Ce chiffre, bien qu\\u2019<b>encourageant</b>, reste\\u00a0<b>nettement en dessous du potentiel national</b>.</p><p data-block-key=\\"d8s9c\\">Il r\\u00e9v\\u00e8le surtout que la\\u00a0<b>majorit\\u00e9 des ing\\u00e9nieurs en activit\\u00e9</b>op\\u00e8rent encore\\u00a0<b>en dehors du cadre l\\u00e9gal</b>. Ceci, tant\\u00f4t\\u00a0<b>par ignorance</b>,\\u00a0tant\\u00f4t\\u00a0<b>par n\\u00e9gligence</b>, et\\u00a0tant\\u00f4t\\u00a0m\\u00eame\\u00a0<b>en d\\u00e9fi de la loi</b>\\u00a0portant cr\\u00e9ation de notre Ordre.</p><p data-block-key=\\"f01j2\\">Face \\u00e0 cette r\\u00e9alit\\u00e9, le Conseil national a d\\u00e9cid\\u00e9 de lancer une\\u00a0<b>vaste campagne nationale de recensement et d\\u2019adh\\u00e9sion</b>,\\u00a0afin d\\u2019<b>\\u00e9largir</b>\\u00a0et de\\u00a0<b>renforcer</b>\\u00a0notre communaut\\u00e9\\u00a0professionnelle.</p><p data-block-key=\\"5smrq\\"><b>Les objectifs de cette campagne sont\\u00a0les\\u00a0suivantes :</b></p><p data-block-key=\\"t3b8\\"><b>1.\\u00a0Faire appliquer les lois existantes</b>, en incitant tous les ing\\u00e9nieurs \\u00e0 s\\u2019inscrire sans d\\u00e9lai \\u00e0 l\\u2019OIC ;</p><p data-block-key=\\"a9f52\\"><b>2.\\u00a0Constituer une base\\u00a0de donn\\u00e9es nationale fiable</b>\\u00a0des ing\\u00e9nieurs en exercice en R\\u00e9publique du Congo ;</p><p data-block-key=\\"dpqtn\\"><b>3.\\u00a0Renforcer la gouvernance technique de l\\u2019\\u00c9tat</b>, en assurant une meilleure r\\u00e9gulation de la profession ;</p><p data-block-key=\\"6pnbi\\"><b>4.\\u00a0Lutter contre la prolif\\u00e9ration des faux dipl\\u00f4mes</b>, qui ternissent l\\u2019image de\\u00a0notre profession.\\u00a0</p><p data-block-key=\\"7enag\\">\\u00c0 l\\u2019issue de cette campagne,\\u00a0nous visons\\u00a0<b>au moins 300 nouvelles adh\\u00e9sions</b>\\u00a0pour franchir un cap d\\u00e9cisif dans la\\u00a0<b>structuration de l\\u2019ing\\u00e9nierie congolaise</b>.</p><ul><li data-block-key=\\"fg4te\\"><b>Monsieur le\\u00a0Directeur du cabinet du\\u00a0Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux,</b></li><li data-block-key=\\"gl5p\\"><b>Mesdames et Messieurs,</b></li></ul><p data-block-key=\\"a91tb\\">En promulguant les lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo,\\u00a0<b>Son Excellence Monsieur le Pr\\u00e9sident de la R\\u00e9publique\\u00a0</b>a dot\\u00e9 notre pays d\\u2019instruments juridiques n\\u00e9cessaires \\u00e0 l\\u2019organisation et \\u00e0 la structuration du secteur de l\\u2019ing\\u00e9nierie. Ces lois ouvrent des perspectives concr\\u00e8tes aux jeunes ing\\u00e9nieurs, en leur permettant\\u00a0de cr\\u00e9er leurs propres soci\\u00e9t\\u00e9s.\\u00a0</p><p data-block-key=\\"4djtj\\">\\u00c0 l\\u2019heure o\\u00f9 notre pays est confront\\u00e9 \\u00e0 des d\\u00e9fis majeurs dans des secteurs strat\\u00e9giques tels que le\\u00a0b\\u00e2timent et les travaux publics\\u00a0; les mines et l\\u2019\\u00e9nergie\\u00a0; les eaux et for\\u00eats\\u00a0;\\u00a0l\\u2019agriculture et l\\u2019environnement, il est imp\\u00e9ratif que l\\u2019ing\\u00e9nieur\\u00a0<b>occupe pleinement sa place dans toutes ces sph\\u00e8res d\\u2019activit\\u00e9s</b>.</p><p data-block-key=\\"1esma\\">C\\u2019est dans cette dynamique que nous\\u00a0pourrons affirmer\\u00a0avec conviction\\u00a0que<b>\\u00a0l\\u2019ing\\u00e9nieur</b> <b>est\\u00a0v\\u00e9ritablement au c\\u0153ur du d\\u00e9veloppement du Congo.</b></p><p data-block-key=\\"6d33f\\">Il est donc essentiel que l\\u2019\\u00c9tat mette en \\u0153uvre les outils juridiques d\\u00e9j\\u00e0 disponibles pour permettre \\u00e0 l\\u2019Ordre des Ing\\u00e9nieurs du Congo de mieux organiser, encadrer et professionnaliser l\\u2019ing\\u00e9nierie nationale. Car c\\u2019est par la\\u00a0<b>qualit\\u00e9, la s\\u00e9curit\\u00e9 et la durabilit\\u00e9</b>\\u00a0des ouvrages publics et priv\\u00e9s que nous pourrons r\\u00e9pondre efficacement aux besoins de la population et garantir un d\\u00e9veloppement harmonieux.</p><p data-block-key=\\"7jc83\\">Notre souhait est que l\\u2019ing\\u00e9nieur inscrit \\u00e0 l\\u2019Ordre devienne\\u00a0<b>le r\\u00e9f\\u00e9rent naturel des missions techniques de l\\u2019\\u00e9tat</b>\\u00a0et que les entreprises \\u00e9trang\\u00e8res op\\u00e9rant sur notre territoire se conforment \\u00e0 la loi en d\\u00e9clarant leurs ing\\u00e9nieurs aupr\\u00e8s de l\\u2019OIC.</p><p data-block-key=\\"5i8ld\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs,</b></p><p data-block-key=\\"8e3nt\\">L\\u2019adh\\u00e9sion \\u00e0 l\\u2019Ordre est \\u00e0 la fois une\\u00a0<b>obligation l\\u00e9gale</b>\\u00a0et un\\u00a0<b>devoir moral,\\u00a0</b>en vue\\u00a0d\\u2019en finir avec:\\u00a0<b>l\\u2019exercice ill\\u00e9gal de la profession</b>,\\u00a0<b>les faux dipl\\u00f4mes</b>,\\u00a0et aussi\\u00a0<b>l\\u2019imposture technocratique</b>,\\u00a0cette d\\u00e9rive qui donne \\u00e0 certains une\\u00a0<b>l\\u00e9gitimit\\u00e9 sans comp\\u00e9tence\\u00a0av\\u00e9r\\u00e9e</b>.</p><p data-block-key=\\"cf8tq\\">Cette campagne,\\u00a0c\\u2019est aussi l\\u2019occasion\\u00a0d\\u2019<b>informer</b>, de\\u00a0<b>sensibiliser</b>\\u00a0et de\\u00a0<b>convaincre</b>\\u00a0tous les ing\\u00e9nieurs, m\\u00eame ceux qui pensent, \\u00e0 tort,\\u00a0<b>ne pas \\u00eatre concern\\u00e9s</b>.\\u00a0</p><p data-block-key=\\"73ciu\\">Une fois\\u00a0cette phase termin\\u00e9e, nous passerons \\u00e0\\u00a0<b>l\\u2019application\\u00a0</b>des\\u00a0<b>lois et r\\u00e8glements en vigueur</b>.</p><p data-block-key=\\"1m07l\\">Alors,\\u00a0<br/><b>mobilisons-nous</b>,<br/><b>engageons-nous</b>,<br/><b>recensons-nous</b>,<br/><b>enfin,\\u00a0adh\\u00e9rons tous\\u00a0\\u00e0 l\\u2019OIC\\u00a0!</b></p><p data-block-key=\\"1p4mh\\">Avant de clore mon propos,\\u00a0je tiens \\u00e0 remercier tr\\u00e8s sinc\\u00e8rement les institutions, les personnes et partenaires qui ont contribu\\u00e9 \\u00e0 l\\u2019organisation de cette campagne nationaleparmi lesquelles\\u00a0<b>le Ministre d\\u2019Etat Jean Jacques BOUYA et l\\u2019honorable Blaise AMBETO.\\u00a0</b></p><p data-block-key=\\"80up\\"><b>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo.</b><br/><b>Vive\\u00a0l\\u2019OIC\\u00a0!</b><br/><b>Vive la R\\u00e9publique du\\u00a0Congo, notre ch\\u00e8re patrie\\u00a0!</b></p><p data-block-key=\\"e1jf6\\"><b>Je vous remercie.</b></p>", "image": 12, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	21	51	1	Deuxième anniversaire de l’OIC
54	2026-03-03 13:35:10.591028+00	\N	1	{"pk": 17, "path": "000100040001000B", "depth": 4, "numchild": 0, "translation_key": "f316ed49-94ec-4cba-9501-e75734cb4916", "locale": 1, "latest_revision": 44, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.620Z", "last_published_at": "2026-02-28T09:58:34.404Z", "live_revision": 44, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "draft_title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "slug": "remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo", "content_type": 51, "url_path": "/accueil/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:58:34.381Z", "alias_of": null, "date": "2025-02-08", "intro": "<p data-block-key=\\"5f4er\\">Le Ministre d\\u2019\\u00c9tat a rappel\\u00e9 que les ing\\u00e9nieurs ont le devoir de contribuer au progr\\u00e8s et \\u00e0 la prosp\\u00e9rit\\u00e9 du Congo, en \\u00e9cho \\u00e0 la vision du Pr\\u00e9sident de la R\\u00e9publique, Denis Sassou Nguesso. Par ailleurs, l\\u2019Honorable Blaise Ambeto, initiateur des lois fonda</p>", "body": "<p data-block-key=\\"3rcwy\\">En reprenant les paroles du Pr\\u00e9sident de l'Ordre - <b>\\u00ab Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9 \\u00bb</b> - le Ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux, a rappel\\u00e9 aux ing\\u00e9nieurs que ces mots r\\u00e9sonnent profond\\u00e9ment avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Pr\\u00e9sident de la R\\u00e9publique, Chef de l'Etat.</p><p data-block-key=\\"9rede\\"></p><p data-block-key=\\"3pqv2\\">L\\u2019Honorable Blaise AMBETO, porteur des lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, a solennellement proclam\\u00e9 le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux, <b>parrain de l\\u2019Ordre</b>, lors de la remise officielle du tout premier tableau.</p>", "image": 1, "featured": true, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	17	51	1	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
55	2026-03-03 13:35:45.825418+00	\N	1	{"pk": 17, "path": "000100040001000B", "depth": 4, "numchild": 0, "translation_key": "f316ed49-94ec-4cba-9501-e75734cb4916", "locale": 1, "latest_revision": 54, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.620Z", "last_published_at": "2026-03-03T13:35:10.609Z", "live_revision": 54, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "draft_title": "Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO", "slug": "remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo", "content_type": 51, "url_path": "/accueil/blog/remise-du-premier-tableau-de-loic-au-ministre-detat-jean-jacques-bouya-parrain-des-ingenieurs-du-congo/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-03T13:35:10.591Z", "alias_of": null, "date": "2025-02-08", "intro": "<p data-block-key=\\"5f4er\\">Le Ministre d\\u2019\\u00c9tat a rappel\\u00e9 que les ing\\u00e9nieurs ont le devoir de contribuer au progr\\u00e8s et \\u00e0 la prosp\\u00e9rit\\u00e9 du Congo, en \\u00e9cho \\u00e0 la vision du Pr\\u00e9sident de la R\\u00e9publique, Denis Sassou Nguesso. Par ailleurs, l\\u2019Honorable Blaise Ambeto, initiateur des lois fonda</p>", "body": "<p data-block-key=\\"3rcwy\\">En reprenant les paroles du Pr\\u00e9sident de l'Ordre - <b>\\u00ab Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9 \\u00bb</b> - le Ministre d'Etat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux, a rappel\\u00e9 aux ing\\u00e9nieurs que ces mots r\\u00e9sonnent profond\\u00e9ment avec la vision de Son Excellence Monsieur Denis SASSOU NGUESSO, Pr\\u00e9sident de la R\\u00e9publique, Chef de l'Etat.</p><p data-block-key=\\"9rede\\"></p><p data-block-key=\\"3pqv2\\">L\\u2019Honorable Blaise AMBETO, porteur des lois fondatrices de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, a solennellement proclam\\u00e9 le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux, <b>parrain de l\\u2019Ordre</b>, lors de la remise officielle du tout premier tableau.</p>", "image": 1, "featured": true, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	17	51	1	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
56	2026-03-03 13:36:52.630908+00	\N	1	{"pk": 7, "path": "0001000400010001", "depth": 4, "numchild": 0, "translation_key": "7572fc94-fac6-4e56-b6f0-459e8d78c3e3", "locale": 1, "latest_revision": 5, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.180Z", "last_published_at": "2026-02-24T15:25:52.180Z", "live_revision": 5, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire de l'OIC", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire de l'OIC", "slug": "assemblee-generale-du-29-mars-2025", "content_type": 51, "url_path": "/accueil/blog/assemblee-generale-du-29-mars-2025/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.171Z", "alias_of": null, "date": "2025-03-29", "intro": "<p data-block-key=\\"ljqsp\\">Le 29 mars 2025, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son assembl\\u00e9e g\\u00e9n\\u00e9rale dite budg\\u00e9taire \\u00e0 l'H\\u00f4tel PEFACO. Cette rencontre strat\\u00e9gique a r\\u00e9uni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'ann\\u00e9e 2025.</p>", "body": "<p data-block-key=\\"8jlfr\\">Le 29 mars 2025, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son assembl\\u00e9e g\\u00e9n\\u00e9rale dite budg\\u00e9taire \\u00e0 l'H\\u00f4tel PEFACO. Cette rencontre strat\\u00e9gique a r\\u00e9uni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'ann\\u00e9e 2025.</p><p data-block-key=\\"h3bx3\\">Screenshot</p><p data-block-key=\\"ld0jv\\">Sous la pr\\u00e9sidence du bureau ex\\u00e9cutif de l'OIC, l'assembl\\u00e9e g\\u00e9n\\u00e9rale a permis de passer en revue les priorit\\u00e9s de l'ann\\u00e9e \\u00e0 venir, en tenant compte des d\\u00e9fis et des perspectives du secteur de l'ing\\u00e9nierie au Congo.</p><p data-block-key=\\"v3vdv\\">Au cours de cette assembl\\u00e9e, le programme 2025 a \\u00e9t\\u00e9 pr\\u00e9sent\\u00e9 et d\\u00e9battu par les membres pr\\u00e9sents. Apr\\u00e8s des \\u00e9changes constructifs et des propositions d'am\\u00e9lioration, le programme a \\u00e9t\\u00e9 adopt\\u00e9 \\u00e0 l'unanimit\\u00e9.</p><p data-block-key=\\"2yqxr\\">Le point central de l'assembl\\u00e9e \\u00e9tait l'examen du budget pr\\u00e9visionnel pour l'ann\\u00e9e 2025. Le budget, fix\\u00e9 \\u00e0 52 millions de francs CFA, a \\u00e9t\\u00e9 minutieusement discut\\u00e9 avant d'\\u00eatre soumis au vote. Les membres ont pris le temps d'\\u00e9valuer les diff\\u00e9rentes rubriques budg\\u00e9taires et ont approuv\\u00e9 ce budget, qui vise \\u00e0 renforcer les actions de l'OIC en faveur du d\\u00e9veloppement professionnel des ing\\u00e9nieurs.</p><p data-block-key=\\"dlwlj\\">En plus de l'adoption du budget et du programme, l'assembl\\u00e9e g\\u00e9n\\u00e9rale a \\u00e9t\\u00e9 marqu\\u00e9e par des d\\u00e9lib\\u00e9rations sur divers sujets li\\u00e9s aux activit\\u00e9s futures de l'organisation et aux projets en cours.</p><p data-block-key=\\"iwa9h\\">Cette rencontre t\\u00e9moigne de l'engagement de l'OIC \\u00e0 assurer une gestion rigoureuse et transparente de ses ressources financi\\u00e8res, tout en poursuivant ses actions en faveur de l'am\\u00e9lioration continue des comp\\u00e9tences des ing\\u00e9nieurs congolais.</p><p data-block-key=\\"9n371\\">L'Ordre des Ing\\u00e9nieurs du Congo remercie tous les participants pour leur implication et leur volont\\u00e9 de contribuer \\u00e0 la r\\u00e9alisation des objectifs de l'ann\\u00e9e 2025.</p>", "image": 1, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	7	51	1	Assemblée générale budgétaire de l'OIC
57	2026-03-03 13:37:01.238075+00	\N	1	{"pk": 7, "path": "0001000400010001", "depth": 4, "numchild": 0, "translation_key": "7572fc94-fac6-4e56-b6f0-459e8d78c3e3", "locale": 1, "latest_revision": 56, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.180Z", "last_published_at": "2026-03-03T13:36:52.652Z", "live_revision": 56, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire de l'OIC", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale budg\\u00e9taire de l'OIC", "slug": "assemblee-generale-du-29-mars-2025", "content_type": 51, "url_path": "/accueil/blog/assemblee-generale-du-29-mars-2025/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-03T13:36:52.630Z", "alias_of": null, "date": "2025-03-29", "intro": "<p data-block-key=\\"ljqsp\\">Le 29 mars 2025, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son assembl\\u00e9e g\\u00e9n\\u00e9rale dite budg\\u00e9taire \\u00e0 l'H\\u00f4tel PEFACO. Cette rencontre strat\\u00e9gique a r\\u00e9uni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'ann\\u00e9e 2025.</p>", "body": "<p data-block-key=\\"8jlfr\\">Le 29 mars 2025, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son assembl\\u00e9e g\\u00e9n\\u00e9rale dite budg\\u00e9taire \\u00e0 l'H\\u00f4tel PEFACO. Cette rencontre strat\\u00e9gique a r\\u00e9uni les membres de l'organisation autour de l'examen et de l'adoption du programme annuel ainsi que du budget pour l'ann\\u00e9e 2025.</p><p data-block-key=\\"h3bx3\\">Screenshot</p><p data-block-key=\\"ld0jv\\">Sous la pr\\u00e9sidence du bureau ex\\u00e9cutif de l'OIC, l'assembl\\u00e9e g\\u00e9n\\u00e9rale a permis de passer en revue les priorit\\u00e9s de l'ann\\u00e9e \\u00e0 venir, en tenant compte des d\\u00e9fis et des perspectives du secteur de l'ing\\u00e9nierie au Congo.</p><p data-block-key=\\"v3vdv\\">Au cours de cette assembl\\u00e9e, le programme 2025 a \\u00e9t\\u00e9 pr\\u00e9sent\\u00e9 et d\\u00e9battu par les membres pr\\u00e9sents. Apr\\u00e8s des \\u00e9changes constructifs et des propositions d'am\\u00e9lioration, le programme a \\u00e9t\\u00e9 adopt\\u00e9 \\u00e0 l'unanimit\\u00e9.</p><p data-block-key=\\"2yqxr\\">Le point central de l'assembl\\u00e9e \\u00e9tait l'examen du budget pr\\u00e9visionnel pour l'ann\\u00e9e 2025. Le budget, fix\\u00e9 \\u00e0 52 millions de francs CFA, a \\u00e9t\\u00e9 minutieusement discut\\u00e9 avant d'\\u00eatre soumis au vote. Les membres ont pris le temps d'\\u00e9valuer les diff\\u00e9rentes rubriques budg\\u00e9taires et ont approuv\\u00e9 ce budget, qui vise \\u00e0 renforcer les actions de l'OIC en faveur du d\\u00e9veloppement professionnel des ing\\u00e9nieurs.</p><p data-block-key=\\"dlwlj\\">En plus de l'adoption du budget et du programme, l'assembl\\u00e9e g\\u00e9n\\u00e9rale a \\u00e9t\\u00e9 marqu\\u00e9e par des d\\u00e9lib\\u00e9rations sur divers sujets li\\u00e9s aux activit\\u00e9s futures de l'organisation et aux projets en cours.</p><p data-block-key=\\"iwa9h\\">Cette rencontre t\\u00e9moigne de l'engagement de l'OIC \\u00e0 assurer une gestion rigoureuse et transparente de ses ressources financi\\u00e8res, tout en poursuivant ses actions en faveur de l'am\\u00e9lioration continue des comp\\u00e9tences des ing\\u00e9nieurs congolais.</p><p data-block-key=\\"9n371\\">L'Ordre des Ing\\u00e9nieurs du Congo remercie tous les participants pour leur implication et leur volont\\u00e9 de contribuer \\u00e0 la r\\u00e9alisation des objectifs de l'ann\\u00e9e 2025.</p>", "image": 1, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": [1]}	7	51	1	Assemblée générale budgétaire de l'OIC
58	2026-03-03 13:57:50.399875+00	\N	1	{"pk": 18, "path": "000100040001000C", "depth": 4, "numchild": 0, "translation_key": "e693b89e-80d3-46e2-b735-6ae86983019a", "locale": 1, "latest_revision": 16, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.655Z", "last_published_at": "2026-02-24T15:25:52.655Z", "live_revision": 16, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "draft_title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "slug": "ingenieur-bikouta", "content_type": 51, "url_path": "/accueil/blog/ingenieur-bikouta/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.646Z", "alias_of": null, "date": "2025-04-28", "intro": "<p data-block-key=\\"zxhxh\\">Un acteur cl\\u00e9 du d\\u00e9veloppement des projets MEP au Congo</p><p data-block-key=\\"dkikc\\">Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,\\u00a0<b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b>\\u00a0s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p>", "body": "<p data-block-key=\\"0uhik\\">Un ing\\u00e9nieur, un impact</p><p data-block-key=\\"q6tku\\"></p><h2 data-block-key=\\"xxw5u\\">Un acteur cl\\u00e9 du d\\u00e9veloppement des projets MEP au Congo</h2><p data-block-key=\\"89n9k\\">Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,\\u00a0<b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b>\\u00a0s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p><h2 data-block-key=\\"o4fxs\\">Ses missions</h2><p data-block-key=\\"oc9zt\\">Au c\\u0153ur de ses interventions :</p><ul><li data-block-key=\\"6cv6x\\">Le\\u00a0<b>contr\\u00f4le technique</b>\\u00a0des installations MEP</li><li data-block-key=\\"hk1o2\\">La\\u00a0<b>conception et les \\u00e9tudes</b>\\u00a0des syst\\u00e8mes de b\\u00e2timent</li><li data-block-key=\\"e9kme\\">La\\u00a0<b>coordination des \\u00e9quipes techniques</b>\\u00a0sur le terrain</li></ul><h2 data-block-key=\\"zbg5g\\">Projets embl\\u00e9matiques</h2><p data-block-key=\\"granf\\"><b>Sur le terrain, ses comp\\u00e9tences parlent d\\u2019elles-m\\u00eames :</b></p><ul><li data-block-key=\\"dizoq\\"><b>COTEXA CONGO - Projet PSTAT :</b><br/>Contr\\u00f4leur technique des lots MEP</li><li data-block-key=\\"lj9i5\\"><b>COTEXA CONGO - R\\u00e9habilitation du si\\u00e8ge de la BDEAC :</b><br/>Contr\\u00f4leur technique des lots MEP</li><li data-block-key=\\"ijrbr\\"><b>MBTP - Construction de la Tour ACACIA :</b><br/>Ing\\u00e9nieur-assistant des \\u00e9tudes MEP</li><li data-block-key=\\"qfkx9\\"><b>DAE - Construction de la base BRALICO (proximit\\u00e9 a\\u00e9roport Maya-Maya, Brazzaville) :</b><br/>Responsable des \\u00e9tudes techniques MEP</li></ul><h2 data-block-key=\\"yfa18\\">Une expertise au service de l\\u2019excellence</h2><p data-block-key=\\"31eu6\\">Fort de son expertise, l\\u2019ing\\u00e9nieur BIKOUTA BIAHOUA place la qualit\\u00e9, l'innovation et la ma\\u00eetrise technique au centre de chacun de ses projets. Sa contribution renforce la dynamique de modernisation des infrastructures au Congo et inspire les nouvelles g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs.</p><h2 data-block-key=\\"yulbo\\">Contactez-le</h2><p data-block-key=\\"n5qmh\\">T\\u00e9l./WhatsApp : <a href=\\"tel:242069951028\\">+242 06 995 10 28</a> / <a href=\\"https://wa.me/242067033232\\">+242 06 703 32 32</a></p><p data-block-key=\\"6hd17\\">Email : <a href=\\"mailto:dondedieubikouta@gmail.com\\">dondedieubikouta@gmail.com</a></p><p data-block-key=\\"ix4pz\\">LinkedIn : <a href=\\"https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161\\">https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161</a></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	18	51	1	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
59	2026-03-03 13:58:52.332295+00	\N	1	{"pk": 18, "path": "000100040001000C", "depth": 4, "numchild": 0, "translation_key": "e693b89e-80d3-46e2-b735-6ae86983019a", "locale": 1, "latest_revision": 58, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.655Z", "last_published_at": "2026-03-03T13:57:50.421Z", "live_revision": 58, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "draft_title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "slug": "ingenieur-bikouta", "content_type": 51, "url_path": "/accueil/blog/ingenieur-bikouta/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-03T13:57:50.399Z", "alias_of": null, "date": "2025-04-28", "intro": "<p data-block-key=\\"zxhxh\\">Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,\\u00a0<b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b>\\u00a0s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p>", "body": "<p data-block-key=\\"0uhik\\">Un ing\\u00e9nieur, un impact</p><p data-block-key=\\"q6tku\\"></p><h2 data-block-key=\\"xxw5u\\">Un acteur cl\\u00e9 du d\\u00e9veloppement des projets MEP au Congo</h2><p data-block-key=\\"89n9k\\">Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,\\u00a0<b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b>\\u00a0s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p><h2 data-block-key=\\"o4fxs\\">Ses missions</h2><p data-block-key=\\"oc9zt\\">Au c\\u0153ur de ses interventions :</p><ul><li data-block-key=\\"6cv6x\\">Le\\u00a0<b>contr\\u00f4le technique</b>\\u00a0des installations MEP</li><li data-block-key=\\"hk1o2\\">La\\u00a0<b>conception et les \\u00e9tudes</b>\\u00a0des syst\\u00e8mes de b\\u00e2timent</li><li data-block-key=\\"e9kme\\">La\\u00a0<b>coordination des \\u00e9quipes techniques</b>\\u00a0sur le terrain</li></ul><h2 data-block-key=\\"zbg5g\\">Projets embl\\u00e9matiques</h2><p data-block-key=\\"granf\\"><b>Sur le terrain, ses comp\\u00e9tences parlent d\\u2019elles-m\\u00eames :</b></p><ul><li data-block-key=\\"dizoq\\"><b>COTEXA CONGO - Projet PSTAT :</b><br/>Contr\\u00f4leur technique des lots MEP</li><li data-block-key=\\"lj9i5\\"><b>COTEXA CONGO - R\\u00e9habilitation du si\\u00e8ge de la BDEAC :</b><br/>Contr\\u00f4leur technique des lots MEP</li><li data-block-key=\\"ijrbr\\"><b>MBTP - Construction de la Tour ACACIA :</b><br/>Ing\\u00e9nieur-assistant des \\u00e9tudes MEP</li><li data-block-key=\\"qfkx9\\"><b>DAE - Construction de la base BRALICO (proximit\\u00e9 a\\u00e9roport Maya-Maya, Brazzaville) :</b><br/>Responsable des \\u00e9tudes techniques MEP</li></ul><h2 data-block-key=\\"yfa18\\">Une expertise au service de l\\u2019excellence</h2><p data-block-key=\\"31eu6\\">Fort de son expertise, l\\u2019ing\\u00e9nieur BIKOUTA BIAHOUA place la qualit\\u00e9, l'innovation et la ma\\u00eetrise technique au centre de chacun de ses projets. Sa contribution renforce la dynamique de modernisation des infrastructures au Congo et inspire les nouvelles g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs.</p><h2 data-block-key=\\"yulbo\\">Contactez-le</h2><p data-block-key=\\"n5qmh\\">T\\u00e9l./WhatsApp : <a href=\\"tel:242069951028\\">+242 06 995 10 28</a> / <a href=\\"https://wa.me/242067033232\\">+242 06 703 32 32</a></p><p data-block-key=\\"6hd17\\">Email : <a href=\\"mailto:dondedieubikouta@gmail.com\\">dondedieubikouta@gmail.com</a></p><p data-block-key=\\"ix4pz\\">LinkedIn : <a href=\\"https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161\\">https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161</a></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	18	51	1	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
60	2026-03-03 13:59:15.469145+00	\N	1	{"pk": 18, "path": "000100040001000C", "depth": 4, "numchild": 0, "translation_key": "e693b89e-80d3-46e2-b735-6ae86983019a", "locale": 1, "latest_revision": 59, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.655Z", "last_published_at": "2026-03-03T13:58:52.353Z", "live_revision": 59, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "draft_title": "Ing\\u00e9nieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora", "slug": "ingenieur-bikouta", "content_type": 51, "url_path": "/accueil/blog/ingenieur-bikouta/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-03T13:58:52.332Z", "alias_of": null, "date": "2025-04-28", "intro": "<p data-block-key=\\"zxhxh\\">Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,\\u00a0<b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b>\\u00a0s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p>", "body": "<p data-block-key=\\"0uhik\\">Un ing\\u00e9nieur, un impact</p><p data-block-key=\\"q6tku\\"></p><h2 data-block-key=\\"xxw5u\\">Un acteur cl\\u00e9 du d\\u00e9veloppement des projets MEP au Congo</h2><p data-block-key=\\"89n9k\\">Ing\\u00e9nieur en \\u00e9lectrom\\u00e9canique de formation,\\u00a0<b>BIKOUTA BIAHOUA Don De Dieu Prince Isidora</b>\\u00a0s\\u2019impose comme une r\\u00e9f\\u00e9rence dans l\\u2019univers du MEP (M\\u00e9canique, \\u00c9lectricit\\u00e9, Plomberie). Avec rigueur et passion, il accompagne les projets d\\u2019envergure, de la phase d'\\u00e9tude \\u00e0 la livraison finale, en assurant un haut niveau d'exigence technique.</p><h2 data-block-key=\\"o4fxs\\">Ses missions</h2><p data-block-key=\\"oc9zt\\">Au c\\u0153ur de ses interventions :</p><ul><li data-block-key=\\"6cv6x\\">Le\\u00a0<b>contr\\u00f4le technique</b>\\u00a0des installations MEP</li><li data-block-key=\\"hk1o2\\">La\\u00a0<b>conception et les \\u00e9tudes</b>\\u00a0des syst\\u00e8mes de b\\u00e2timent</li><li data-block-key=\\"e9kme\\">La\\u00a0<b>coordination des \\u00e9quipes techniques</b>\\u00a0sur le terrain</li></ul><h2 data-block-key=\\"zbg5g\\">Projets embl\\u00e9matiques</h2><p data-block-key=\\"granf\\"><b>Sur le terrain, ses comp\\u00e9tences parlent d\\u2019elles-m\\u00eames :</b></p><ul><li data-block-key=\\"dizoq\\"><b>COTEXA CONGO - Projet PSTAT :</b><br/>Contr\\u00f4leur technique des lots MEP</li><li data-block-key=\\"lj9i5\\"><b>COTEXA CONGO - R\\u00e9habilitation du si\\u00e8ge de la BDEAC :</b><br/>Contr\\u00f4leur technique des lots MEP</li><li data-block-key=\\"ijrbr\\"><b>MBTP - Construction de la Tour ACACIA :</b><br/>Ing\\u00e9nieur-assistant des \\u00e9tudes MEP</li><li data-block-key=\\"qfkx9\\"><b>DAE - Construction de la base BRALICO (proximit\\u00e9 a\\u00e9roport Maya-Maya, Brazzaville) :</b><br/>Responsable des \\u00e9tudes techniques MEP</li></ul><h2 data-block-key=\\"yfa18\\">Une expertise au service de l\\u2019excellence</h2><p data-block-key=\\"31eu6\\">Fort de son expertise, l\\u2019ing\\u00e9nieur BIKOUTA BIAHOUA place la qualit\\u00e9, l'innovation et la ma\\u00eetrise technique au centre de chacun de ses projets. Sa contribution renforce la dynamique de modernisation des infrastructures au Congo et inspire les nouvelles g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs.</p><h2 data-block-key=\\"yulbo\\">Contactez-le</h2><p data-block-key=\\"n5qmh\\">T\\u00e9l./WhatsApp : <a href=\\"tel:242069951028\\">+242 06 995 10 28</a> / <a href=\\"https://wa.me/242067033232\\">+242 06 703 32 32</a></p><p data-block-key=\\"6hd17\\">Email : <a href=\\"mailto:dondedieubikouta@gmail.com\\">dondedieubikouta@gmail.com</a></p><p data-block-key=\\"ix4pz\\">LinkedIn : <a href=\\"https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161\\">https://www.linkedin.com/in/don-de-dieu-prince-isidora-bikouta-biahoua-870034161</a></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": [2]}	18	51	1	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
61	2026-03-03 14:15:04.442484+00	\N	1	{"pk": 10, "path": "0001000400010004", "depth": 4, "numchild": 0, "translation_key": "1928c85d-e9af-420e-9a5e-fa5ebbff5827", "locale": 1, "latest_revision": 8, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.292Z", "last_published_at": "2026-02-24T15:25:52.292Z", "live_revision": 8, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "R\\u00e9union du Conseil National de l'OIC du 22 mars 2025", "draft_title": "R\\u00e9union du Conseil National de l'OIC du 22 mars 2025", "slug": "437-2", "content_type": 51, "url_path": "/accueil/blog/437-2/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.282Z", "alias_of": null, "date": "2025-03-22", "intro": "<p data-block-key=\\"f4ssq\\">Le samedi 22 mars 2025, le Conseil National de l\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) s\\u2019est r\\u00e9uni au <b>Minist\\u00e8re de l'Am\\u00e9nagement du Territoire et des Grands Travaux</b>, dans la <b>Salle Alima</b> de la mezzanine. Cette rencontre strat\\u00e9gique, plac\\u00e9e sous le signe de l\\u2019\\u00e9valuation et de la prospective, a permis aux membres du Conseil d\\u2019examiner les grandes orientations de l\\u2019OIC pour l\\u2019ann\\u00e9e en cours.</p>", "body": "<p data-block-key=\\"y7abc\\">Le samedi 22 mars 2025, le Conseil National de l\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) s\\u2019est r\\u00e9uni au <b>Minist\\u00e8re de l'Am\\u00e9nagement du Territoire et des Grands Travaux</b>, dans la <b>Salle Alima</b> de la mezzanine. Cette rencontre strat\\u00e9gique, plac\\u00e9e sous le signe de l\\u2019\\u00e9valuation et de la prospective, a permis aux membres du Conseil d\\u2019examiner les grandes orientations de l\\u2019OIC pour l\\u2019ann\\u00e9e en cours.</p><p data-block-key=\\"7z4de\\"><b>Un ordre du jour ax\\u00e9 sur l'\\u00e9valuation et la planification</b></p><p data-block-key=\\"eru8y\\"></p><p data-block-key=\\"bzshg\\">Les travaux ont port\\u00e9 principalement sur trois points essentiels :</p><ol><li data-block-key=\\"q4wne\\"><b>Examen des rapports d'activit\\u00e9s de l'ann\\u00e9e 2024.</b></li><li data-block-key=\\"0uw4b\\"><b>\\u00c9tude des projets de programme et de budget pour l'ann\\u00e9e 2025.</b></li><li data-block-key=\\"7yt69\\"><b>Analyse de trois projets de d\\u00e9cisions majeurs pour le fonctionnement de l'OIC.</b></li></ol><p data-block-key=\\"8650a\\">Le Conseil National a consacr\\u00e9 une large partie de la s\\u00e9ance \\u00e0 l\\u2019examen des rapports d'activit\\u00e9s de 2024, soulignant les r\\u00e9alisations majeures ainsi que les d\\u00e9fis rencontr\\u00e9s au cours de l'ann\\u00e9e \\u00e9coul\\u00e9e. La discussion a permis d\\u2019apporter des \\u00e9clairages sur certains projets en cours et d\\u2019identifier des axes d'am\\u00e9lioration pour renforcer l'impact des actions men\\u00e9es par l'OIC.</p><p data-block-key=\\"8jknf\\"><b>Des perspectives ambitieuses pour 2025</b></p><p data-block-key=\\"grrnt\\">L\\u2019un des points forts de la r\\u00e9union a \\u00e9t\\u00e9 la pr\\u00e9sentation des <b>projets de programme et de budget 2025</b>. Les membres du Conseil ont discut\\u00e9 des priorit\\u00e9s strat\\u00e9giques pour l\\u2019ann\\u00e9e en cours, avec un accent particulier sur le renforcement des capacit\\u00e9s des ing\\u00e9nieurs et la promotion de l\\u2019excellence professionnelle. Le budget, articul\\u00e9 autour des projets prioritaires, a fait l\\u2019objet de discussions approfondies pour garantir une gestion efficiente et transparente des ressources de l\\u2019Ordre.</p><p data-block-key=\\"91h1o\\"><b>Trois projets de d\\u00e9cisions examin\\u00e9s</b></p><p data-block-key=\\"w7yfh\\">En outre, trois projets de d\\u00e9cisions ont \\u00e9t\\u00e9 examin\\u00e9s lors de cette s\\u00e9ance. Ces d\\u00e9cisions visent \\u00e0 :</p><ol><li data-block-key=\\"3sm36\\"><b>Am\\u00e9liorer la gouvernance interne de l\\u2019OIC.</b></li><li data-block-key=\\"25fu2\\"><b>Renforcer la transparence dans la gestion des ressources financi\\u00e8res.</b></li><li data-block-key=\\"fs5yd\\"><b>Optimiser les m\\u00e9canismes de coordination entre les diff\\u00e9rentes instances r\\u00e9gionales et nationales.</b></li></ol><p data-block-key=\\"4qts4\\">Apr\\u00e8s un d\\u00e9bat constructif, le Conseil National a pris note des propositions d\\u2019amendement pour enrichir ces projets de d\\u00e9cisions avant leur adoption d\\u00e9finitive.</p><p data-block-key=\\"qdfzs\\"><b>Vers un OIC plus fort et plus structur\\u00e9</b></p><p data-block-key=\\"khlqk\\">Cette r\\u00e9union du Conseil National a d\\u00e9montr\\u00e9 une fois de plus l\\u2019engagement des membres \\u00e0 faire de l\\u2019OIC une institution solide et structur\\u00e9e. La volont\\u00e9 d\\u2019am\\u00e9liorer les pratiques de gouvernance et de renforcer les capacit\\u00e9s des ing\\u00e9nieurs congolais reste au c\\u0153ur des priorit\\u00e9s pour 2025.</p><p data-block-key=\\"0ftji\\">L\\u2019OIC tient \\u00e0 remercier tous les participants pour leur implication active dans les \\u00e9changes et r\\u00e9affirme son engagement \\u00e0 accompagner les ing\\u00e9nieurs dans leur \\u00e9volution professionnelle et \\u00e0 contribuer au d\\u00e9veloppement durable du Congo.</p><p data-block-key=\\"2j1ob\\">Vive l'Ordre des Ing\\u00e9nieurs du Congo !<br/>Vive l\\u2019ing\\u00e9nierie congolaise !</p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	10	51	1	Réunion du Conseil National de l'OIC du 22 mars 2025
62	2026-03-03 14:15:54.889703+00	\N	1	{"pk": 8, "path": "0001000400010002", "depth": 4, "numchild": 0, "translation_key": "1f0c8987-b727-493c-9700-f1a1e3fb1af6", "locale": 1, "latest_revision": 41, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.217Z", "last_published_at": "2026-02-28T09:42:47.470Z", "live_revision": 41, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "L'OIC : Un engagement solennel au service du d\\u00e9veloppement", "draft_title": "L'OIC : Un engagement solennel au service du d\\u00e9veloppement", "slug": "ceremonie-du-prestation-de-serment-des-ingenieurs", "content_type": 51, "url_path": "/accueil/blog/ceremonie-du-prestation-de-serment-des-ingenieurs/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-28T09:42:47.453Z", "alias_of": null, "date": "2025-02-08", "intro": "<p data-block-key=\\"tm3l0\\">Le 8 f\\u00e9vrier 2025, les tours jumelles de Mpila ont accueilli la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs, un \\u00e9v\\u00e9nement marquant plac\\u00e9 sous le haut patronage du Monsieur Jean Jacques BOUYA, Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement, de l'Equipement du Territoire et des Grands Travaux. Cette c\\u00e9r\\u00e9monie a \\u00e9galement enregistr\\u00e9 la pr\\u00e9sence remarqu\\u00e9e de l'Honorable Blaise AMBETO, d\\u00e9put\\u00e9 \\u00e0 l'Assembl\\u00e9e nationale.</p>", "body": "<p data-block-key=\\"tr0vx\\">Le 8 f\\u00e9vrier 2025, les tours jumelles de Mpila ont accueilli la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs, un \\u00e9v\\u00e9nement marquant plac\\u00e9 sous le haut patronage du Monsieur Jean Jacques BOUYA, Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement, de l'Equipement du Territoire et des Grands Travaux. Cette c\\u00e9r\\u00e9monie a \\u00e9galement enregistr\\u00e9 la pr\\u00e9sence remarqu\\u00e9e de l'Honorable Blaise AMBETO, d\\u00e9put\\u00e9 \\u00e0 l'Assembl\\u00e9e nationale.</p><p data-block-key=\\"ok47h\\">Au cours de cette c\\u00e9r\\u00e9monie solennelle, 154 ing\\u00e9nieurs ont pr\\u00eat\\u00e9 serment, marquant ainsi leur engagement \\u00e0 servir la nation avec int\\u00e9grit\\u00e9, professionnalisme et d\\u00e9vouement. Cet acte symbolique rev\\u00eat une importance capitale, t\\u00e9moignant de la volont\\u00e9 des ing\\u00e9nieurs congolais de contribuer activement aux projets d'infrastructures et au d\\u00e9veloppement du pays.</p><p data-block-key=\\"efjqx\\">Dans son allocution, le Ministre d'\\u00c9tat a salu\\u00e9 l'enthousiasme et l'engagement des nouveaux ing\\u00e9nieurs, rappelant que leur mission est essentielle pour soutenir les grands travaux entrepris par le pays. De son c\\u00f4t\\u00e9, l'Honorable Blaise AMBETO a encourag\\u00e9 les ing\\u00e9nieurs \\u00e0 faire preuve de responsabilit\\u00e9 et d'innovation dans la r\\u00e9alisation de leurs projets.</p><p data-block-key=\\"3gwrq\\">L'Ordre des Ing\\u00e9nieurs du Congo (OIC) se f\\u00e9licite de l'organisation r\\u00e9ussie de cette c\\u00e9r\\u00e9monie et tient \\u00e0 f\\u00e9liciter chaleureusement l'ensemble des ing\\u00e9nieurs qui ont pr\\u00eat\\u00e9 serment. Ce moment fort t\\u00e9moigne de la volont\\u00e9 de renforcer l'excellence et la responsabilit\\u00e9 au sein de la profession d'ing\\u00e9nieur au Congo.</p><p data-block-key=\\"o37ii\\">L'OIC reste engag\\u00e9 \\u00e0 accompagner ses membres dans l'accomplissement de leurs missions et \\u00e0 promouvoir les valeurs d'\\u00e9thique et de professionnalisme au sein de la communaut\\u00e9 des ing\\u00e9nieurs congolais.</p><p data-block-key=\\"4hbtb\\">Pour plus d'informations sur l'Ordre des Ing\\u00e9nieurs du Congo et ses activit\\u00e9s, n'h\\u00e9sitez pas \\u00e0 consulter notre site internet.</p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	8	51	1	L'OIC : Un engagement solennel au service du développement
63	2026-03-03 14:17:00.875279+00	\N	1	{"pk": 11, "path": "0001000400010005", "depth": 4, "numchild": 0, "translation_key": "31a49c02-9096-42d4-900f-1e01a0cf7151", "locale": 1, "latest_revision": 9, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.331Z", "last_published_at": "2026-02-24T15:25:52.331Z", "live_revision": 9, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale de l'Ordre des Ing\\u00e9nieurs du Congo (OIC)", "draft_title": "Assembl\\u00e9e g\\u00e9n\\u00e9rale inaugurale de l'Ordre des Ing\\u00e9nieurs du Congo (OIC)", "slug": "assemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-oic", "content_type": 51, "url_path": "/accueil/blog/assemblee-generale-inaugurale-de-lordre-des-ingenieurs-du-congo-oic/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.320Z", "alias_of": null, "date": "2024-03-30", "intro": "<p data-block-key=\\"41oie\\">Le samedi 30 mars 2024, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale aux Tours Jumelles de Mpila, marquant une \\u00e9tape significative dans la structuration et la mise en place op\\u00e9rationnelle de l'institution. Cet \\u00e9v\\u00e9nement fait suite \\u00e0 l'Assembl\\u00e9e G\\u00e9n\\u00e9rale \\u00c9lective organis\\u00e9e une ann\\u00e9e auparavant, qui avait permis d'\\u00e9lire le Conseil national et le Bureau ex\\u00e9cutif de l'OIC.</p>", "body": "<p data-block-key=\\"k061v\\">Le samedi 30 mars 2024, l'Ordre des Ing\\u00e9nieurs du Congo (OIC) a tenu son Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale aux Tours Jumelles de Mpila, marquant une \\u00e9tape significative dans la structuration et la mise en place op\\u00e9rationnelle de l'institution. Cet \\u00e9v\\u00e9nement fait suite \\u00e0 l'Assembl\\u00e9e G\\u00e9n\\u00e9rale \\u00c9lective organis\\u00e9e une ann\\u00e9e auparavant, qui avait permis d'\\u00e9lire le Conseil national et le Bureau ex\\u00e9cutif de l'OIC.</p><p data-block-key=\\"lkwwc\\"></p><p data-block-key=\\"dbn17\\"><b>Un haut patronage qui honore la profession</b></p><p data-block-key=\\"xnh7f\\">Cette assembl\\u00e9e inaugurale s'est tenue sous le haut patronage de Monsieur <b>Jean Jacques BOUYA</b>, Ministre d'\\u00c9tat, Ministre de l'Am\\u00e9nagement du Territoire et des Grands Travaux. Sa pr\\u00e9sence t\\u00e9moigne de l'importance accord\\u00e9e par les autorit\\u00e9s publiques \\u00e0 l'organisation et \\u00e0 la reconnaissance de la profession d'ing\\u00e9nieur au Congo.</p><p data-block-key=\\"xnvrv\\"><b>Un moment historique pour la profession d'ing\\u00e9nieur</b></p><p data-block-key=\\"9oocm\\">Cet \\u00e9v\\u00e9nement a rassembl\\u00e9 de nombreux ing\\u00e9nieurs issus de divers secteurs d'activit\\u00e9, ainsi que des personnalit\\u00e9s de premier plan engag\\u00e9es dans le d\\u00e9veloppement de l'ing\\u00e9nierie au Congo. La tenue de cette assembl\\u00e9e inaugurale marque un tournant d\\u00e9cisif dans la structuration de l'Ordre, d\\u00e9sormais pleinement op\\u00e9rationnel pour d\\u00e9fendre les int\\u00e9r\\u00eats des ing\\u00e9nieurs congolais et promouvoir l'excellence professionnelle.</p><p data-block-key=\\"d3gi6\\"><b>Objectifs de l'Assembl\\u00e9e Inaugurale</b></p><p data-block-key=\\"1f5vv\\">L'Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale avait pour principal objectif de valider les textes fondamentaux r\\u00e9gissant l'Ordre, notamment les statuts et le r\\u00e8glement int\\u00e9rieur, \\u00e9labor\\u00e9s en concertation avec les membres du Conseil national et du Bureau ex\\u00e9cutif. Ces documents d\\u00e9finissent les missions, les valeurs et les principes \\u00e9thiques que l'OIC s'engage \\u00e0 promouvoir.</p><p data-block-key=\\"bsqgt\\">Les d\\u00e9bats ont \\u00e9galement port\\u00e9 sur les grandes orientations strat\\u00e9giques \\u00e0 adopter pour assurer la reconnaissance et la valorisation des ing\\u00e9nieurs dans le contexte socio-\\u00e9conomique du Congo. Les participants ont partag\\u00e9 leurs r\\u00e9flexions sur les d\\u00e9fis \\u00e0 relever, notamment en mati\\u00e8re de formation continue, de certification des comp\\u00e9tences et d'\\u00e9thique professionnelle.</p><p data-block-key=\\"3q313\\"><b>Le Bureau et le Conseil en action</b></p><p data-block-key=\\"rrcgq\\">Au cours de cette assembl\\u00e9e, le Bureau ex\\u00e9cutif, soutenu par le Conseil national, a pr\\u00e9sent\\u00e9 son programme d'action pour les prochaines ann\\u00e9es, incluant des initiatives concr\\u00e8tes pour renforcer l'accompagnement des ing\\u00e9nieurs dans leur parcours professionnel. Les membres ont pu d\\u00e9battre des projets \\u00e0 venir, notamment la mise en place de commissions sp\\u00e9cialis\\u00e9es pour r\\u00e9pondre aux probl\\u00e9matiques techniques et r\\u00e9glementaires propres aux diff\\u00e9rents corps d'ing\\u00e9nieurs.</p><p data-block-key=\\"uy57e\\"><b>Vers une dynamique collective</b></p><p data-block-key=\\"l4b08\\">Les \\u00e9changes constructifs ont mis en lumi\\u00e8re l'importance de la solidarit\\u00e9 entre les ing\\u00e9nieurs congolais pour relever les d\\u00e9fis de d\\u00e9veloppement du pays. Le Pr\\u00e9sident du Bureau ex\\u00e9cutif a insist\\u00e9 sur la n\\u00e9cessit\\u00e9 de travailler en synergie avec les autorit\\u00e9s publiques et les partenaires priv\\u00e9s pour faire de l'OIC un acteur incontournable du progr\\u00e8s technique et \\u00e9conomique au Congo.</p><p data-block-key=\\"38bx5\\"><b>Une mobilisation exemplaire</b></p><p data-block-key=\\"9w94j\\">La forte participation \\u00e0 cette Assembl\\u00e9e G\\u00e9n\\u00e9rale Inaugurale t\\u00e9moigne de l'adh\\u00e9sion collective des ing\\u00e9nieurs congolais \\u00e0 ce projet f\\u00e9d\\u00e9rateur. Les membres pr\\u00e9sents ont exprim\\u00e9 leur volont\\u00e9 de contribuer activement aux projets de l'OIC, convaincus que l'Ordre repr\\u00e9sente un levier essentiel pour la reconnaissance et la valorisation de leur m\\u00e9tier.</p><p data-block-key=\\"kvs9l\\"><b>Un avenir prometteur</b></p><p data-block-key=\\"bk16n\\">Cette assembl\\u00e9e inaugurale marque le v\\u00e9ritable lancement op\\u00e9rationnel de l'Ordre des Ing\\u00e9nieurs du Congo. En posant les bases solides de son fonctionnement, l'OIC s'engage \\u00e0 promouvoir l'excellence, l'\\u00e9thique et l'innovation au sein de la profession d'ing\\u00e9nieur.</p><p data-block-key=\\"yhp3q\\">L'Ordre des Ing\\u00e9nieurs du Congo remercie tous les participants pour leur engagement et leur d\\u00e9termination \\u00e0 faire de cette assembl\\u00e9e une r\\u00e9ussite. L'OIC est d\\u00e9sormais pr\\u00eat \\u00e0 jouer pleinement son r\\u00f4le dans la structuration de la profession et le d\\u00e9veloppement durable du Congo.</p><p data-block-key=\\"9dsca\\">Vive l'Ordre des Ing\\u00e9nieurs du Congo !<br/>Vive l'ing\\u00e9nierie congolaise !</p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	11	51	1	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)
64	2026-03-03 14:17:28.589894+00	\N	1	{"pk": 14, "path": "0001000400010008", "depth": 4, "numchild": 0, "translation_key": "39d49735-65b5-43e9-ad41-4b3bfc2cb837", "locale": 1, "latest_revision": 12, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:25:52.509Z", "last_published_at": "2026-02-24T15:25:52.509Z", "live_revision": 12, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Mot\\u00a0du pr\\u00e9sident de l\\u2019OIC \\u00e0 la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau 2025", "draft_title": "Mot\\u00a0du pr\\u00e9sident de l\\u2019OIC \\u00e0 la c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau 2025", "slug": "mot-du-president-de-loic-a-la-ceremonie-de-prestation-de-serment-des-ingenieurs-inscrits-au-tableau-2025", "content_type": 51, "url_path": "/accueil/blog/mot-du-president-de-loic-a-la-ceremonie-de-prestation-de-serment-des-ingenieurs-inscrits-au-tableau-2025/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-24T15:25:52.499Z", "alias_of": null, "date": "2025-02-13", "intro": "<p data-block-key=\\"cgs9i\\">Nous nous retrouvons aujourd\\u2019hui pour une c\\u00e9r\\u00e9monie historique, marquant\\u00a0<b>l\\u2019officialisation du premier tableau de l\\u2019Ordre des Ing\\u00e9nieurs du Congo et la prestation de serment des premiers membres de\\u00a0notre ordre.\\u00a0</b>Cet \\u00e9v\\u00e9nement constitue une \\u00e9tape majeure dans la structuration et la valorisation de notre profession</p>", "body": "<p data-block-key=\\"v8jdf\\">\\u2022\\u00a0<b><i>Excellence Monsieur le Ministre d\\u2019\\u00e9tat, Ministre de l\\u2019am\\u00e9nagement du territoire\\u00a0et\\u00a0des\\u00a0grands travaux</i></b> ;</p><p data-block-key=\\"eopc6\\">\\u2022\\u00a0<b><i>Honorable d\\u00e9put\\u00e9 Blaise AMBETO\\u00a0;</i></b></p><p data-block-key=\\"wqb6b\\">\\u2022\\u00a0<b><i>Messieurs les membres du Conseil National\\u00a0;</i></b></p><p data-block-key=\\"ee8pm\\">\\u2022\\u00a0<b><i>Chers confr\\u00e8res ing\\u00e9nieurs\\u00a0;</i></b></p><p data-block-key=\\"1st7c\\">\\u2022\\u00a0<b><i>Distingu\\u00e9s invit\\u00e9s</i></b>.</p><p data-block-key=\\"ute7h\\">Nous nous retrouvons aujourd\\u2019hui pour une c\\u00e9r\\u00e9monie historique, marquant\\u00a0<b>l\\u2019officialisation du premier tableau de l\\u2019Ordre des Ing\\u00e9nieurs du Congo et la prestation de serment des premiers membres de\\u00a0notre ordre.\\u00a0</b>Cet \\u00e9v\\u00e9nement constitue une \\u00e9tape majeure dans la structuration et la valorisation de notre profession.</p><p data-block-key=\\"i1xn5\\">Permettez-moi, en ce jour solennel, de retracer bri\\u00e8vement le chemin parcouru pour aboutir \\u00e0 ce moment si significatif.</p><p data-block-key=\\"1f8ym\\"><b>En 2016,</b>\\u00a0nous avons pris l\\u2019initiative d\\u2019organiser notre profession en dotant notre pays d\\u2019un Ordre des Ing\\u00e9nieurs, \\u00e0 l\\u2019instar de certains pays de la sous-r\\u00e9gion. Pendant cinq ann\\u00e9es, nous avons travaill\\u00e9 avec d\\u00e9termination \\u00e0 l\\u2019\\u00e9laboration des textes l\\u00e9gislatifs et \\u00e0 la mise en place des strat\\u00e9gies n\\u00e9cessaires pour concr\\u00e9tiser ce projet ambitieux.</p><p data-block-key=\\"gelh7\\">Au moment,\\u00a0ou nous\\u00a0publions\\u00a0la liste\\u00a0des premiers membres de l\\u2019OIC, j\\u2019ai une pens\\u00e9e pieuse en m\\u00e9moire de nos confr\\u00e8res ing\\u00e9nieurs \\u00a0d\\u00e9c\\u00e9d\\u00e9s,\\u00a0j\\u2019ai cit\\u00e9\\u00a0:</p><p data-block-key=\\"p1lvs\\"><b>-\\u00a0MBOUSSA Alphonse,\\u00a0</b>qui \\u00e9tait l\\u2019un des initiateurs de ce projet</p><p data-block-key=\\"j91eq\\"><b>- L\\u2019Honorable NIANGA ELENGA Andr\\u00e9,</b></p><p data-block-key=\\"emivv\\"><b>- NDOUNIAMA Alphonse,</b></p><p data-block-key=\\"surwh\\"><b>- FOUAKAFOUENI Guy Ars\\u00e8ne,</b></p><p data-block-key=\\"g3itw\\"><b>- ODIKA Hyppolite.</b></p><p data-block-key=\\"5ms4g\\">Ainsi, je vous prie tr\\u00e8s respectueusement de bien vouloir vous lever pour\\u00a0observer\\u00a0une minute de silence en leur m\\u00e9moire.</p><p data-block-key=\\"9cwjk\\"><b>Je vous remercie\\u00a0!\\u00a0\\u00a0</b></p><p data-block-key=\\"ycasp\\">Nous\\u00a0avons\\u00a0le devoir de rendre hommage\\u00a0\\u00e0\\u00a0ceux qui ont rendu\\u00a0la\\u00a0r\\u00e9alisation\\u00a0de ce projet\\u00a0possible. Nos sinc\\u00e8res remerciements vont tout d\\u2019abord \\u00e0\\u00a0<b>Son Excellence Monsieur Denis SASSOU N\\u2019GUESSO,</b>\\u00a0<b>Pr\\u00e9sident de la R\\u00e9publique et Chef de l\\u2019\\u00c9tat,</b>\\u00a0pour avoir promulgu\\u00e9 les lois fondatrices de notre Ordre, d\\u00e9sormais connues sous le nom de\\u00a0<b>Lois\\u00a0AMBETO</b>,</p><p data-block-key=\\"xvug6\\">\\u00c0\\u00a0savoir\\u00a0:<b>\\u00a0La\\u00a0loi portant cr\\u00e9ation et organisation de l\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC)\\u00a0;</b>et\\u00a0<b>La loi r\\u00e9gissant la profession d\\u2019ing\\u00e9nieur en R\\u00e9publique du Congo.</b></p><p data-block-key=\\"yxkxv\\">Nous exprimons \\u00e9galement notre profonde gratitude \\u00e0\\u00a0<b>l\\u2019Honorable Blaise AMBETO</b>, qui a port\\u00e9 et d\\u00e9fendu ces textes avec conviction devant le Parlement.\\u00a0</p><p data-block-key=\\"g6org\\">Nos remerciements s\\u2019adressent aussi \\u00e0\\u00a0<b>Son Excellence Monsieur le Ministre d\\u2019\\u00c9tat, Ministre de l\\u2019Am\\u00e9nagement du Territoire et des Grands Travaux,</b>\\u00a0pour son soutien ind\\u00e9fectible, notamment en mettant\\u00a0toujours\\u00a0\\u00e0 notre disposition la\\u00a0confortable\\u00a0salle de r\\u00e9union\\u00a0<b>\\u00ab Fleuve Congo \\u00bb</b>\\u00a0pour nos travaux pr\\u00e9paratoires.</p><p data-block-key=\\"2kzz4\\"><b>Excellence Monsieur le Ministre d\\u2019\\u00c9tat,</b></p><p data-block-key=\\"v6bas\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs,</b></p><p data-block-key=\\"xdi27\\">Cette c\\u00e9r\\u00e9monie symbolise la concr\\u00e9tisation de notre engagement \\u00e0 r\\u00e9glementer et \\u00e0 valoriser la profession d\\u2019ing\\u00e9nieur\\u00a0dans notre pays.</p><p data-block-key=\\"av45l\\"><b>L\\u2019article 20</b>\\u00a0de la loi portant cr\\u00e9ation et organisation de l\\u2019Ordre\\u00a0des ing\\u00e9nieurs du Congo\\u00a0stipule sans ambigu\\u00eft\\u00e9 que :\\u00a0</p><p data-block-key=\\"0wz1f\\"><b>\\u00ab Nul ne peut exercer la profession d\\u2019ing\\u00e9nieur au Congo s\\u2019il n\\u2019est pr\\u00e9alablement inscrit au tableau de l\\u2019Ordre. \\u00bb</b></p><p data-block-key=\\"3hdp8\\">Ainsi, nous avons l\\u2019honneur de vous pr\\u00e9senter aujourd\\u2019hui\\u00a0<b>le premier tableau 2025</b>\\u00a0de l\\u2019Ordre des Ing\\u00e9nieurs du Congo, avec la classification des ing\\u00e9nieurs selon leurs sp\\u00e9cialit\\u00e9s. Parmi\\u00a0<b>les nombreux postulants, 154\\u00a0dont 2 \\u00e9trangers\\u00a0ont \\u00e9t\\u00e9 retenus</b>\\u00a0apr\\u00e8s une v\\u00e9rification rigoureuse de leurs qualifications acad\\u00e9miques.</p><p data-block-key=\\"x06ya\\">Sur ce tableau nous avons\\u00a0\\u00e9galement\\u00a0<b>inscrit\\u00a019\\u00a0soci\\u00e9t\\u00e9s d\\u2019ing\\u00e9nierie, conform\\u00e9ment \\u00e0 la loi.</b></p><p data-block-key=\\"fsz2c\\"><b>Chers confr\\u00e8res ing\\u00e9nieurs,</b></p><p data-block-key=\\"veayj\\">L\\u2019acte que nous allons accomplir dans quelques instants est bien plus qu\\u2019une simple formalit\\u00e9 administrative. Pr\\u00eater serment,\\u00a0c\\u2019est s\\u2019engager solennellement \\u00e0 respecter les valeurs fondamentales de notre profession :\\u00a0<b>l\\u2019\\u00e9thique, l\\u2019excellence technique et la responsabilit\\u00e9 sociale.</b></p><p data-block-key=\\"77gzo\\">Par ce serment, nous affirmons notre d\\u00e9termination \\u00e0 exercer nos missions avec\\u00a0<b>int\\u00e9grit\\u00e9, comp\\u00e9tence et d\\u00e9vouement</b>. Nous nous engageons \\u00e0 respecter les r\\u00e8gles de l\\u2019art,\\u00a0et\\u00a0\\u00e0 mettre nos comp\\u00e9tences au service du d\\u00e9veloppement\\u00a0national.</p><p data-block-key=\\"00lip\\">Nous sommes\\u00a0<b>les pionniers de ce tableau inaugural, et \\u00e0 ce titre, nous portons une immense responsabilit\\u00e9.</b>\\u00a0Soyons\\u00a0donc\\u00a0dignes\\u00a0et fiers\\u00a0de cet honneur et \\u0153uvrons ensemble pour\\u00a0faire rayonner notre profession.</p><p data-block-key=\\"p2z59\\"><b>Le Congo nous a tout donn\\u00e9, il est de notre devoir de contribuer \\u00e0 son progr\\u00e8s et \\u00e0 sa prosp\\u00e9rit\\u00e9\\u00a0!</b></p><p data-block-key=\\"c1fe5\\"><b>Que Dieu b\\u00e9nisse l\\u2019Ordre des Ing\\u00e9nieurs du Congo !</b></p><p data-block-key=\\"8z2fm\\"><b>Vive le Congo !</b></p><p data-block-key=\\"212mt\\"><b>Vive l\\u2019OIC !</b></p><p data-block-key=\\"1ehic\\"><b>Je vous remercie.</b></p>", "image": null, "featured": false, "wagtail_admin_comments": [], "tagged_items": [], "categories": []}	14	51	1	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025
65	2026-03-04 13:05:22.197854+00	\N	1	{"pk": 28, "path": "000100040006", "depth": 3, "numchild": 0, "translation_key": "b3f14779-83c7-4a9a-9799-6ca59483c59e", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "A propos de", "draft_title": "A propos de", "slug": "a-propos-de", "content_type": 58, "url_path": "/accueil/a-propos-de/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "hero_image": null, "hero_alt": "", "show_toc": true, "intro": "<p data-block-key=\\"ps8t5\\">OIC blab Lola </p>", "body": "[{\\"type\\": \\"paragraphe\\", \\"value\\": \\"<p data-block-key=\\\\\\"558wy\\\\\\">Notre dite hvvahgjh km jqlkjq</p><p data-block-key=\\\\\\"62cpr\\\\\\">cnkk</p><p data-block-key=\\\\\\"3714b\\\\\\"></p><p data-block-key=\\\\\\"eogeq\\\\\\"></p>\\", \\"id\\": \\"e586c365-82f6-423f-9a95-7bcf33a065eb\\"}]", "wagtail_admin_comments": []}	28	58	1	A propos de
66	2026-03-04 21:09:56.966887+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 22, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-02-25T10:31:08.290Z", "live_revision": 22, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T10:31:08.263Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": null, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": null, "sort_order": 0, "page": 23, "title": "Carte 1", "text": "", "image": null, "link_page": null}, {"pk": null, "sort_order": 1, "page": 23, "title": "Carte 2", "text": "", "image": null, "link_page": null}, {"pk": null, "sort_order": 2, "page": 23, "title": "Carte 3", "text": "", "image": null, "link_page": null}]}	23	49	1	Accueil
67	2026-03-04 21:11:55.896197+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 66, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:09:56.993Z", "live_revision": 66, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:09:56.966Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}, {"pk": null, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Carte 1", "text": "", "image": null, "link_page": null}, {"pk": null, "sort_order": 0, "page": 23, "title": "carte 1", "text": "", "image": null, "link_page": null}, {"pk": 2, "sort_order": 1, "page": 23, "title": "Carte 2", "text": "", "image": null, "link_page": null}, {"pk": null, "sort_order": 1, "page": 23, "title": "carte 2", "text": "", "image": null, "link_page": null}, {"pk": 3, "sort_order": 2, "page": 23, "title": "Carte 3", "text": "", "image": null, "link_page": null}, {"pk": null, "sort_order": 2, "page": 23, "title": "carte 3", "text": "", "image": null, "link_page": null}]}	23	49	1	Accueil
68	2026-03-04 21:22:07.302368+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 67, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:11:55.921Z", "live_revision": 67, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:11:55.896Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "<p data-block-key=\\"xml20\\"><b>\\u00ab L\\u2019ing\\u00e9nieur au c\\u0153ur du d\\u00e9veloppement du Congo \\u00bb</b></p><p data-block-key=\\"54kno\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) est n\\u00e9 d\\u2019un r\\u00eave partag\\u00e9, d\\u2019un id\\u00e9al port\\u00e9 avec constance par plusieurs g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs. Ce r\\u00eave est aujourd\\u2019hui devenu r\\u00e9alit\\u00e9 : celle d\\u2019une institution nationale, l\\u00e9gale et structur\\u00e9e, au service de l\\u2019excellence, de l\\u2019\\u00e9thique et du d\\u00e9veloppement.</p><p data-block-key=\\"4bor7\\">La cr\\u00e9ation de l\\u2019OIC marque un tournant historique. Elle consacre la reconnaissance officielle du r\\u00f4le central que joue l\\u2019ing\\u00e9nieur dans la transformation de notre pays. Elle affirme, avec force, que l\\u2019ing\\u00e9nieur ne saurait rester dans l\\u2019ombre, tant son savoir, son expertise et sa responsabilit\\u00e9 soci\\u00e9tale sont essentiels \\u00e0 la construction du Congo de demain.</p><p data-block-key=\\"8kacm\\">La premi\\u00e8re c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre restera comme un acte fondateur. Elle scelle l\\u2019engagement d\\u2019hommes et de femmes de science \\u00e0 exercer leur m\\u00e9tier dans le respect des normes, de l\\u2019int\\u00e9grit\\u00e9 et du bien commun. Elle institue une exigence : celle de la comp\\u00e9tence assum\\u00e9e, de la formation continue et de la redevabilit\\u00e9.</p><p data-block-key=\\"hkpq\\">Plus qu\\u2019un simple cadre r\\u00e9glementaire, l\\u2019OIC est d\\u00e9sormais un pilier du d\\u00e9veloppement. Il veille \\u00e0 la qualit\\u00e9 de la pratique professionnelle, \\u00e0 la promotion de l\\u2019innovation et \\u00e0 la valorisation des ing\\u00e9nieurs congolais, o\\u00f9 qu\\u2019ils exercent.</p><p data-block-key=\\"301b7\\">Adh\\u00e9rer \\u00e0 l\\u2019Ordre, c\\u2019est reconna\\u00eetre la valeur de notre m\\u00e9tier. C\\u2019est aussi se hisser \\u00e0 la hauteur de nos responsabilit\\u00e9s, dans un contexte o\\u00f9 la ma\\u00eetrise technique, la rigueur et l\\u2019\\u00e9thique sont plus que jamais indispensables.</p><p data-block-key=\\"8sk2d\\">\\u00c0 tous les ing\\u00e9nieurs congolais, j\\u2019adresse un appel : rejoignez l\\u2019Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d\\u2019une profession qui b\\u00e2tit, qui con\\u00e7oit, qui innove.</p><p data-block-key=\\"69s7g\\">L\\u2019avenir de l\\u2019ing\\u00e9nierie congolaise est entre nos mains. \\u00c0 nous de l\\u2019\\u00e9lever \\u00e0 la hauteur des d\\u00e9fis de notre temps.</p><p data-block-key=\\"dgml9\\">Le Pr\\u00e9sident de l\\u2019OIC<br/>Ordre des Ing\\u00e9nieurs du Congo</p>", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}, {"pk": 2, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Carte 1", "text": "", "image": null, "link_page": null}, {"pk": 4, "sort_order": 0, "page": 23, "title": "carte 1", "text": "", "image": null, "link_page": null}, {"pk": 2, "sort_order": 1, "page": 23, "title": "Carte 2", "text": "", "image": null, "link_page": null}]}	23	49	1	Accueil
69	2026-03-04 21:24:34.769355+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 68, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:22:07.328Z", "live_revision": 68, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:22:07.302Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "<p data-block-key=\\"xml20\\"><b>\\u00ab L\\u2019ing\\u00e9nieur au c\\u0153ur du d\\u00e9veloppement du Congo \\u00bb</b></p><p data-block-key=\\"54kno\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) est n\\u00e9 d\\u2019un r\\u00eave partag\\u00e9, d\\u2019un id\\u00e9al port\\u00e9 avec constance par plusieurs g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs. Ce r\\u00eave est aujourd\\u2019hui devenu r\\u00e9alit\\u00e9 : celle d\\u2019une institution nationale, l\\u00e9gale et structur\\u00e9e, au service de l\\u2019excellence, de l\\u2019\\u00e9thique et du d\\u00e9veloppement.</p><p data-block-key=\\"4bor7\\">La cr\\u00e9ation de l\\u2019OIC marque un tournant historique. Elle consacre la reconnaissance officielle du r\\u00f4le central que joue l\\u2019ing\\u00e9nieur dans la transformation de notre pays. Elle affirme, avec force, que l\\u2019ing\\u00e9nieur ne saurait rester dans l\\u2019ombre, tant son savoir, son expertise et sa responsabilit\\u00e9 soci\\u00e9tale sont essentiels \\u00e0 la construction du Congo de demain.</p><p data-block-key=\\"8kacm\\">La premi\\u00e8re c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre restera comme un acte fondateur. Elle scelle l\\u2019engagement d\\u2019hommes et de femmes de science \\u00e0 exercer leur m\\u00e9tier dans le respect des normes, de l\\u2019int\\u00e9grit\\u00e9 et du bien commun. Elle institue une exigence : celle de la comp\\u00e9tence assum\\u00e9e, de la formation continue et de la redevabilit\\u00e9.</p><p data-block-key=\\"hkpq\\">Plus qu\\u2019un simple cadre r\\u00e9glementaire, l\\u2019OIC est d\\u00e9sormais un pilier du d\\u00e9veloppement. Il veille \\u00e0 la qualit\\u00e9 de la pratique professionnelle, \\u00e0 la promotion de l\\u2019innovation et \\u00e0 la valorisation des ing\\u00e9nieurs congolais, o\\u00f9 qu\\u2019ils exercent.</p><p data-block-key=\\"301b7\\">Adh\\u00e9rer \\u00e0 l\\u2019Ordre, c\\u2019est reconna\\u00eetre la valeur de notre m\\u00e9tier. C\\u2019est aussi se hisser \\u00e0 la hauteur de nos responsabilit\\u00e9s, dans un contexte o\\u00f9 la ma\\u00eetrise technique, la rigueur et l\\u2019\\u00e9thique sont plus que jamais indispensables.</p><p data-block-key=\\"8sk2d\\">\\u00c0 tous les ing\\u00e9nieurs congolais, j\\u2019adresse un appel : rejoignez l\\u2019Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d\\u2019une profession qui b\\u00e2tit, qui con\\u00e7oit, qui innove.</p><p data-block-key=\\"69s7g\\">L\\u2019avenir de l\\u2019ing\\u00e9nierie congolaise est entre nos mains. \\u00c0 nous de l\\u2019\\u00e9lever \\u00e0 la hauteur des d\\u00e9fis de notre temps.</p><p data-block-key=\\"dgml9\\">Le Pr\\u00e9sident de l\\u2019OIC<br/>Ordre des Ing\\u00e9nieurs du Congo</p>", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}, {"pk": 2, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Documentation", "text": "", "image": null, "link_page": null}, {"pk": 4, "sort_order": 1, "page": 23, "title": "Actualit\\u00e9", "text": "", "image": null, "link_page": null}, {"pk": 2, "sort_order": 2, "page": 23, "title": "Tableau d'honneur", "text": "", "image": null, "link_page": null}]}	23	49	1	Accueil
70	2026-03-04 21:25:43.68638+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 69, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:24:34.793Z", "live_revision": 69, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:24:34.769Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "<p data-block-key=\\"xml20\\"><b>\\u00ab L\\u2019ing\\u00e9nieur au c\\u0153ur du d\\u00e9veloppement du Congo \\u00bb</b></p><p data-block-key=\\"54kno\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) est n\\u00e9 d\\u2019un r\\u00eave partag\\u00e9, d\\u2019un id\\u00e9al port\\u00e9 avec constance par plusieurs g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs. Ce r\\u00eave est aujourd\\u2019hui devenu r\\u00e9alit\\u00e9 : celle d\\u2019une institution nationale, l\\u00e9gale et structur\\u00e9e, au service de l\\u2019excellence, de l\\u2019\\u00e9thique et du d\\u00e9veloppement.</p><p data-block-key=\\"4bor7\\">La cr\\u00e9ation de l\\u2019OIC marque un tournant historique. Elle consacre la reconnaissance officielle du r\\u00f4le central que joue l\\u2019ing\\u00e9nieur dans la transformation de notre pays. Elle affirme, avec force, que l\\u2019ing\\u00e9nieur ne saurait rester dans l\\u2019ombre, tant son savoir, son expertise et sa responsabilit\\u00e9 soci\\u00e9tale sont essentiels \\u00e0 la construction du Congo de demain.</p><p data-block-key=\\"8kacm\\">La premi\\u00e8re c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre restera comme un acte fondateur. Elle scelle l\\u2019engagement d\\u2019hommes et de femmes de science \\u00e0 exercer leur m\\u00e9tier dans le respect des normes, de l\\u2019int\\u00e9grit\\u00e9 et du bien commun. Elle institue une exigence : celle de la comp\\u00e9tence assum\\u00e9e, de la formation continue et de la redevabilit\\u00e9.</p><p data-block-key=\\"hkpq\\">Plus qu\\u2019un simple cadre r\\u00e9glementaire, l\\u2019OIC est d\\u00e9sormais un pilier du d\\u00e9veloppement. Il veille \\u00e0 la qualit\\u00e9 de la pratique professionnelle, \\u00e0 la promotion de l\\u2019innovation et \\u00e0 la valorisation des ing\\u00e9nieurs congolais, o\\u00f9 qu\\u2019ils exercent.</p><p data-block-key=\\"301b7\\">Adh\\u00e9rer \\u00e0 l\\u2019Ordre, c\\u2019est reconna\\u00eetre la valeur de notre m\\u00e9tier. C\\u2019est aussi se hisser \\u00e0 la hauteur de nos responsabilit\\u00e9s, dans un contexte o\\u00f9 la ma\\u00eetrise technique, la rigueur et l\\u2019\\u00e9thique sont plus que jamais indispensables.</p><p data-block-key=\\"8sk2d\\">\\u00c0 tous les ing\\u00e9nieurs congolais, j\\u2019adresse un appel : rejoignez l\\u2019Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d\\u2019une profession qui b\\u00e2tit, qui con\\u00e7oit, qui innove.</p><p data-block-key=\\"69s7g\\">L\\u2019avenir de l\\u2019ing\\u00e9nierie congolaise est entre nos mains. \\u00c0 nous de l\\u2019\\u00e9lever \\u00e0 la hauteur des d\\u00e9fis de notre temps.</p><p data-block-key=\\"dgml9\\">Le Pr\\u00e9sident de l\\u2019OIC<br/>Ordre des Ing\\u00e9nieurs du Congo</p>", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Documentation", "text": "", "image": null, "link_page": null}, {"pk": 4, "sort_order": 1, "page": 23, "title": "Actualit\\u00e9", "text": "", "image": null, "link_page": null}, {"pk": 2, "sort_order": 2, "page": 23, "title": "Tableau d'honneur", "text": "", "image": null, "link_page": null}]}	23	49	1	Accueil
71	2026-03-04 21:30:52.252825+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 70, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:25:43.709Z", "live_revision": 70, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:25:43.686Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "<p data-block-key=\\"xml20\\"><b>\\u00ab L\\u2019ing\\u00e9nieur au c\\u0153ur du d\\u00e9veloppement du Congo \\u00bb</b></p><p data-block-key=\\"54kno\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) est n\\u00e9 d\\u2019un r\\u00eave partag\\u00e9, d\\u2019un id\\u00e9al port\\u00e9 avec constance par plusieurs g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs. Ce r\\u00eave est aujourd\\u2019hui devenu r\\u00e9alit\\u00e9 : celle d\\u2019une institution nationale, l\\u00e9gale et structur\\u00e9e, au service de l\\u2019excellence, de l\\u2019\\u00e9thique et du d\\u00e9veloppement.</p><p data-block-key=\\"4bor7\\">La cr\\u00e9ation de l\\u2019OIC marque un tournant historique. Elle consacre la reconnaissance officielle du r\\u00f4le central que joue l\\u2019ing\\u00e9nieur dans la transformation de notre pays. Elle affirme, avec force, que l\\u2019ing\\u00e9nieur ne saurait rester dans l\\u2019ombre, tant son savoir, son expertise et sa responsabilit\\u00e9 soci\\u00e9tale sont essentiels \\u00e0 la construction du Congo de demain.</p><p data-block-key=\\"8kacm\\">La premi\\u00e8re c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre restera comme un acte fondateur. Elle scelle l\\u2019engagement d\\u2019hommes et de femmes de science \\u00e0 exercer leur m\\u00e9tier dans le respect des normes, de l\\u2019int\\u00e9grit\\u00e9 et du bien commun. Elle institue une exigence : celle de la comp\\u00e9tence assum\\u00e9e, de la formation continue et de la redevabilit\\u00e9.</p><p data-block-key=\\"hkpq\\">Plus qu\\u2019un simple cadre r\\u00e9glementaire, l\\u2019OIC est d\\u00e9sormais un pilier du d\\u00e9veloppement. Il veille \\u00e0 la qualit\\u00e9 de la pratique professionnelle, \\u00e0 la promotion de l\\u2019innovation et \\u00e0 la valorisation des ing\\u00e9nieurs congolais, o\\u00f9 qu\\u2019ils exercent.</p><p data-block-key=\\"301b7\\">Adh\\u00e9rer \\u00e0 l\\u2019Ordre, c\\u2019est reconna\\u00eetre la valeur de notre m\\u00e9tier. C\\u2019est aussi se hisser \\u00e0 la hauteur de nos responsabilit\\u00e9s, dans un contexte o\\u00f9 la ma\\u00eetrise technique, la rigueur et l\\u2019\\u00e9thique sont plus que jamais indispensables.</p><p data-block-key=\\"8sk2d\\">\\u00c0 tous les ing\\u00e9nieurs congolais, j\\u2019adresse un appel : rejoignez l\\u2019Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d\\u2019une profession qui b\\u00e2tit, qui con\\u00e7oit, qui innove.</p><p data-block-key=\\"69s7g\\">L\\u2019avenir de l\\u2019ing\\u00e9nierie congolaise est entre nos mains. \\u00c0 nous de l\\u2019\\u00e9lever \\u00e0 la hauteur des d\\u00e9fis de notre temps.</p><p data-block-key=\\"dgml9\\">Le Pr\\u00e9sident de l\\u2019OIC<br/>Ordre des Ing\\u00e9nieurs du Congo</p>", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": null, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Documentation", "text": "Acc\\u00e9dez \\u00e0 notre espace de ressources o\\u00f9 vous trouverez des rapports, publications, \\u00e9tudes et autres documents officiels de l\\u2019OIC.", "image": 13, "link_page": null}, {"pk": 4, "sort_order": 1, "page": 23, "title": "Actualit\\u00e9", "text": "Retrouvez ici toutes les actualit\\u00e9s et communiqu\\u00e9s de presse de l\\u2019OIC, ainsi que les informations m\\u00e9diatiques relatives \\u00e0 nos activit\\u00e9s et projets.", "image": 15, "link_page": null}, {"pk": 2, "sort_order": 2, "page": 23, "title": "Tableau d'honneur", "text": "D\\u00e9couvrez la liste des ing\\u00e9nieurs et entreprises inscrits au tableau de l\\u2019Ordre au titre de l\\u2019ann\\u00e9e 2025.", "image": 14, "link_page": null}]}	23	49	1	Accueil
72	2026-03-04 21:34:52.682936+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 71, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:30:52.275Z", "live_revision": 71, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:30:52.252Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "<p data-block-key=\\"xml20\\"><b>\\u00ab L\\u2019ing\\u00e9nieur au c\\u0153ur du d\\u00e9veloppement du Congo \\u00bb</b></p><p data-block-key=\\"54kno\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) est n\\u00e9 d\\u2019un r\\u00eave partag\\u00e9, d\\u2019un id\\u00e9al port\\u00e9 avec constance par plusieurs g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs. Ce r\\u00eave est aujourd\\u2019hui devenu r\\u00e9alit\\u00e9 : celle d\\u2019une institution nationale, l\\u00e9gale et structur\\u00e9e, au service de l\\u2019excellence, de l\\u2019\\u00e9thique et du d\\u00e9veloppement.</p><p data-block-key=\\"4bor7\\">La cr\\u00e9ation de l\\u2019OIC marque un tournant historique. Elle consacre la reconnaissance officielle du r\\u00f4le central que joue l\\u2019ing\\u00e9nieur dans la transformation de notre pays. Elle affirme, avec force, que l\\u2019ing\\u00e9nieur ne saurait rester dans l\\u2019ombre, tant son savoir, son expertise et sa responsabilit\\u00e9 soci\\u00e9tale sont essentiels \\u00e0 la construction du Congo de demain.</p><p data-block-key=\\"8kacm\\">La premi\\u00e8re c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre restera comme un acte fondateur. Elle scelle l\\u2019engagement d\\u2019hommes et de femmes de science \\u00e0 exercer leur m\\u00e9tier dans le respect des normes, de l\\u2019int\\u00e9grit\\u00e9 et du bien commun. Elle institue une exigence : celle de la comp\\u00e9tence assum\\u00e9e, de la formation continue et de la redevabilit\\u00e9.</p><p data-block-key=\\"hkpq\\">Plus qu\\u2019un simple cadre r\\u00e9glementaire, l\\u2019OIC est d\\u00e9sormais un pilier du d\\u00e9veloppement. Il veille \\u00e0 la qualit\\u00e9 de la pratique professionnelle, \\u00e0 la promotion de l\\u2019innovation et \\u00e0 la valorisation des ing\\u00e9nieurs congolais, o\\u00f9 qu\\u2019ils exercent.</p><p data-block-key=\\"301b7\\">Adh\\u00e9rer \\u00e0 l\\u2019Ordre, c\\u2019est reconna\\u00eetre la valeur de notre m\\u00e9tier. C\\u2019est aussi se hisser \\u00e0 la hauteur de nos responsabilit\\u00e9s, dans un contexte o\\u00f9 la ma\\u00eetrise technique, la rigueur et l\\u2019\\u00e9thique sont plus que jamais indispensables.</p><p data-block-key=\\"8sk2d\\">\\u00c0 tous les ing\\u00e9nieurs congolais, j\\u2019adresse un appel : rejoignez l\\u2019Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d\\u2019une profession qui b\\u00e2tit, qui con\\u00e7oit, qui innove.</p><p data-block-key=\\"69s7g\\">L\\u2019avenir de l\\u2019ing\\u00e9nierie congolaise est entre nos mains. \\u00c0 nous de l\\u2019\\u00e9lever \\u00e0 la hauteur des d\\u00e9fis de notre temps.</p><p data-block-key=\\"dgml9\\">Le Pr\\u00e9sident de l\\u2019OIC<br/>Ordre des Ing\\u00e9nieurs du Congo</p>", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "wqxqxw", "subtitle": "", "image": 11, "cta_text": "En savoir plus", "cta_page": null}, {"pk": null, "sort_order": 1, "page": 23, "title": "", "subtitle": "", "image": 8, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Documentation", "text": "Acc\\u00e9dez \\u00e0 notre espace de ressources o\\u00f9 vous trouverez des rapports, publications, \\u00e9tudes et autres documents officiels de l\\u2019OIC.", "image": 13, "link_page": null}, {"pk": 4, "sort_order": 1, "page": 23, "title": "Actualit\\u00e9", "text": "Retrouvez ici toutes les actualit\\u00e9s et communiqu\\u00e9s de presse de l\\u2019OIC, ainsi que les informations m\\u00e9diatiques relatives \\u00e0 nos activit\\u00e9s et projets.", "image": 15, "link_page": null}, {"pk": 2, "sort_order": 2, "page": 23, "title": "Tableau d'honneur", "text": "D\\u00e9couvrez la liste des ing\\u00e9nieurs et entreprises inscrits au tableau de l\\u2019Ordre au titre de l\\u2019ann\\u00e9e 2025.", "image": 14, "link_page": null}]}	23	49	1	Accueil
73	2026-03-04 21:35:37.026292+00	\N	1	{"pk": 23, "path": "00010004", "depth": 2, "numchild": 6, "translation_key": "ecca36b0-550d-45a9-8464-253cc3363a1d", "locale": 1, "latest_revision": 72, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-24T15:34:23.099Z", "last_published_at": "2026-03-04T21:34:52.706Z", "live_revision": 72, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Accueil", "draft_title": "Accueil", "slug": "accueil", "content_type": 49, "url_path": "/accueil/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-03-04T21:34:52.682Z", "alias_of": null, "tagline": "", "editorial_title": "Editorial", "editorial_body": "<p data-block-key=\\"xml20\\"><b>\\u00ab L\\u2019ing\\u00e9nieur au c\\u0153ur du d\\u00e9veloppement du Congo \\u00bb</b></p><p data-block-key=\\"54kno\\">L\\u2019Ordre des Ing\\u00e9nieurs du Congo (OIC) est n\\u00e9 d\\u2019un r\\u00eave partag\\u00e9, d\\u2019un id\\u00e9al port\\u00e9 avec constance par plusieurs g\\u00e9n\\u00e9rations d\\u2019ing\\u00e9nieurs. Ce r\\u00eave est aujourd\\u2019hui devenu r\\u00e9alit\\u00e9 : celle d\\u2019une institution nationale, l\\u00e9gale et structur\\u00e9e, au service de l\\u2019excellence, de l\\u2019\\u00e9thique et du d\\u00e9veloppement.</p><p data-block-key=\\"4bor7\\">La cr\\u00e9ation de l\\u2019OIC marque un tournant historique. Elle consacre la reconnaissance officielle du r\\u00f4le central que joue l\\u2019ing\\u00e9nieur dans la transformation de notre pays. Elle affirme, avec force, que l\\u2019ing\\u00e9nieur ne saurait rester dans l\\u2019ombre, tant son savoir, son expertise et sa responsabilit\\u00e9 soci\\u00e9tale sont essentiels \\u00e0 la construction du Congo de demain.</p><p data-block-key=\\"8kacm\\">La premi\\u00e8re c\\u00e9r\\u00e9monie de prestation de serment des ing\\u00e9nieurs inscrits au tableau de l\\u2019Ordre restera comme un acte fondateur. Elle scelle l\\u2019engagement d\\u2019hommes et de femmes de science \\u00e0 exercer leur m\\u00e9tier dans le respect des normes, de l\\u2019int\\u00e9grit\\u00e9 et du bien commun. Elle institue une exigence : celle de la comp\\u00e9tence assum\\u00e9e, de la formation continue et de la redevabilit\\u00e9.</p><p data-block-key=\\"hkpq\\">Plus qu\\u2019un simple cadre r\\u00e9glementaire, l\\u2019OIC est d\\u00e9sormais un pilier du d\\u00e9veloppement. Il veille \\u00e0 la qualit\\u00e9 de la pratique professionnelle, \\u00e0 la promotion de l\\u2019innovation et \\u00e0 la valorisation des ing\\u00e9nieurs congolais, o\\u00f9 qu\\u2019ils exercent.</p><p data-block-key=\\"301b7\\">Adh\\u00e9rer \\u00e0 l\\u2019Ordre, c\\u2019est reconna\\u00eetre la valeur de notre m\\u00e9tier. C\\u2019est aussi se hisser \\u00e0 la hauteur de nos responsabilit\\u00e9s, dans un contexte o\\u00f9 la ma\\u00eetrise technique, la rigueur et l\\u2019\\u00e9thique sont plus que jamais indispensables.</p><p data-block-key=\\"8sk2d\\">\\u00c0 tous les ing\\u00e9nieurs congolais, j\\u2019adresse un appel : rejoignez l\\u2019Ordre. Soyez acteurs de son rayonnement. Ensemble, faisons entendre la voix d\\u2019une profession qui b\\u00e2tit, qui con\\u00e7oit, qui innove.</p><p data-block-key=\\"69s7g\\">L\\u2019avenir de l\\u2019ing\\u00e9nierie congolaise est entre nos mains. \\u00c0 nous de l\\u2019\\u00e9lever \\u00e0 la hauteur des d\\u00e9fis de notre temps.</p><p data-block-key=\\"dgml9\\">Le Pr\\u00e9sident de l\\u2019OIC<br/>Ordre des Ing\\u00e9nieurs du Congo</p>", "show_latest_articles": true, "latest_articles_title": "Articles", "latest_articles_count": 5, "spotlight_title": "Un ing\\u00e9nieur, un impact", "spotlight_page": null, "perspectives_title": "Regards d\\u2019ing\\u00e9nieurs", "perspectives_page": null, "perspectives_excerpt": "", "wagtail_admin_comments": [], "hero_slides": [{"pk": 1, "sort_order": 0, "page": 23, "title": "", "subtitle": "", "image": 11, "cta_text": "En savoir plus", "cta_page": null}, {"pk": 3, "sort_order": 1, "page": 23, "title": "", "subtitle": "", "image": 8, "cta_text": "En savoir plus", "cta_page": null}], "quick_links": [{"pk": 1, "sort_order": 0, "page": 23, "title": "Documentation", "text": "Acc\\u00e9dez \\u00e0 notre espace de ressources o\\u00f9 vous trouverez des rapports, publications, \\u00e9tudes et autres documents officiels de l\\u2019OIC.", "image": 13, "link_page": null}, {"pk": 4, "sort_order": 1, "page": 23, "title": "Actualit\\u00e9", "text": "Retrouvez ici toutes les actualit\\u00e9s et communiqu\\u00e9s de presse de l\\u2019OIC, ainsi que les informations m\\u00e9diatiques relatives \\u00e0 nos activit\\u00e9s et projets.", "image": 15, "link_page": null}, {"pk": 2, "sort_order": 2, "page": 23, "title": "Tableau d'honneur", "text": "D\\u00e9couvrez la liste des ing\\u00e9nieurs et entreprises inscrits au tableau de l\\u2019Ordre au titre de l\\u2019ann\\u00e9e 2025.", "image": 14, "link_page": null}]}	23	49	1	Accueil
74	2026-03-05 13:15:39.90869+00	\N	1	{"pk": 26, "path": "000100040004", "depth": 3, "numchild": 0, "translation_key": "15e02717-4eef-4067-adaf-124ca8c48410", "locale": 1, "latest_revision": 29, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-02-25T12:40:26.483Z", "last_published_at": "2026-02-25T12:53:01.309Z", "live_revision": 29, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Conseil national", "draft_title": "Conseil national", "slug": "conseil-national", "content_type": 57, "url_path": "/accueil/conseil-national/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2026-02-25T12:53:01.285Z", "alias_of": null, "intro": "", "wagtail_admin_comments": [], "sections": [{"pk": 3, "sort_order": 0, "page": 26, "section": 1, "members": [{"pk": 6, "sort_order": 0, "parent": 3, "member": 1}]}, {"pk": 4, "sort_order": 1, "page": 26, "section": 1, "members": [{"pk": 15, "sort_order": 0, "parent": 4, "member": 10}, {"pk": 9, "sort_order": 1, "parent": 4, "member": 4}, {"pk": 16, "sort_order": 2, "parent": 4, "member": 11}, {"pk": 14, "sort_order": 3, "parent": 4, "member": 9}, {"pk": 8, "sort_order": 4, "parent": 4, "member": 3}, {"pk": 13, "sort_order": 5, "parent": 4, "member": 8}, {"pk": 7, "sort_order": 6, "parent": 4, "member": 2}, {"pk": 11, "sort_order": 7, "parent": 4, "member": 6}, {"pk": 10, "sort_order": 8, "parent": 4, "member": 5}, {"pk": 12, "sort_order": 9, "parent": 4, "member": 7}]}]}	26	57	1	Conseil national
\.


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	localhost	80	t	23	OIC
\.


--
-- Data for Name: wagtailcore_task; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_task (id, name, active, content_type_id) FROM stdin;
1	Moderators approval	t	3
\.


--
-- Data for Name: wagtailcore_taskstate; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_taskstate (id, status, started_at, finished_at, content_type_id, task_id, workflow_state_id, finished_by_id, comment, revision_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_uploadedfile; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_uploadedfile (id, file, for_content_type_id, uploaded_by_user_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_workflow; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_workflow (id, name, active) FROM stdin;
1	Moderators approval	t
\.


--
-- Data for Name: wagtailcore_workflowcontenttype; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_workflowcontenttype (content_type_id, workflow_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_workflowpage; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_workflowpage (page_id, workflow_id) FROM stdin;
1	1
\.


--
-- Data for Name: wagtailcore_workflowstate; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_workflowstate (id, status, created_at, current_task_state_id, requested_by_id, workflow_id, object_id, base_content_type_id, content_type_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_workflowtask; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailcore_workflowtask (id, sort_order, task_id, workflow_id) FROM stdin;
1	0	1	1
\.


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_hash, file_size) FROM stdin;
1	Loi n° 2-2023 régissant la profession de l'ingénieur au Congo	documents/LOI_2_2023_REGISSANT_LA_PROFESSION_DE_LINGENIEUR.pdf	2026-02-25 13:20:52.193013+00	1	1	b66e0bc093cebe84a5414f9c87d9c34a99d76d06	2248577
2	LOI 3	documents/LOI_3.pdf	2026-02-25 13:27:24.531158+00	1	1	3f0a1040b93328b39ee218006476ff8fe7777959	1858682
3	REGLEMENT INTERIEUR - 2024	documents/REGLEMENT_INTERIEUR_-_2024.pdf	2026-02-25 13:30:25.08601+00	1	1	b319fcf5bd155101c0f7341b52e55cf61f4a47c6	317611
4	LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025	documents/LISTE_DES_INGENIEURS_INSCRITS_AU_TABLEAU__2025__.pdf	2026-02-25 13:32:39.090197+00	1	1	546ea73e7933e4f37ebb9fc6e7f08c95a8b4ff56	117131
5	Délibération cotisations	documents/Délibération_cotisations.pdf	2026-02-25 13:34:15.016232+00	1	1	1414cab5b777ae43ee7afcbd1bdba4bdf00e8538	453531
\.


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, width, height, last_updated, hash, thumbnail_url, cache_until) FROM stdin;
\.


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailforms_formsubmission (id, submit_time, page_id, form_data) FROM stdin;
\.


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash, description) FROM stdin;
1	Anadaletia	original_images/Anadaletia.jpg	870	859	2026-02-25 11:44:22.71003+00	\N	\N	\N	\N	1	56748	1	539ad0cd9e2266321652c71446ce9c83ee5a2225	
2	mberi2	original_images/mberi2.jpg	794	794	2026-02-25 11:45:11.926931+00	\N	\N	\N	\N	1	53005	1	e2cbd0515d18ed14cff77d257ed630c70bb2212e	
3	mangoueleh	original_images/mangoueleh.jpg	810	1080	2026-02-25 12:00:40.30433+00	\N	\N	\N	\N	1	105534	1	7b6b4af436c2618db7fa6cb738b583148e98103a	
4	Essombingoue	original_images/Essombingoue.jpeg	750	1000	2026-02-25 12:07:33.827376+00	\N	\N	\N	\N	1	43819	1	3c474e5511423fb5bb1796761089a2ebce8605ab	
5	Doria02	original_images/Doria02.JPG	743	853	2026-02-25 12:09:03.341816+00	\N	\N	\N	\N	1	97867	1	2623cff2e5b76e91112e788fc9e7888c509adcb8	
6	Doria01	original_images/Doria01.JPG	1080	813	2026-02-25 12:09:37.287591+00	\N	\N	\N	\N	1	52384	1	cacee6d6b1c2c309691c94dba980eca324bb064e	
7	nana	original_images/nana.jpg	423	423	2026-02-25 12:40:56.152537+00	\N	\N	\N	\N	1	30335	1	ca7b48d4e2679559e838277c3cef6fb218e4c507	
8	Ossete	original_images/Ossete.jpg	470	470	2026-02-25 12:41:43.807104+00	\N	\N	\N	\N	1	31372	1	32acf520145d215973a91c38b13e9a73ab515f18	
9	Matokot	original_images/Matokot.jpg	531	531	2026-02-25 12:43:12.613839+00	\N	\N	\N	\N	1	42477	1	0204e99a3c3c02204f8f2cb361b89d065230a1bb	
10	Koukodia2	original_images/Koukodia2.jpeg	232	232	2026-02-25 12:44:05.690113+00	\N	\N	\N	\N	1	9236	1	8e853f77146da80278f6f60f39b78da19c86fffd	
11	Andzouangoli	original_images/Andzouangoli.jpeg	810	1080	2026-02-25 12:45:12.663927+00	\N	\N	\N	\N	1	42287	1	f49ebea787d7b3d8b697c9e83ac0567eafed6920	
12	etokabeka2	original_images/etokabeka2.jpg	642	642	2026-02-25 12:45:46.655781+00	\N	\N	\N	\N	1	46485	1	c26e9431f12c56d01c1d1e933097156a0de4ac68	
13	neve-marketing-icon-1	original_images/neve-marketing-icon-1.png	72	72	2026-03-04 21:29:43.014193+00	\N	\N	\N	\N	1	1835	1	71e0d8ef2e6fa47c09743c9de7e99750d5cd5137	
14	neve-marketing-icon-2	original_images/neve-marketing-icon-2.png	73	72	2026-03-04 21:30:06.094781+00	\N	\N	\N	\N	1	2013	1	69ca3cb7285e31abeaead291c6d341967ea33517	
15	neve-marketing-icon-3	original_images/neve-marketing-icon-3.png	73	72	2026-03-04 21:30:26.515311+00	\N	\N	\N	\N	1	2257	1	1c85f56822f10914171c786f7ecb6a0641245e66	
\.


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailimages_rendition (id, width, height, focal_point_key, filter_spec, image_id, file) FROM stdin;
1	165	162		max-165x165	1	images/Anadaletia.max-165x165.jpg
2	165	165		max-165x165	2	images/mberi2.max-165x165.jpg
3	800	520	2e16d0ba	fill-800x520	1	images/Anadaletia.2e16d0ba.fill-800x520.jpg
4	123	165		max-165x165	3	images/mangoueleh.max-165x165.jpg
5	794	518	2e16d0ba	fill-800x520	2	images/mberi2.2e16d0ba.fill-800x520.jpg
6	800	520	2e16d0ba	fill-800x520	3	images/mangoueleh.2e16d0ba.fill-800x520.jpg
7	123	165		max-165x165	4	images/Essombingoue.max-165x165.jpg
8	143	165		max-165x165	5	images/Doria02.max-165x165.jpg
9	165	124		max-165x165	6	images/Doria01.max-165x165.jpg
10	750	488	2e16d0ba	fill-800x520	4	images/Essombingoue.2e16d0ba.fill-800x520.jpg
11	800	520	2e16d0ba	fill-800x520	6	images/Doria01.2e16d0ba.fill-800x520.jpg
12	80	52	2e16d0ba	fill-80x52	1	images/Anadaletia.2e16d0ba.fill-80x52.jpg
13	80	52	2e16d0ba	fill-80x52	2	images/mberi2.2e16d0ba.fill-80x52.jpg
14	80	52	2e16d0ba	fill-80x52	3	images/mangoueleh.2e16d0ba.fill-80x52.jpg
15	80	52	2e16d0ba	fill-80x52	4	images/Essombingoue.2e16d0ba.fill-80x52.jpg
16	80	52	2e16d0ba	fill-80x52	6	images/Doria01.2e16d0ba.fill-80x52.jpg
17	400	400	2e16d0ba	fill-400x400	1	images/Anadaletia.2e16d0ba.fill-400x400.jpg
18	400	400	2e16d0ba	fill-400x400	2	images/mberi2.2e16d0ba.fill-400x400.jpg
19	400	400	2e16d0ba	fill-400x400	3	images/mangoueleh.2e16d0ba.fill-400x400.jpg
20	400	400	2e16d0ba	fill-400x400	4	images/Essombingoue.2e16d0ba.fill-400x400.jpg
21	400	400	2e16d0ba	fill-400x400	6	images/Doria01.2e16d0ba.fill-400x400.jpg
22	165	165		max-165x165	7	images/nana.max-165x165.jpg
23	165	165		max-165x165	8	images/Ossete.max-165x165.jpg
24	165	165		max-165x165	9	images/Matokot.max-165x165.jpg
25	165	165		max-165x165	10	images/Koukodia2.max-165x165.jpg
26	123	165		max-165x165	11	images/Andzouangoli.max-165x165.jpg
27	164	165		max-165x165	12	images/etokabeka2.max-165x165.jpg
28	400	400	2e16d0ba	fill-400x400	7	images/nana.2e16d0ba.fill-400x400.jpg
29	400	400	2e16d0ba	fill-400x400	8	images/Ossete.2e16d0ba.fill-400x400.jpg
30	400	400	2e16d0ba	fill-400x400	9	images/Matokot.2e16d0ba.fill-400x400.jpg
31	232	232	2e16d0ba	fill-400x400	10	images/Koukodia2.2e16d0ba.fill-400x400.jpg
32	400	400	2e16d0ba	fill-400x400	11	images/Andzouangoli.2e16d0ba.fill-400x400.jpg
33	400	400	2e16d0ba	fill-400x400	12	images/etokabeka2.2e16d0ba.fill-400x400.jpg
34	232	232		original	10	images/Koukodia2.original.jpg
35	232	232		max-800x600	10	images/Koukodia2.max-800x600.jpg
36	80	80	2e16d0ba	fill-80x80	12	images/etokabeka2.2e16d0ba.fill-80x80.jpg
37	500	500		max-1200x500	12	images/etokabeka2.max-1200x500.jpg
38	642	300	2e16d0ba	fill-900x420	12	images/etokabeka2.2e16d0ba.fill-900x420.jpg
39	90	42	2e16d0ba	fill-90x42	12	images/etokabeka2.2e16d0ba.fill-90x42.jpg
40	90	90	2e16d0ba	fill-90x90	12	images/etokabeka2.2e16d0ba.fill-90x90.jpg
41	120	120	2e16d0ba	fill-120x120	12	images/etokabeka2.2e16d0ba.fill-120x120.jpg
42	120	120	2e16d0ba	fill-120x120	1	images/Anadaletia.2e16d0ba.fill-120x120.jpg
43	80	80	2e16d0ba	fill-80x80	1	images/Anadaletia.2e16d0ba.fill-80x80.jpg
44	506	500		max-1200x500	1	images/Anadaletia.max-1200x500.jpg
45	642	642		width-2000	12	images/etokabeka2.width-2000.jpg
46	72	72		max-165x165	13	images/neve-marketing-icon-1.max-165x165.png
47	73	72		max-165x165	14	images/neve-marketing-icon-2.max-165x165.png
48	73	72		max-165x165	15	images/neve-marketing-icon-3.max-165x165.png
49	72	44	2e16d0ba	fill-600x360	13	images/neve-marketing-icon-1.2e16d0ba.fill-600x360.png
50	73	44	2e16d0ba	fill-600x360	15	images/neve-marketing-icon-3.2e16d0ba.fill-600x360.png
51	73	44	2e16d0ba	fill-600x360	14	images/neve-marketing-icon-2.2e16d0ba.fill-600x360.png
52	810	330	2e16d0ba	fill-1600x650	11	images/Andzouangoli.2e16d0ba.fill-1600x650.jpg
53	470	192	2e16d0ba	fill-1600x650	8	images/Ossete.2e16d0ba.fill-1600x650.jpg
54	72	72	2e16d0ba	fill-360x360	13	images/neve-marketing-icon-1.2e16d0ba.fill-360x360.png
55	73	72	2e16d0ba	fill-360x360	15	images/neve-marketing-icon-3.2e16d0ba.fill-360x360.png
56	73	72	2e16d0ba	fill-360x360	14	images/neve-marketing-icon-2.2e16d0ba.fill-360x360.png
57	8	72	2e16d0ba	fill-36x360	13	images/neve-marketing-icon-1.2e16d0ba.fill-36x360.png
58	9	72	2e16d0ba	fill-36x360	15	images/neve-marketing-icon-3.2e16d0ba.fill-36x360.png
59	9	72	2e16d0ba	fill-36x360	14	images/neve-marketing-icon-2.2e16d0ba.fill-36x360.png
60	8	72	2e16d0ba	fill-360x3600	13	images/neve-marketing-icon-1.2e16d0ba.fill-360x3600.png
61	9	72	2e16d0ba	fill-360x3600	15	images/neve-marketing-icon-3.2e16d0ba.fill-360x3600.png
62	9	72	2e16d0ba	fill-360x3600	14	images/neve-marketing-icon-2.2e16d0ba.fill-360x3600.png
\.


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id, automatically_created, created_at, redirect_page_route_path) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_indexentry; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry (id, object_id, title_norm, content_type_id, autocomplete, body, title) FROM stdin;
4	6	1.25	50	Actualité		Actualité
5	7	0.34868422	51	Assemblée générale budgétaire de l'OIC		Assemblée générale budgétaire de l'OIC
6	8	0.38275862	51	L'OIC : Un engagement solennel au service du développement		L'OIC : Un engagement solennel au service du développement
7	9	0.4236111	51	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)		Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)
8	10	0.6456044	51	Réunion du Conseil National de l'OIC du 22 mars 2025		Réunion du Conseil National de l'OIC du 22 mars 2025
9	11	0.54464287	51	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)		Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)
10	12	0.88131315	51	Discours d’investiture du Président de l’OIC		Discours d’investiture du Président de l’OIC
11	13	0.4965909	51	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »		Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »
12	14	0.46926406	51	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025		Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025
13	15	0.5261438	51	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »		Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »
14	16	1.0295858	51	Fédération des Organisations Africaines d'Ingénierie		Fédération des Organisations Africaines d'Ingénierie
15	17	0.4119374	51	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO		Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
16	18	1.1461538	51	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora		Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
17	19	2.85625	51	Regards d'ingénieurs		Regards d'ingénieurs
18	20	1.0363636	51	Campagne nationale de recensement et d’adhésion à l’OIC		Campagne nationale de recensement et d’adhésion à l’OIC
19	21	1.85	51	Deuxième anniversaire de l’OIC		Deuxième anniversaire de l’OIC
20	22	1.645933	51	Activités du mois de janvier 2026		Activités du mois de janvier 2026
21	1	14.236111	1	Root		Root
22	23	7.7593985	49	Accueil		Accueil
23	1	5.21	28	Anadaletia		Anadaletia
24	2	8.31746	28	mberi2		mberi2
25	24	1.8776224	57	Membres du bureau exécutif		Membres du bureau exécutif
26	3	4.7130437	28	mangoueleh		mangoueleh
27	4	3.8055556	28	Essombingoue		Essombingoue
28	5	6.302857	28	Doria02		Doria02
29	6	6.0989013	28	Doria01		Doria01
30	25	2.3209877	58	Assemblée générale		Assemblée générale
31	26	2.5535715	57	Conseil national		Conseil national
32	7	9.896552	28	nana		nana
33	8	6.411111	28	Ossete		Ossete
34	9	5.35023	28	Matokot		Matokot
35	10	4.0625	28	Koukodia2		Koukodia2
36	11	2.9848485	28	Andzouangoli		Andzouangoli
37	12	3.5058823	28	etokabeka2		etokabeka2
38	1	0.5868853	27	Loi n° 2-2023 régissant la profession de l'ingénieur au Congo		Loi n° 2-2023 régissant la profession de l'ingénieur au Congo
39	27	1.8596492	61	Textes fondamentaux		Textes fondamentaux
40	2	6.902703	27	LOI 3		LOI 3
41	3	1.318826	27	REGLEMENT INTERIEUR - 2024		REGLEMENT INTERIEUR - 2024
42	4	0.7519509	27	LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025		LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025
43	5	1.3221154	27	Délibération cotisations		Délibération cotisations
44	28	3.0842571	58	A propos de		A propos de
45	13	1.6009071	28	neve-marketing-icon-1		neve-marketing-icon-1
46	14	1.5869324	28	neve-marketing-icon-2		neve-marketing-icon-2
47	15	1.573593	28	neve-marketing-icon-3		neve-marketing-icon-3
\.


--
-- Data for Name: wagtailsearch_indexentry_fts; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry_fts (autocomplete, body, title) FROM stdin;
Actualité		Actualité
Assemblée générale budgétaire de l'OIC		Assemblée générale budgétaire de l'OIC
L'OIC : Un engagement solennel au service du développement		L'OIC : Un engagement solennel au service du développement
Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)		Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)
Réunion du Conseil National de l'OIC du 22 mars 2025		Réunion du Conseil National de l'OIC du 22 mars 2025
Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)		Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)
Discours d’investiture du Président de l’OIC		Discours d’investiture du Président de l’OIC
Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »		Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »
Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025		Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025
Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »		Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »
Fédération des Organisations Africaines d'Ingénierie		Fédération des Organisations Africaines d'Ingénierie
Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO		Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora		Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
Regards d'ingénieurs		Regards d'ingénieurs
Campagne nationale de recensement et d’adhésion à l’OIC		Campagne nationale de recensement et d’adhésion à l’OIC
Deuxième anniversaire de l’OIC		Deuxième anniversaire de l’OIC
Activités du mois de janvier 2026		Activités du mois de janvier 2026
Root		Root
Accueil		Accueil
Anadaletia		Anadaletia
mberi2		mberi2
Membres du bureau exécutif		Membres du bureau exécutif
mangoueleh		mangoueleh
Essombingoue		Essombingoue
Doria02		Doria02
Doria01		Doria01
Assemblée générale		Assemblée générale
Conseil national		Conseil national
nana		nana
Ossete		Ossete
Matokot		Matokot
Koukodia2		Koukodia2
Andzouangoli		Andzouangoli
etokabeka2		etokabeka2
Loi n° 2-2023 régissant la profession de l'ingénieur au Congo		Loi n° 2-2023 régissant la profession de l'ingénieur au Congo
Textes fondamentaux		Textes fondamentaux
LOI 3		LOI 3
REGLEMENT INTERIEUR - 2024		REGLEMENT INTERIEUR - 2024
LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025		LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025
Délibération cotisations		Délibération cotisations
A propos de		A propos de
neve-marketing-icon-1		neve-marketing-icon-1
neve-marketing-icon-2		neve-marketing-icon-2
neve-marketing-icon-3		neve-marketing-icon-3
\.


--
-- Data for Name: wagtailsearch_indexentry_fts_config; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry_fts_config (k, v) FROM stdin;
version	4
\.


--
-- Data for Name: wagtailsearch_indexentry_fts_content; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry_fts_content (id, c0, c1, c2) FROM stdin;
4	Actualité		Actualité
5	Assemblée générale budgétaire de l'OIC		Assemblée générale budgétaire de l'OIC
6	L'OIC : Un engagement solennel au service du développement		L'OIC : Un engagement solennel au service du développement
7	Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)		Assemblée générale constitutive de l'Ordre des Ingénieurs du Congo (OIC)
8	Réunion du Conseil National de l'OIC du 22 mars 2025		Réunion du Conseil National de l'OIC du 22 mars 2025
9	Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)		Assemblée générale inaugurale de l'Ordre des Ingénieurs du Congo (OIC)
10	Discours d’investiture du Président de l’OIC		Discours d’investiture du Président de l’OIC
11	Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »		Discours à l’occasion du premier anniversaire de l’Ordre des Ingénieurs du Congo « OIC »
12	Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025		Mot du président de l’OIC à la cérémonie de prestation de serment des ingénieurs inscrits au tableau 2025
13	Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »		Mot d’ouverture de l’assemblée générale inaugurale de l’Ordre des Ingénieurs du Congo en sigle « OIC »
14	Fédération des Organisations Africaines d'Ingénierie		Fédération des Organisations Africaines d'Ingénierie
15	Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO		Remise du premier tableau de l'OIC au ministre d'Etat, Ministre de l'Aménagement du Territoire et des Grands Travaux par l'Honorable Blaise AMBETO
16	Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora		Ingénieur BIKOUTA BIAHOUA Don De Dieu Prince Isidora
17	Regards d'ingénieurs		Regards d'ingénieurs
18	Campagne nationale de recensement et d’adhésion à l’OIC		Campagne nationale de recensement et d’adhésion à l’OIC
19	Deuxième anniversaire de l’OIC		Deuxième anniversaire de l’OIC
20	Activités du mois de janvier 2026		Activités du mois de janvier 2026
21	Root		Root
22	Accueil		Accueil
23	Anadaletia		Anadaletia
24	mberi2		mberi2
25	Membres du bureau exécutif		Membres du bureau exécutif
26	mangoueleh		mangoueleh
27	Essombingoue		Essombingoue
28	Doria02		Doria02
29	Doria01		Doria01
30	Assemblée générale		Assemblée générale
31	Conseil national		Conseil national
32	nana		nana
33	Ossete		Ossete
34	Matokot		Matokot
35	Koukodia2		Koukodia2
36	Andzouangoli		Andzouangoli
37	etokabeka2		etokabeka2
38	Loi n° 2-2023 régissant la profession de l'ingénieur au Congo		Loi n° 2-2023 régissant la profession de l'ingénieur au Congo
39	Textes fondamentaux		Textes fondamentaux
40	LOI 3		LOI 3
41	REGLEMENT INTERIEUR - 2024		REGLEMENT INTERIEUR - 2024
42	LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025		LISTE DES INGENIEURS INSCRITS AU TABLEAU  2025
43	Délibération cotisations		Délibération cotisations
44	A propos de		A propos de
45	neve-marketing-icon-1		neve-marketing-icon-1
46	neve-marketing-icon-2		neve-marketing-icon-2
47	neve-marketing-icon-3		neve-marketing-icon-3
\.


--
-- Data for Name: wagtailsearch_indexentry_fts_data; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry_fts_data (id, block) FROM stdin;
1	\\x2c816e00816e
10	\\x00000000020e820d000e0501010101010201010301010401010601010701010801010901010a01010b01010c01010d01010e01010000
137438953473	\\x000000360230322e0905010205010469636f6e2e090401020401096d61726b6574696e672e090301020301046e6576652e090201020204090c11
274877906945	\\x000000360230322e0905010205010469636f6e2e090401020401096d61726b6574696e672e090301020301046e6576652e090201020204090c11
412316860417	\\x000000360230332f0805010205010469636f6e2f080401020401096d61726b6574696e672f080301020301046e6576652f080201020204090c11
549755813889	\\x000000360230332f0905010205010469636f6e2f090401020401096d61726b6574696e672f090301020301046e6576652f090201020204090c11
687194767361	\\x0000088a0230312d0905010205010132260904010204080805010205020330323326090501020504013429090401020404013508090c01020c0409140102141e090801020804013614090701020702013208090a01020a0101332809030102030101610b09030102030109080102080609090102091a0902010202020663637565696c160902010202030774697669746573140902010202040675616c697465040902010202020764686573696f6e12090801020802096672696361696e65730e090501020502056d6265746f0f091b01021b0309656e6167656d656e740f091001021002096e6164616c65746961170902010202030a647a6f75616e676f6c69240902010202030a6e6976657273616972650b090801020808090301020302087373656d626c656505090201020202090201020202090201020204090701020711090201020202017506090701020706091201021203090901020917090c01020c0409060102060107626961686f756110090401020403056b6f75746110090301020302056c616973650f091a01021a0209756467657461697265050904010204030472656175190904010204010863616d7061676e6512090201020202086572656d6f6e69650c090a01020a02046f6e676f07090b01020b02090b01020b02090f01020f02091001021019090d01020d04047365696c0809040102041709020102020508746974757469766507090401020403097469736174696f6e732b09030102030101640a090301020303090301020301090601020601090b01020b02090301020301090701020702016505090501020502090501020501090601020601090501020501090701020701090901020901110508040102050804010d050701020507020d060a0102060a010906010206020904010204010904010204010905010205120909010209060904010204030a6c696265726174696f6e2b090201020203017307090801020802090801020802090c01020c01090f01020f01090d01020d0109030102030109140102141b09030102030306757869656d65130902010202030b76656c6f7070656d656e7406090a01020a0203696575100907010207030673636f7572730a090201020201090201020202026f6e100905010205030572696130311d09020102020701321c090201020202017506090901020901090a01020a010d03080102030801090a01020a010905010205010d060a0102060a01090301020301090f01020f020d0310010203100509030102030509030102030102656e0d09110102110308676167656d656e74060905010205020b73736f6d62696e676f75651b09020102020201740f0913010213030906010206030261740f090c01020c03086f6b6162656b6132250902010202020778656375746966190905010205010a66656465726174696f6e0e0902010202020b6f6e64616d656e74617578270903010203010867656e6572616c65050903010203020903010203020903010203040908010208110903010203020572616e64730f09150102150109686f6e6f7261626c650f0919010219010469636f6e2d090401020401080401020402096e6175677572616c65090904010204040909010209030867656e69657269650e09070102070802757210090201020216090b01020b0a017307090901020902090901020902090d01020d01091001021001090e01020e04090401020419090401020403067363726974730c09110102111e090501020503077465726965757229090301020303097665737469747572650a090401020402067369646f726110090901020901076a616e7669657214090601020601096b6f756b6f6469613223090201020201016c050906010206010902010202010906010206010907010207010906010206010908010208010d040801020408010906010206010d0607010206070211070a0b0102070a0b03090a01020a01090501020513090a01020a0201610c09090102091a09070102070204697374652a090201020202026f69260902010202020902010202010a6d616e676f75656c65681a09020102020307726b6574696e672d090301020301080301020304017308090b01020b0305746f6b6f74220902010202020562657269321809020102020206656d627265731909020102020207696e69737472650f0d0a0501020a0502036f69731409040102040301740c090201020201090201020201016e2609030102030203616e61200902010202030674696f6e616c08090501020517090301020309016512090301020302036576652d090201020201080201020201086f63636173696f6e0b09050102050202696305090701020701090301020301090c01020c01090801020801090c01020c01090901020901091001021001090701020701091301021302090801020803090b01020b01090601020602047264726507090701020702090701020702090b01020b02090c01020c030b67616e69736174696f6e730e090401020402057373657465210902010202020875766572747572650d090401020401037061720f0917010217020672656d6965720b09070102070409040102040406736964656e740a09060102060209040102040506746174696f6e0c090c01020c0304696e636510090801020803086f66657373696f6e2609080102080403706f732c0903010203010b726563656e73656d656e74120905010205030567617264731109020102020406697373616e7426090601020604066c656d656e7429090201020203046d6973650f09020102020305756e696f6e08090201020202036f6f7415090201020201077365726d656e740c090e01020e040476696365060908010208020469676c650d091201021202076f6c656e6e656c06090601020601077461626c6561750c09130102130309050102051b0907010207020965727269746f6972650f091201021203047874657327090201020202067261766175780f09160102160102756e06090401020404090f0b09150909091b0e0f0e0f110d1111121828210f0d0d110c101024121011276512330e130b140a0d094b0a10130f0a100f1213280d11121710102d140f110e0f11590f0c101215090d0d0e110b0f090b140911104c1e130d100b14140e0c100b130d0e0e0c0d0b0f0c0c0f1b110c0e
824633720833	\\x000000360230332f0905010205010469636f6e2f090401020401096d61726b6574696e672f090301020301046e6576652f090201020204090c11
962072674305	\\x0000001308306163637565696c16090201020204
1099511627777	\\x0000001308306163637565696c16090201020204
1236950581249	\\x0000001308306163637565696c16090201020204
1374389534721	\\x0000001308306163637565696c16090201020204
1511828488193	\\x0000001308306163637565696c16090201020204
1649267441665	\\x0000001308306163637565696c16090201020204
1786706395137	\\x000000230830636f6e7365696c1f090201020201086e6174696f6e616c1f0903010203040f
1924145348609	\\x000000230830636f6e7365696c1f090201020201086e6174696f6e616c1f0903010203040f
\.


--
-- Data for Name: wagtailsearch_indexentry_fts_docsize; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry_fts_docsize (id, sz) FROM stdin;
4	\\x010001
5	\\x060006
6	\\x090009
7	\\x0b000b
8	\\x0b000b
9	\\x0b000b
10	\\x080008
11	\\x0f000f
12	\\x130013
13	\\x120012
14	\\x060006
15	\\x1a001a
16	\\x080008
17	\\x030003
18	\\x0a000a
19	\\x050005
20	\\x060006
21	\\x010001
22	\\x010001
23	\\x010001
24	\\x010001
25	\\x040004
26	\\x010001
27	\\x010001
28	\\x010001
29	\\x010001
30	\\x020002
31	\\x020002
32	\\x010001
33	\\x010001
34	\\x010001
35	\\x010001
36	\\x010001
37	\\x010001
38	\\x0c000c
39	\\x020002
40	\\x020002
41	\\x030003
42	\\x070007
43	\\x020002
44	\\x030003
45	\\x040004
46	\\x040004
47	\\x040004
\.


--
-- Data for Name: wagtailsearch_indexentry_fts_idx; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailsearch_indexentry_fts_idx (segid, term, pgno) FROM stdin;
1		2
2		2
3		2
4		2
5		2
6		2
7		2
8		2
9		2
10		2
11		2
12		2
13		2
14		2
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: wagtail
--

COPY public.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar, updated_comments_notifications, dismissibles, theme, density, contrast, keyboard_shortcuts) FROM stdin;
1	t	t	t	1				t	{}	system	default	system	t
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, true);


--
-- Name: adhesions_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.adhesions_application_id_seq', 1, false);


--
-- Name: adhesions_applicationcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.adhesions_applicationcomment_id_seq', 1, false);


--
-- Name: adhesions_applicationdocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.adhesions_applicationdocument_id_seq', 1, false);


--
-- Name: adhesions_applicationstatushistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.adhesions_applicationstatushistory_id_seq', 1, false);


--
-- Name: adhesions_candidateprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.adhesions_candidateprofile_id_seq', 1, false);


--
-- Name: adhesions_membershipprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.adhesions_membershipprofile_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 18, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 355, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);


--
-- Name: bibliotheque_bibliothequeitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.bibliotheque_bibliothequeitem_id_seq', 5, true);


--
-- Name: bibliotheque_documentcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.bibliotheque_documentcategory_id_seq', 2, true);


--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.blog_blogcategory_id_seq', 2, true);


--
-- Name: blog_blogpage_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.blog_blogpage_categories_id_seq', 6, true);


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.blog_blogpagetag_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 88, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 248, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: home_footersettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_footersettings_id_seq', 1, true);


--
-- Name: home_footertext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_footertext_id_seq', 1, true);


--
-- Name: home_homeheroslide_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_homeheroslide_id_seq', 3, true);


--
-- Name: home_homequicklink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_homequicklink_id_seq', 4, true);


--
-- Name: home_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_menu_id_seq', 1, true);


--
-- Name: home_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_menuitem_id_seq', 5, true);


--
-- Name: home_submenuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.home_submenuitem_id_seq', 3, true);


--
-- Name: members_annualfee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_annualfee_id_seq', 1, true);


--
-- Name: members_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_member_id_seq', 11, true);


--
-- Name: members_memberannualdues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_memberannualdues_id_seq', 1, true);


--
-- Name: members_memberprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_memberprofile_id_seq', 1, true);


--
-- Name: members_orgchartsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_orgchartsection_id_seq', 4, true);


--
-- Name: members_orgchartsectionmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_orgchartsectionmember_id_seq', 16, true);


--
-- Name: members_orgsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_orgsection_id_seq', 1, true);


--
-- Name: members_usermenufragment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_usermenufragment_id_seq', 1, true);


--
-- Name: members_usermenufragmentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.members_usermenufragmentitem_id_seq', 2, true);


--
-- Name: membres_annualfee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_annualfee_id_seq', 1, true);


--
-- Name: membres_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_member_id_seq', 11, true);


--
-- Name: membres_memberannualdues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_memberannualdues_id_seq', 1, true);


--
-- Name: membres_memberprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_memberprofile_id_seq', 1, true);


--
-- Name: membres_orgchartsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_orgchartsection_id_seq', 4, true);


--
-- Name: membres_orgchartsectionmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_orgchartsectionmember_id_seq', 16, true);


--
-- Name: membres_orgsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.membres_orgsection_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, true);


--
-- Name: wagtailadmin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailadmin_admin_id_seq', 1, true);


--
-- Name: wagtailadmin_editingsession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailadmin_editingsession_id_seq', 1, true);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_collection_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_groups_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_id_seq', 1, true);


--
-- Name: wagtailcore_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_comment_id_seq', 1, true);


--
-- Name: wagtailcore_commentreply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_commentreply_id_seq', 1, true);


--
-- Name: wagtailcore_groupapprovaltask_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_groupapprovaltask_groups_id_seq', 1, true);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_groupcollectionpermission_id_seq', 12, true);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_grouppagepermission_id_seq', 7, true);


--
-- Name: wagtailcore_groupsitepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_groupsitepermission_id_seq', 1, true);


--
-- Name: wagtailcore_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_locale_id_seq', 1, true);


--
-- Name: wagtailcore_modellogentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_modellogentry_id_seq', 48, true);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_page_id_seq', 28, true);


--
-- Name: wagtailcore_pagelogentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_pagelogentry_id_seq', 159, true);


--
-- Name: wagtailcore_pagesubscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_pagesubscription_id_seq', 26, true);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_groups_id_seq', 1, true);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_id_seq', 1, true);


--
-- Name: wagtailcore_referenceindex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_referenceindex_id_seq', 92, true);


--
-- Name: wagtailcore_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_revision_id_seq', 74, true);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_site_id_seq', 2, true);


--
-- Name: wagtailcore_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_task_id_seq', 1, true);


--
-- Name: wagtailcore_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_taskstate_id_seq', 1, true);


--
-- Name: wagtailcore_uploadedfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_uploadedfile_id_seq', 1, true);


--
-- Name: wagtailcore_workflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_workflow_id_seq', 1, true);


--
-- Name: wagtailcore_workflowstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_workflowstate_id_seq', 1, true);


--
-- Name: wagtailcore_workflowtask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailcore_workflowtask_id_seq', 1, true);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtaildocs_document_id_seq', 5, true);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailembeds_embed_id_seq', 1, true);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailforms_formsubmission_id_seq', 1, true);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailimages_image_id_seq', 15, true);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailimages_rendition_id_seq', 62, true);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailredirects_redirect_id_seq', 1, true);


--
-- Name: wagtailsearch_indexentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailsearch_indexentry_id_seq', 47, true);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wagtail
--

SELECT pg_catalog.setval('public.wagtailusers_userprofile_id_seq', 1, true);


--
-- Name: adhesions_application adhesions_application_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_application
    ADD CONSTRAINT adhesions_application_pkey PRIMARY KEY (id);


--
-- Name: adhesions_application adhesions_application_reference_key; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_application
    ADD CONSTRAINT adhesions_application_reference_key UNIQUE (reference);


--
-- Name: adhesions_applicationcomment adhesions_applicationcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationcomment
    ADD CONSTRAINT adhesions_applicationcomment_pkey PRIMARY KEY (id);


--
-- Name: adhesions_applicationdocument adhesions_applicationdoc_application_id_document__2f369832_uniq; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationdocument
    ADD CONSTRAINT adhesions_applicationdoc_application_id_document__2f369832_uniq UNIQUE (application_id, document_type);


--
-- Name: adhesions_applicationdocument adhesions_applicationdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationdocument
    ADD CONSTRAINT adhesions_applicationdocument_pkey PRIMARY KEY (id);


--
-- Name: adhesions_applicationstatushistory adhesions_applicationstatushistory_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationstatushistory
    ADD CONSTRAINT adhesions_applicationstatushistory_pkey PRIMARY KEY (id);


--
-- Name: adhesions_candidateprofile adhesions_candidateprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_candidateprofile
    ADD CONSTRAINT adhesions_candidateprofile_pkey PRIMARY KEY (id);


--
-- Name: adhesions_candidateprofile adhesions_candidateprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_candidateprofile
    ADD CONSTRAINT adhesions_candidateprofile_user_id_key UNIQUE (user_id);


--
-- Name: adhesions_membershipprofile adhesions_membershipprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_membershipprofile
    ADD CONSTRAINT adhesions_membershipprofile_pkey PRIMARY KEY (id);


--
-- Name: adhesions_membershipprofile adhesions_membershipprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_membershipprofile
    ADD CONSTRAINT adhesions_membershipprofile_user_id_key UNIQUE (user_id);


--
-- Name: django_migrations idx_20217_django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT idx_20217_django_migrations_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions idx_20224_auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT idx_20224_auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups idx_20229_auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT idx_20229_auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions idx_20234_auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT idx_20234_auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log idx_20239_django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT idx_20239_django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type idx_20246_django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT idx_20246_django_content_type_pkey PRIMARY KEY (id);


--
-- Name: auth_permission idx_20253_auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT idx_20253_auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_group idx_20260_auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT idx_20260_auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_user idx_20267_auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT idx_20267_auth_user_pkey PRIMARY KEY (id);


--
-- Name: django_session idx_20273_sqlite_autoindex_django_session_1; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT idx_20273_sqlite_autoindex_django_session_1 PRIMARY KEY (session_key);


--
-- Name: taggit_taggeditem idx_20279_taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT idx_20279_taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag idx_20284_taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT idx_20284_taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection idx_20291_wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT idx_20291_wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission idx_20298_wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT idx_20298_wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailadmin_admin idx_20303_wagtailadmin_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailadmin_admin
    ADD CONSTRAINT idx_20303_wagtailadmin_admin_pkey PRIMARY KEY (id);


--
-- Name: wagtailadmin_editingsession idx_20308_wagtailadmin_editingsession_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailadmin_editingsession
    ADD CONSTRAINT idx_20308_wagtailadmin_editingsession_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups idx_20315_wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT idx_20315_wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction idx_20320_wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT idx_20320_wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction idx_20327_wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT idx_20327_wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups idx_20334_wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT idx_20334_wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site idx_20339_wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT idx_20339_wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_task idx_20346_wagtailcore_task_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_task
    ADD CONSTRAINT idx_20346_wagtailcore_task_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_workflow idx_20353_wagtailcore_workflow_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflow
    ADD CONSTRAINT idx_20353_wagtailcore_workflow_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupapprovaltask idx_20359_wagtailcore_groupapprovaltask_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupapprovaltask
    ADD CONSTRAINT idx_20359_wagtailcore_groupapprovaltask_pkey PRIMARY KEY (task_ptr_id);


--
-- Name: wagtailcore_workflowpage idx_20362_wagtailcore_workflowpage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowpage
    ADD CONSTRAINT idx_20362_wagtailcore_workflowpage_pkey PRIMARY KEY (page_id);


--
-- Name: wagtailcore_workflowtask idx_20366_wagtailcore_workflowtask_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowtask
    ADD CONSTRAINT idx_20366_wagtailcore_workflowtask_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupapprovaltask_groups idx_20371_wagtailcore_groupapprovaltask_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupapprovaltask_groups
    ADD CONSTRAINT idx_20371_wagtailcore_groupapprovaltask_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_locale idx_20376_wagtailcore_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_locale
    ADD CONSTRAINT idx_20376_wagtailcore_locale_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page idx_20383_wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT idx_20383_wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_commentreply idx_20390_wagtailcore_commentreply_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_commentreply
    ADD CONSTRAINT idx_20390_wagtailcore_commentreply_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagesubscription idx_20397_wagtailcore_pagesubscription_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagesubscription
    ADD CONSTRAINT idx_20397_wagtailcore_pagesubscription_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_comment idx_20402_wagtailcore_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_comment
    ADD CONSTRAINT idx_20402_wagtailcore_comment_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_referenceindex idx_20409_wagtailcore_referenceindex_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_referenceindex
    ADD CONSTRAINT idx_20409_wagtailcore_referenceindex_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_taskstate idx_20416_wagtailcore_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate
    ADD CONSTRAINT idx_20416_wagtailcore_taskstate_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_workflowstate idx_20423_wagtailcore_workflowstate_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate
    ADD CONSTRAINT idx_20423_wagtailcore_workflowstate_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_workflowcontenttype idx_20429_wagtailcore_workflowcontenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowcontenttype
    ADD CONSTRAINT idx_20429_wagtailcore_workflowcontenttype_pkey PRIMARY KEY (content_type_id);


--
-- Name: wagtailcore_modellogentry idx_20433_wagtailcore_modellogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_modellogentry
    ADD CONSTRAINT idx_20433_wagtailcore_modellogentry_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagelogentry idx_20440_wagtailcore_pagelogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagelogentry
    ADD CONSTRAINT idx_20440_wagtailcore_pagelogentry_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission idx_20447_wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT idx_20447_wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_revision idx_20452_wagtailcore_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_revision
    ADD CONSTRAINT idx_20452_wagtailcore_revision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_uploadedfile idx_20459_wagtailcore_uploadedfile_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_uploadedfile
    ADD CONSTRAINT idx_20459_wagtailcore_uploadedfile_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupsitepermission idx_20466_wagtailcore_groupsitepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupsitepermission
    ADD CONSTRAINT idx_20466_wagtailcore_groupsitepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document idx_20471_wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT idx_20471_wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed idx_20478_wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT idx_20478_wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailforms_formsubmission idx_20485_wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT idx_20485_wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition idx_20492_wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT idx_20492_wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image idx_20499_wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT idx_20499_wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect idx_20506_wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT idx_20506_wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_indexentry idx_20513_wagtailsearch_indexentry_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry
    ADD CONSTRAINT idx_20513_wagtailsearch_indexentry_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_indexentry_fts_data idx_20524_wagtailsearch_indexentry_fts_data_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry_fts_data
    ADD CONSTRAINT idx_20524_wagtailsearch_indexentry_fts_data_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_indexentry_fts_idx idx_20529_sqlite_autoindex_wagtailsearch_indexentry_fts_idx_1; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry_fts_idx
    ADD CONSTRAINT idx_20529_sqlite_autoindex_wagtailsearch_indexentry_fts_idx_1 PRIMARY KEY (segid, term);


--
-- Name: wagtailsearch_indexentry_fts_content idx_20534_wagtailsearch_indexentry_fts_content_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry_fts_content
    ADD CONSTRAINT idx_20534_wagtailsearch_indexentry_fts_content_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_indexentry_fts_docsize idx_20539_wagtailsearch_indexentry_fts_docsize_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry_fts_docsize
    ADD CONSTRAINT idx_20539_wagtailsearch_indexentry_fts_docsize_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_indexentry_fts_config idx_20544_sqlite_autoindex_wagtailsearch_indexentry_fts_config_; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry_fts_config
    ADD CONSTRAINT idx_20544_sqlite_autoindex_wagtailsearch_indexentry_fts_config_ PRIMARY KEY (k);


--
-- Name: wagtailusers_userprofile idx_20550_wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT idx_20550_wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: blog_blogindexpage idx_20556_blog_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogindexpage
    ADD CONSTRAINT idx_20556_blog_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_footertext idx_20562_home_footertext_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_footertext
    ADD CONSTRAINT idx_20562_home_footertext_pkey PRIMARY KEY (id);


--
-- Name: home_menu idx_20569_home_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_menu
    ADD CONSTRAINT idx_20569_home_menu_pkey PRIMARY KEY (id);


--
-- Name: home_menuitem idx_20576_home_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_menuitem
    ADD CONSTRAINT idx_20576_home_menuitem_pkey PRIMARY KEY (id);


--
-- Name: home_submenuitem idx_20583_home_submenuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_submenuitem
    ADD CONSTRAINT idx_20583_home_submenuitem_pkey PRIMARY KEY (id);


--
-- Name: home_footersettings idx_20590_home_footersettings_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_footersettings
    ADD CONSTRAINT idx_20590_home_footersettings_pkey PRIMARY KEY (id);


--
-- Name: membres_orgchartpage idx_20596_membres_orgchartpage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartpage
    ADD CONSTRAINT idx_20596_membres_orgchartpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: membres_orgsection idx_20602_membres_orgsection_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgsection
    ADD CONSTRAINT idx_20602_membres_orgsection_pkey PRIMARY KEY (id);


--
-- Name: membres_member idx_20609_membres_member_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_member
    ADD CONSTRAINT idx_20609_membres_member_pkey PRIMARY KEY (id);


--
-- Name: membres_orgchartsection idx_20616_membres_orgchartsection_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsection
    ADD CONSTRAINT idx_20616_membres_orgchartsection_pkey PRIMARY KEY (id);


--
-- Name: membres_orgchartsectionmember idx_20621_membres_orgchartsectionmember_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsectionmember
    ADD CONSTRAINT idx_20621_membres_orgchartsectionmember_pkey PRIMARY KEY (id);


--
-- Name: home_standardpage idx_20625_home_standardpage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_standardpage
    ADD CONSTRAINT idx_20625_home_standardpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: bibliotheque_bibliothequepage idx_20630_bibliotheque_bibliothequepage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequepage
    ADD CONSTRAINT idx_20630_bibliotheque_bibliothequepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: bibliotheque_documentcategory idx_20636_bibliotheque_documentcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_documentcategory
    ADD CONSTRAINT idx_20636_bibliotheque_documentcategory_pkey PRIMARY KEY (id);


--
-- Name: bibliotheque_bibliothequeitem idx_20643_bibliotheque_bibliothequeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequeitem
    ADD CONSTRAINT idx_20643_bibliotheque_bibliothequeitem_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation idx_20650_account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT idx_20650_account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress idx_20657_account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT idx_20657_account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: django_site idx_20664_django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT idx_20664_django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites idx_20671_socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT idx_20671_socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp idx_20676_socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT idx_20676_socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken idx_20683_socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT idx_20683_socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount idx_20690_socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT idx_20690_socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: blog_blogcategory idx_20697_blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogcategory
    ADD CONSTRAINT idx_20697_blog_blogcategory_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpage idx_20703_blog_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage
    ADD CONSTRAINT idx_20703_blog_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogpage_categories idx_20709_blog_blogpage_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage_categories
    ADD CONSTRAINT idx_20709_blog_blogpage_categories_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpagetag idx_20714_blog_blogpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpagetag
    ADD CONSTRAINT idx_20714_blog_blogpagetag_pkey PRIMARY KEY (id);


--
-- Name: home_homepage idx_20718_home_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT idx_20718_home_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_homeheroslide idx_20724_home_homeheroslide_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homeheroslide
    ADD CONSTRAINT idx_20724_home_homeheroslide_pkey PRIMARY KEY (id);


--
-- Name: home_homequicklink idx_20731_home_homequicklink_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homequicklink
    ADD CONSTRAINT idx_20731_home_homequicklink_pkey PRIMARY KEY (id);


--
-- Name: membres_annualfee idx_20738_membres_annualfee_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_annualfee
    ADD CONSTRAINT idx_20738_membres_annualfee_pkey PRIMARY KEY (id);


--
-- Name: membres_memberprofile idx_20745_membres_memberprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberprofile
    ADD CONSTRAINT idx_20745_membres_memberprofile_pkey PRIMARY KEY (id);


--
-- Name: membres_memberannualdues idx_20752_membres_memberannualdues_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberannualdues
    ADD CONSTRAINT idx_20752_membres_memberannualdues_pkey PRIMARY KEY (id);


--
-- Name: membres_payment idx_20758_sqlite_autoindex_membres_payment_1; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_payment
    ADD CONSTRAINT idx_20758_sqlite_autoindex_membres_payment_1 PRIMARY KEY (id);


--
-- Name: members_annualfee idx_20764_members_annualfee_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_annualfee
    ADD CONSTRAINT idx_20764_members_annualfee_pkey PRIMARY KEY (id);


--
-- Name: members_orgchartpage idx_20770_members_orgchartpage_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartpage
    ADD CONSTRAINT idx_20770_members_orgchartpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: members_orgsection idx_20776_members_orgsection_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgsection
    ADD CONSTRAINT idx_20776_members_orgsection_pkey PRIMARY KEY (id);


--
-- Name: members_member idx_20783_members_member_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_member
    ADD CONSTRAINT idx_20783_members_member_pkey PRIMARY KEY (id);


--
-- Name: members_memberprofile idx_20790_members_memberprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberprofile
    ADD CONSTRAINT idx_20790_members_memberprofile_pkey PRIMARY KEY (id);


--
-- Name: members_memberannualdues idx_20797_members_memberannualdues_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberannualdues
    ADD CONSTRAINT idx_20797_members_memberannualdues_pkey PRIMARY KEY (id);


--
-- Name: members_orgchartsection idx_20804_members_orgchartsection_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsection
    ADD CONSTRAINT idx_20804_members_orgchartsection_pkey PRIMARY KEY (id);


--
-- Name: members_orgchartsectionmember idx_20809_members_orgchartsectionmember_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsectionmember
    ADD CONSTRAINT idx_20809_members_orgchartsectionmember_pkey PRIMARY KEY (id);


--
-- Name: members_payment idx_20813_sqlite_autoindex_members_payment_1; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_payment
    ADD CONSTRAINT idx_20813_sqlite_autoindex_members_payment_1 PRIMARY KEY (id);


--
-- Name: members_usermenufragment idx_20819_members_usermenufragment_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_usermenufragment
    ADD CONSTRAINT idx_20819_members_usermenufragment_pkey PRIMARY KEY (id);


--
-- Name: members_usermenufragmentitem idx_20826_members_usermenufragmentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_usermenufragmentitem
    ADD CONSTRAINT idx_20826_members_usermenufragmentitem_pkey PRIMARY KEY (id);


--
-- Name: adhesions_application_assigned_to_id_826a3b30; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_application_assigned_to_id_826a3b30 ON public.adhesions_application USING btree (assigned_to_id);


--
-- Name: adhesions_application_candidate_id_db480466; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_application_candidate_id_db480466 ON public.adhesions_application USING btree (candidate_id);


--
-- Name: adhesions_application_reference_5ca42fab_like; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_application_reference_5ca42fab_like ON public.adhesions_application USING btree (reference varchar_pattern_ops);


--
-- Name: adhesions_applicationcomment_application_id_9c931b81; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_applicationcomment_application_id_9c931b81 ON public.adhesions_applicationcomment USING btree (application_id);


--
-- Name: adhesions_applicationcomment_author_id_4464cc0b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_applicationcomment_author_id_4464cc0b ON public.adhesions_applicationcomment USING btree (author_id);


--
-- Name: adhesions_applicationdocument_application_id_0ed9a9df; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_applicationdocument_application_id_0ed9a9df ON public.adhesions_applicationdocument USING btree (application_id);


--
-- Name: adhesions_applicationdocument_checked_by_id_8748650d; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_applicationdocument_checked_by_id_8748650d ON public.adhesions_applicationdocument USING btree (checked_by_id);


--
-- Name: adhesions_applicationstatushistory_application_id_3eddbad6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_applicationstatushistory_application_id_3eddbad6 ON public.adhesions_applicationstatushistory USING btree (application_id);


--
-- Name: adhesions_applicationstatushistory_changed_by_id_5c73cf56; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX adhesions_applicationstatushistory_changed_by_id_5c73cf56 ON public.adhesions_applicationstatushistory USING btree (changed_by_id);


--
-- Name: idx_20224_auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20224_auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: idx_20224_auth_group_permissions_group_id_permission_id_0cd325b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20224_auth_group_permissions_group_id_permission_id_0cd325b ON public.auth_group_permissions USING btree (group_id, permission_id);


--
-- Name: idx_20224_auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20224_auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: idx_20229_auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20229_auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: idx_20229_auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20229_auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: idx_20229_auth_user_groups_user_id_group_id_94350c0c_uniq; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20229_auth_user_groups_user_id_group_id_94350c0c_uniq ON public.auth_user_groups USING btree (user_id, group_id);


--
-- Name: idx_20234_auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20234_auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: idx_20234_auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20234_auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: idx_20234_auth_user_user_permissions_user_id_permission_id_14a6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20234_auth_user_user_permissions_user_id_permission_id_14a6 ON public.auth_user_user_permissions USING btree (user_id, permission_id);


--
-- Name: idx_20239_django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20239_django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: idx_20239_django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20239_django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: idx_20246_django_content_type_app_label_model_76bd3d3b_uniq; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20246_django_content_type_app_label_model_76bd3d3b_uniq ON public.django_content_type USING btree (app_label, model);


--
-- Name: idx_20253_auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20253_auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: idx_20253_auth_permission_content_type_id_codename_01ab375a_uni; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20253_auth_permission_content_type_id_codename_01ab375a_uni ON public.auth_permission USING btree (content_type_id, codename);


--
-- Name: idx_20260_sqlite_autoindex_auth_group_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20260_sqlite_autoindex_auth_group_1 ON public.auth_group USING btree (name);


--
-- Name: idx_20267_sqlite_autoindex_auth_user_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20267_sqlite_autoindex_auth_user_1 ON public.auth_user USING btree (username);


--
-- Name: idx_20273_django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20273_django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: idx_20279_sqlite_autoindex_taggit_taggeditem_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20279_sqlite_autoindex_taggit_taggeditem_1 ON public.taggit_taggeditem USING btree (content_type_id, object_id, tag_id);


--
-- Name: idx_20279_taggit_tagg_content_8fc721_idx; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20279_taggit_tagg_content_8fc721_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: idx_20279_taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20279_taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: idx_20279_taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20279_taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: idx_20279_taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20279_taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: idx_20284_sqlite_autoindex_taggit_tag_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20284_sqlite_autoindex_taggit_tag_1 ON public.taggit_tag USING btree (name);


--
-- Name: idx_20284_sqlite_autoindex_taggit_tag_2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20284_sqlite_autoindex_taggit_tag_2 ON public.taggit_tag USING btree (slug);


--
-- Name: idx_20291_sqlite_autoindex_wagtailcore_collection_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20291_sqlite_autoindex_wagtailcore_collection_1 ON public.wagtailcore_collection USING btree (path);


--
-- Name: idx_20298_wagtailcore_groupcollectionpermission_collection_id_5; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20298_wagtailcore_groupcollectionpermission_collection_id_5 ON public.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: idx_20298_wagtailcore_groupcollectionpermission_group_id_05d614; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20298_wagtailcore_groupcollectionpermission_group_id_05d614 ON public.wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: idx_20298_wagtailcore_groupcollectionpermission_group_id_collec; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20298_wagtailcore_groupcollectionpermission_group_id_collec ON public.wagtailcore_groupcollectionpermission USING btree (group_id, collection_id, permission_id);


--
-- Name: idx_20298_wagtailcore_groupcollectionpermission_permission_id_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20298_wagtailcore_groupcollectionpermission_permission_id_1 ON public.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: idx_20308_wagtailadmi_content_717955_idx; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20308_wagtailadmi_content_717955_idx ON public.wagtailadmin_editingsession USING btree (content_type_id, object_id);


--
-- Name: idx_20308_wagtailadmin_editingsession_content_type_id_4df7730e; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20308_wagtailadmin_editingsession_content_type_id_4df7730e ON public.wagtailadmin_editingsession USING btree (content_type_id);


--
-- Name: idx_20308_wagtailadmin_editingsession_user_id_6e1a9b70; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20308_wagtailadmin_editingsession_user_id_6e1a9b70 ON public.wagtailadmin_editingsession USING btree (user_id);


--
-- Name: idx_20315_wagtailcore_pageviewrestriction_groups_group_id_6460f; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20315_wagtailcore_pageviewrestriction_groups_group_id_6460f ON public.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: idx_20315_wagtailcore_pageviewrestriction_groups_pageviewrestri; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20315_wagtailcore_pageviewrestriction_groups_pageviewrestri ON public.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: idx_20320_wagtailcore_pageviewrestriction_page_id_15a8bea6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20320_wagtailcore_pageviewrestriction_page_id_15a8bea6 ON public.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: idx_20327_wagtailcore_collectionviewrestriction_collection_id_7; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20327_wagtailcore_collectionviewrestriction_collection_id_7 ON public.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: idx_20334_wagtailcore_collectionviewrestriction_groups_collecti; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20334_wagtailcore_collectionviewrestriction_groups_collecti ON public.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: idx_20334_wagtailcore_collectionviewrestriction_groups_group_id; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20334_wagtailcore_collectionviewrestriction_groups_group_id ON public.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: idx_20339_wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20339_wagtailcore_site_hostname_96b20b46 ON public.wagtailcore_site USING btree (hostname);


--
-- Name: idx_20339_wagtailcore_site_hostname_port_2c626d70_uniq; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20339_wagtailcore_site_hostname_port_2c626d70_uniq ON public.wagtailcore_site USING btree (hostname, port);


--
-- Name: idx_20339_wagtailcore_site_root_page_id_e02fb95c; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20339_wagtailcore_site_root_page_id_e02fb95c ON public.wagtailcore_site USING btree (root_page_id);


--
-- Name: idx_20346_wagtailcore_task_content_type_id_249ab8ba; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20346_wagtailcore_task_content_type_id_249ab8ba ON public.wagtailcore_task USING btree (content_type_id);


--
-- Name: idx_20362_wagtailcore_workflowpage_workflow_id_56f56ff6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20362_wagtailcore_workflowpage_workflow_id_56f56ff6 ON public.wagtailcore_workflowpage USING btree (workflow_id);


--
-- Name: idx_20366_wagtailcore_workflowtask_task_id_ce7716fe; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20366_wagtailcore_workflowtask_task_id_ce7716fe ON public.wagtailcore_workflowtask USING btree (task_id);


--
-- Name: idx_20366_wagtailcore_workflowtask_workflow_id_b9717175; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20366_wagtailcore_workflowtask_workflow_id_b9717175 ON public.wagtailcore_workflowtask USING btree (workflow_id);


--
-- Name: idx_20366_wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20366_wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b ON public.wagtailcore_workflowtask USING btree (workflow_id, task_id);


--
-- Name: idx_20371_wagtailcore_groupapprovaltask_groups_group_id_2e64b61; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20371_wagtailcore_groupapprovaltask_groups_group_id_2e64b61 ON public.wagtailcore_groupapprovaltask_groups USING btree (group_id);


--
-- Name: idx_20371_wagtailcore_groupapprovaltask_groups_groupapprovaltas; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20371_wagtailcore_groupapprovaltask_groups_groupapprovaltas ON public.wagtailcore_groupapprovaltask_groups USING btree (groupapprovaltask_id, group_id);


--
-- Name: idx_20376_sqlite_autoindex_wagtailcore_locale_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20376_sqlite_autoindex_wagtailcore_locale_1 ON public.wagtailcore_locale USING btree (language_code);


--
-- Name: idx_20383_sqlite_autoindex_wagtailcore_page_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20383_sqlite_autoindex_wagtailcore_page_1 ON public.wagtailcore_page USING btree (path);


--
-- Name: idx_20383_wagtailcore_page_alias_of_id_12945502; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_alias_of_id_12945502 ON public.wagtailcore_page USING btree (alias_of_id);


--
-- Name: idx_20383_wagtailcore_page_content_type_id_c28424df; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_content_type_id_c28424df ON public.wagtailcore_page USING btree (content_type_id);


--
-- Name: idx_20383_wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_first_published_at_2b5dd637 ON public.wagtailcore_page USING btree (first_published_at);


--
-- Name: idx_20383_wagtailcore_page_latest_revision_id_e60fef51; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_latest_revision_id_e60fef51 ON public.wagtailcore_page USING btree (latest_revision_id);


--
-- Name: idx_20383_wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_live_revision_id_930bd822 ON public.wagtailcore_page USING btree (live_revision_id);


--
-- Name: idx_20383_wagtailcore_page_locale_id_3c7e30a6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_locale_id_3c7e30a6 ON public.wagtailcore_page USING btree (locale_id);


--
-- Name: idx_20383_wagtailcore_page_locked_by_id_bcb86245; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_locked_by_id_bcb86245 ON public.wagtailcore_page USING btree (locked_by_id);


--
-- Name: idx_20383_wagtailcore_page_owner_id_fbf7c332; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_owner_id_fbf7c332 ON public.wagtailcore_page USING btree (owner_id);


--
-- Name: idx_20383_wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20383_wagtailcore_page_slug_e7c11b8f ON public.wagtailcore_page USING btree (slug);


--
-- Name: idx_20383_wagtailcore_page_translation_key_locale_id_9b041bad_u; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20383_wagtailcore_page_translation_key_locale_id_9b041bad_u ON public.wagtailcore_page USING btree (translation_key, locale_id);


--
-- Name: idx_20390_wagtailcore_commentreply_comment_id_afc7e027; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20390_wagtailcore_commentreply_comment_id_afc7e027 ON public.wagtailcore_commentreply USING btree (comment_id);


--
-- Name: idx_20390_wagtailcore_commentreply_user_id_d0b3b9c3; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20390_wagtailcore_commentreply_user_id_d0b3b9c3 ON public.wagtailcore_commentreply USING btree (user_id);


--
-- Name: idx_20397_wagtailcore_pagesubscription_page_id_a085e7a6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20397_wagtailcore_pagesubscription_page_id_a085e7a6 ON public.wagtailcore_pagesubscription USING btree (page_id);


--
-- Name: idx_20397_wagtailcore_pagesubscription_page_id_user_id_0cef73ed; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20397_wagtailcore_pagesubscription_page_id_user_id_0cef73ed ON public.wagtailcore_pagesubscription USING btree (page_id, user_id);


--
-- Name: idx_20397_wagtailcore_pagesubscription_user_id_89d7def9; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20397_wagtailcore_pagesubscription_user_id_89d7def9 ON public.wagtailcore_pagesubscription USING btree (user_id);


--
-- Name: idx_20402_wagtailcore_comment_page_id_108444b5; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20402_wagtailcore_comment_page_id_108444b5 ON public.wagtailcore_comment USING btree (page_id);


--
-- Name: idx_20402_wagtailcore_comment_resolved_by_id_a282aa0e; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20402_wagtailcore_comment_resolved_by_id_a282aa0e ON public.wagtailcore_comment USING btree (resolved_by_id);


--
-- Name: idx_20402_wagtailcore_comment_revision_created_id_1d058279; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20402_wagtailcore_comment_revision_created_id_1d058279 ON public.wagtailcore_comment USING btree (revision_created_id);


--
-- Name: idx_20402_wagtailcore_comment_user_id_0c577ca6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20402_wagtailcore_comment_user_id_0c577ca6 ON public.wagtailcore_comment USING btree (user_id);


--
-- Name: idx_20409_referenceindex_source_object; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20409_referenceindex_source_object ON public.wagtailcore_referenceindex USING btree (base_content_type_id, object_id);


--
-- Name: idx_20409_referenceindex_target_object; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20409_referenceindex_target_object ON public.wagtailcore_referenceindex USING btree (to_content_type_id, to_object_id);


--
-- Name: idx_20409_wagtailcore_referenceindex_base_content_type_id_313cf; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20409_wagtailcore_referenceindex_base_content_type_id_313cf ON public.wagtailcore_referenceindex USING btree (base_content_type_id);


--
-- Name: idx_20409_wagtailcore_referenceindex_base_content_type_id_objec; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20409_wagtailcore_referenceindex_base_content_type_id_objec ON public.wagtailcore_referenceindex USING btree (base_content_type_id, object_id, to_content_type_id, to_object_id, content_path_hash);


--
-- Name: idx_20409_wagtailcore_referenceindex_content_type_id_766e0336; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20409_wagtailcore_referenceindex_content_type_id_766e0336 ON public.wagtailcore_referenceindex USING btree (content_type_id);


--
-- Name: idx_20409_wagtailcore_referenceindex_to_content_type_id_93690bb; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20409_wagtailcore_referenceindex_to_content_type_id_93690bb ON public.wagtailcore_referenceindex USING btree (to_content_type_id);


--
-- Name: idx_20416_wagtailcore_taskstate_content_type_id_0a758fdc; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20416_wagtailcore_taskstate_content_type_id_0a758fdc ON public.wagtailcore_taskstate USING btree (content_type_id);


--
-- Name: idx_20416_wagtailcore_taskstate_finished_by_id_13f98229; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20416_wagtailcore_taskstate_finished_by_id_13f98229 ON public.wagtailcore_taskstate USING btree (finished_by_id);


--
-- Name: idx_20416_wagtailcore_taskstate_revision_id_df25a499; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20416_wagtailcore_taskstate_revision_id_df25a499 ON public.wagtailcore_taskstate USING btree (revision_id);


--
-- Name: idx_20416_wagtailcore_taskstate_task_id_c3677c34; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20416_wagtailcore_taskstate_task_id_c3677c34 ON public.wagtailcore_taskstate USING btree (task_id);


--
-- Name: idx_20416_wagtailcore_taskstate_workflow_state_id_9239a775; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20416_wagtailcore_taskstate_workflow_state_id_9239a775 ON public.wagtailcore_taskstate USING btree (workflow_state_id);


--
-- Name: idx_20423_sqlite_autoindex_wagtailcore_workflowstate_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20423_sqlite_autoindex_wagtailcore_workflowstate_1 ON public.wagtailcore_workflowstate USING btree (current_task_state_id);


--
-- Name: idx_20423_unique_in_progress_workflow; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20423_unique_in_progress_workflow ON public.wagtailcore_workflowstate USING btree (base_content_type_id, object_id);


--
-- Name: idx_20423_wagtailcore_workflowstate_base_content_type_id_a30dc5; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20423_wagtailcore_workflowstate_base_content_type_id_a30dc5 ON public.wagtailcore_workflowstate USING btree (base_content_type_id);


--
-- Name: idx_20423_wagtailcore_workflowstate_content_type_id_2bb78ce1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20423_wagtailcore_workflowstate_content_type_id_2bb78ce1 ON public.wagtailcore_workflowstate USING btree (content_type_id);


--
-- Name: idx_20423_wagtailcore_workflowstate_requested_by_id_4090bca3; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20423_wagtailcore_workflowstate_requested_by_id_4090bca3 ON public.wagtailcore_workflowstate USING btree (requested_by_id);


--
-- Name: idx_20423_wagtailcore_workflowstate_workflow_id_1f18378f; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20423_wagtailcore_workflowstate_workflow_id_1f18378f ON public.wagtailcore_workflowstate USING btree (workflow_id);


--
-- Name: idx_20423_workflowstate_base_ct_id_idx; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20423_workflowstate_base_ct_id_idx ON public.wagtailcore_workflowstate USING btree (base_content_type_id, object_id);


--
-- Name: idx_20423_workflowstate_ct_id_idx; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20423_workflowstate_ct_id_idx ON public.wagtailcore_workflowstate USING btree (content_type_id, object_id);


--
-- Name: idx_20429_wagtailcore_workflowcontenttype_workflow_id_9aad7cd2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20429_wagtailcore_workflowcontenttype_workflow_id_9aad7cd2 ON public.wagtailcore_workflowcontenttype USING btree (workflow_id);


--
-- Name: idx_20433_wagtailcore_modellogentry_action_d2d856ee; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_action_d2d856ee ON public.wagtailcore_modellogentry USING btree (action);


--
-- Name: idx_20433_wagtailcore_modellogentry_content_changed_8bc39742; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_content_changed_8bc39742 ON public.wagtailcore_modellogentry USING btree (content_changed);


--
-- Name: idx_20433_wagtailcore_modellogentry_content_type_id_68849e77; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_content_type_id_68849e77 ON public.wagtailcore_modellogentry USING btree (content_type_id);


--
-- Name: idx_20433_wagtailcore_modellogentry_object_id_e0e7d4ef; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_object_id_e0e7d4ef ON public.wagtailcore_modellogentry USING btree (object_id);


--
-- Name: idx_20433_wagtailcore_modellogentry_revision_id_df6ca33a; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_revision_id_df6ca33a ON public.wagtailcore_modellogentry USING btree (revision_id);


--
-- Name: idx_20433_wagtailcore_modellogentry_timestamp_9694521b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_timestamp_9694521b ON public.wagtailcore_modellogentry USING btree ("timestamp");


--
-- Name: idx_20433_wagtailcore_modellogentry_user_id_0278d1bf; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20433_wagtailcore_modellogentry_user_id_0278d1bf ON public.wagtailcore_modellogentry USING btree (user_id);


--
-- Name: idx_20440_wagtailcore_pagelogentry_action_c2408198; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_action_c2408198 ON public.wagtailcore_pagelogentry USING btree (action);


--
-- Name: idx_20440_wagtailcore_pagelogentry_content_changed_99f27ade; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_content_changed_99f27ade ON public.wagtailcore_pagelogentry USING btree (content_changed);


--
-- Name: idx_20440_wagtailcore_pagelogentry_content_type_id_74e7708a; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_content_type_id_74e7708a ON public.wagtailcore_pagelogentry USING btree (content_type_id);


--
-- Name: idx_20440_wagtailcore_pagelogentry_page_id_8464e327; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_page_id_8464e327 ON public.wagtailcore_pagelogentry USING btree (page_id);


--
-- Name: idx_20440_wagtailcore_pagelogentry_revision_id_8043d103; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_revision_id_8043d103 ON public.wagtailcore_pagelogentry USING btree (revision_id);


--
-- Name: idx_20440_wagtailcore_pagelogentry_timestamp_deb774c4; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_timestamp_deb774c4 ON public.wagtailcore_pagelogentry USING btree ("timestamp");


--
-- Name: idx_20440_wagtailcore_pagelogentry_user_id_604ccfd8; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20440_wagtailcore_pagelogentry_user_id_604ccfd8 ON public.wagtailcore_pagelogentry USING btree (user_id);


--
-- Name: idx_20447_sqlite_autoindex_wagtailcore_grouppagepermission_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20447_sqlite_autoindex_wagtailcore_grouppagepermission_1 ON public.wagtailcore_grouppagepermission USING btree (group_id, page_id, permission_id);


--
-- Name: idx_20447_wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20447_wagtailcore_grouppagepermission_group_id_fc07e671 ON public.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: idx_20447_wagtailcore_grouppagepermission_page_id_710b114a; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20447_wagtailcore_grouppagepermission_page_id_710b114a ON public.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: idx_20447_wagtailcore_grouppagepermission_permission_id_05acb22; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20447_wagtailcore_grouppagepermission_permission_id_05acb22 ON public.wagtailcore_grouppagepermission USING btree (permission_id);


--
-- Name: idx_20452_base_content_object_idx; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_base_content_object_idx ON public.wagtailcore_revision USING btree (base_content_type_id, object_id);


--
-- Name: idx_20452_content_object_idx; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_content_object_idx ON public.wagtailcore_revision USING btree (content_type_id, object_id);


--
-- Name: idx_20452_wagtailcore_revision_approved_go_live_at_88d3dee5; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_wagtailcore_revision_approved_go_live_at_88d3dee5 ON public.wagtailcore_revision USING btree (approved_go_live_at);


--
-- Name: idx_20452_wagtailcore_revision_base_content_type_id_5b4ef7bd; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_wagtailcore_revision_base_content_type_id_5b4ef7bd ON public.wagtailcore_revision USING btree (base_content_type_id);


--
-- Name: idx_20452_wagtailcore_revision_content_type_id_c8cb69c0; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_wagtailcore_revision_content_type_id_c8cb69c0 ON public.wagtailcore_revision USING btree (content_type_id);


--
-- Name: idx_20452_wagtailcore_revision_created_at_81450aa6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_wagtailcore_revision_created_at_81450aa6 ON public.wagtailcore_revision USING btree (created_at);


--
-- Name: idx_20452_wagtailcore_revision_user_id_03df83b0; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20452_wagtailcore_revision_user_id_03df83b0 ON public.wagtailcore_revision USING btree (user_id);


--
-- Name: idx_20459_wagtailcore_uploadedfile_for_content_type_id_b0fc87b2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20459_wagtailcore_uploadedfile_for_content_type_id_b0fc87b2 ON public.wagtailcore_uploadedfile USING btree (for_content_type_id);


--
-- Name: idx_20459_wagtailcore_uploadedfile_uploaded_by_user_id_c7580fe8; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20459_wagtailcore_uploadedfile_uploaded_by_user_id_c7580fe8 ON public.wagtailcore_uploadedfile USING btree (uploaded_by_user_id);


--
-- Name: idx_20466_wagtailcore_groupsitepermission_group_id_e5cdbee4; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20466_wagtailcore_groupsitepermission_group_id_e5cdbee4 ON public.wagtailcore_groupsitepermission USING btree (group_id);


--
-- Name: idx_20466_wagtailcore_groupsitepermission_group_id_site_id_perm; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20466_wagtailcore_groupsitepermission_group_id_site_id_perm ON public.wagtailcore_groupsitepermission USING btree (group_id, site_id, permission_id);


--
-- Name: idx_20466_wagtailcore_groupsitepermission_permission_id_459b1f3; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20466_wagtailcore_groupsitepermission_permission_id_459b1f3 ON public.wagtailcore_groupsitepermission USING btree (permission_id);


--
-- Name: idx_20466_wagtailcore_groupsitepermission_site_id_245de488; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20466_wagtailcore_groupsitepermission_site_id_245de488 ON public.wagtailcore_groupsitepermission USING btree (site_id);


--
-- Name: idx_20471_wagtaildocs_document_collection_id_23881625; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20471_wagtaildocs_document_collection_id_23881625 ON public.wagtaildocs_document USING btree (collection_id);


--
-- Name: idx_20471_wagtaildocs_document_uploaded_by_user_id_17258b41; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20471_wagtaildocs_document_uploaded_by_user_id_17258b41 ON public.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: idx_20478_sqlite_autoindex_wagtailembeds_embed_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20478_sqlite_autoindex_wagtailembeds_embed_1 ON public.wagtailembeds_embed USING btree (hash);


--
-- Name: idx_20478_wagtailembeds_embed_cache_until_26c94bb0; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20478_wagtailembeds_embed_cache_until_26c94bb0 ON public.wagtailembeds_embed USING btree (cache_until);


--
-- Name: idx_20485_wagtailforms_formsubmission_page_id_e48e93e7; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20485_wagtailforms_formsubmission_page_id_e48e93e7 ON public.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: idx_20492_wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20492_wagtailimages_rendition_filter_spec_1cba3201 ON public.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: idx_20492_wagtailimages_rendition_image_id_3e1fd774; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20492_wagtailimages_rendition_image_id_3e1fd774 ON public.wagtailimages_rendition USING btree (image_id);


--
-- Name: idx_20492_wagtailimages_rendition_image_id_filter_spec_focal_po; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20492_wagtailimages_rendition_image_id_filter_spec_focal_po ON public.wagtailimages_rendition USING btree (image_id, filter_spec, focal_point_key);


--
-- Name: idx_20499_wagtailimages_image_collection_id_c2f8af7e; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20499_wagtailimages_image_collection_id_c2f8af7e ON public.wagtailimages_image USING btree (collection_id);


--
-- Name: idx_20499_wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20499_wagtailimages_image_created_at_86fa6cd4 ON public.wagtailimages_image USING btree (created_at);


--
-- Name: idx_20499_wagtailimages_image_file_hash_fb5bbb23; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20499_wagtailimages_image_file_hash_fb5bbb23 ON public.wagtailimages_image USING btree (file_hash);


--
-- Name: idx_20499_wagtailimages_image_uploaded_by_user_id_5d73dc75; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20499_wagtailimages_image_uploaded_by_user_id_5d73dc75 ON public.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: idx_20506_wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20506_wagtailredirects_redirect_old_path_bb35247b ON public.wagtailredirects_redirect USING btree (old_path);


--
-- Name: idx_20506_wagtailredirects_redirect_old_path_site_id_783622d7_u; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20506_wagtailredirects_redirect_old_path_site_id_783622d7_u ON public.wagtailredirects_redirect USING btree (old_path, site_id);


--
-- Name: idx_20506_wagtailredirects_redirect_redirect_page_id_b5728a8f; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20506_wagtailredirects_redirect_redirect_page_id_b5728a8f ON public.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: idx_20506_wagtailredirects_redirect_site_id_780a0e1e; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20506_wagtailredirects_redirect_site_id_780a0e1e ON public.wagtailredirects_redirect USING btree (site_id);


--
-- Name: idx_20513_wagtailsearch_indexentry_content_type_id_62ed694f; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20513_wagtailsearch_indexentry_content_type_id_62ed694f ON public.wagtailsearch_indexentry USING btree (content_type_id);


--
-- Name: idx_20513_wagtailsearch_indexentry_content_type_id_object_id_bc; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20513_wagtailsearch_indexentry_content_type_id_object_id_bc ON public.wagtailsearch_indexentry USING btree (content_type_id, object_id);


--
-- Name: idx_20550_sqlite_autoindex_wagtailusers_userprofile_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20550_sqlite_autoindex_wagtailusers_userprofile_1 ON public.wagtailusers_userprofile USING btree (user_id);


--
-- Name: idx_20569_sqlite_autoindex_home_menu_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20569_sqlite_autoindex_home_menu_1 ON public.home_menu USING btree (name);


--
-- Name: idx_20576_home_menuitem_link_page_id_8bfa7ae8; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20576_home_menuitem_link_page_id_8bfa7ae8 ON public.home_menuitem USING btree (link_page_id);


--
-- Name: idx_20576_home_menuitem_menu_id_d7aa192c; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20576_home_menuitem_menu_id_d7aa192c ON public.home_menuitem USING btree (menu_id);


--
-- Name: idx_20583_home_submenuitem_link_page_id_001a9a51; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20583_home_submenuitem_link_page_id_001a9a51 ON public.home_submenuitem USING btree (link_page_id);


--
-- Name: idx_20583_home_submenuitem_parent_id_ea2bb463; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20583_home_submenuitem_parent_id_ea2bb463 ON public.home_submenuitem USING btree (parent_id);


--
-- Name: idx_20590_sqlite_autoindex_home_footersettings_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20590_sqlite_autoindex_home_footersettings_1 ON public.home_footersettings USING btree (site_id);


--
-- Name: idx_20602_sqlite_autoindex_membres_orgsection_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20602_sqlite_autoindex_membres_orgsection_1 ON public.membres_orgsection USING btree (title);


--
-- Name: idx_20609_membres_member_photo_id_07f39325; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20609_membres_member_photo_id_07f39325 ON public.membres_member USING btree (photo_id);


--
-- Name: idx_20616_membres_orgchartsection_page_id_9a7079dc; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20616_membres_orgchartsection_page_id_9a7079dc ON public.membres_orgchartsection USING btree (page_id);


--
-- Name: idx_20616_membres_orgchartsection_section_id_d8122237; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20616_membres_orgchartsection_section_id_d8122237 ON public.membres_orgchartsection USING btree (section_id);


--
-- Name: idx_20621_membres_orgchartsectionmember_member_id_37273928; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20621_membres_orgchartsectionmember_member_id_37273928 ON public.membres_orgchartsectionmember USING btree (member_id);


--
-- Name: idx_20621_membres_orgchartsectionmember_parent_id_6385ccdd; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20621_membres_orgchartsectionmember_parent_id_6385ccdd ON public.membres_orgchartsectionmember USING btree (parent_id);


--
-- Name: idx_20625_home_standardpage_hero_image_id_f894e1e5; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20625_home_standardpage_hero_image_id_f894e1e5 ON public.home_standardpage USING btree (hero_image_id);


--
-- Name: idx_20636_sqlite_autoindex_bibliotheque_documentcategory_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20636_sqlite_autoindex_bibliotheque_documentcategory_1 ON public.bibliotheque_documentcategory USING btree (title);


--
-- Name: idx_20643_bibliotheque_bibliothequeitem_category_id_3a8e304b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20643_bibliotheque_bibliothequeitem_category_id_3a8e304b ON public.bibliotheque_bibliothequeitem USING btree (category_id);


--
-- Name: idx_20643_bibliotheque_bibliothequeitem_document_id_3c3fbbf4; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20643_bibliotheque_bibliothequeitem_document_id_3c3fbbf4 ON public.bibliotheque_bibliothequeitem USING btree (document_id);


--
-- Name: idx_20643_bibliotheque_bibliothequeitem_page_id_434fcf13; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20643_bibliotheque_bibliothequeitem_page_id_434fcf13 ON public.bibliotheque_bibliothequeitem USING btree (page_id);


--
-- Name: idx_20650_account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20650_account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: idx_20650_sqlite_autoindex_account_emailconfirmation_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20650_sqlite_autoindex_account_emailconfirmation_1 ON public.account_emailconfirmation USING btree (key);


--
-- Name: idx_20657_account_emailaddress_email_03be32b2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20657_account_emailaddress_email_03be32b2 ON public.account_emailaddress USING btree (email);


--
-- Name: idx_20657_account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20657_account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: idx_20657_account_emailaddress_user_id_email_987c8728_uniq; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20657_account_emailaddress_user_id_email_987c8728_uniq ON public.account_emailaddress USING btree (user_id, email);


--
-- Name: idx_20657_unique_primary_email; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20657_unique_primary_email ON public.account_emailaddress USING btree (user_id, "primary");


--
-- Name: idx_20657_unique_verified_email; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20657_unique_verified_email ON public.account_emailaddress USING btree (email);


--
-- Name: idx_20664_sqlite_autoindex_django_site_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20664_sqlite_autoindex_django_site_1 ON public.django_site USING btree (domain);


--
-- Name: idx_20671_socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20671_socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: idx_20671_socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20671_socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: idx_20671_socialaccount_socialapp_sites_socialapp_id_site_id_71; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20671_socialaccount_socialapp_sites_socialapp_id_site_id_71 ON public.socialaccount_socialapp_sites USING btree (socialapp_id, site_id);


--
-- Name: idx_20683_socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20683_socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: idx_20683_socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20683_socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: idx_20683_socialaccount_socialtoken_app_id_account_id_fca4e0ac_; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20683_socialaccount_socialtoken_app_id_account_id_fca4e0ac_ ON public.socialaccount_socialtoken USING btree (app_id, account_id);


--
-- Name: idx_20690_socialaccount_socialaccount_provider_uid_fc810c6e_uni; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20690_socialaccount_socialaccount_provider_uid_fc810c6e_uni ON public.socialaccount_socialaccount USING btree (provider, uid);


--
-- Name: idx_20690_socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20690_socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: idx_20697_sqlite_autoindex_blog_blogcategory_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20697_sqlite_autoindex_blog_blogcategory_1 ON public.blog_blogcategory USING btree (name);


--
-- Name: idx_20697_sqlite_autoindex_blog_blogcategory_2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20697_sqlite_autoindex_blog_blogcategory_2 ON public.blog_blogcategory USING btree (slug);


--
-- Name: idx_20703_blog_blogpage_image_id_a60e2e91; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20703_blog_blogpage_image_id_a60e2e91 ON public.blog_blogpage USING btree (image_id);


--
-- Name: idx_20709_blog_blogpage_categories_blogcategory_id_508df820; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20709_blog_blogpage_categories_blogcategory_id_508df820 ON public.blog_blogpage_categories USING btree (blogcategory_id);


--
-- Name: idx_20709_blog_blogpage_categories_blogpage_id_b21020fe; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20709_blog_blogpage_categories_blogpage_id_b21020fe ON public.blog_blogpage_categories USING btree (blogpage_id);


--
-- Name: idx_20709_blog_blogpage_categories_blogpage_id_blogcategory_id_; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20709_blog_blogpage_categories_blogpage_id_blogcategory_id_ ON public.blog_blogpage_categories USING btree (blogpage_id, blogcategory_id);


--
-- Name: idx_20714_blog_blogpagetag_content_object_id_0dc644d2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20714_blog_blogpagetag_content_object_id_0dc644d2 ON public.blog_blogpagetag USING btree (content_object_id);


--
-- Name: idx_20714_blog_blogpagetag_tag_id_81dc0e5f; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20714_blog_blogpagetag_tag_id_81dc0e5f ON public.blog_blogpagetag USING btree (tag_id);


--
-- Name: idx_20718_home_homepage_perspectives_page_id_8b9d79d9; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20718_home_homepage_perspectives_page_id_8b9d79d9 ON public.home_homepage USING btree (perspectives_page_id);


--
-- Name: idx_20718_home_homepage_spotlight_page_id_ea246cc3; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20718_home_homepage_spotlight_page_id_ea246cc3 ON public.home_homepage USING btree (spotlight_page_id);


--
-- Name: idx_20724_home_homeheroslide_cta_page_id_92a55e33; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20724_home_homeheroslide_cta_page_id_92a55e33 ON public.home_homeheroslide USING btree (cta_page_id);


--
-- Name: idx_20724_home_homeheroslide_image_id_ee6b6ba9; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20724_home_homeheroslide_image_id_ee6b6ba9 ON public.home_homeheroslide USING btree (image_id);


--
-- Name: idx_20724_home_homeheroslide_page_id_e0040350; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20724_home_homeheroslide_page_id_e0040350 ON public.home_homeheroslide USING btree (page_id);


--
-- Name: idx_20731_home_homequicklink_image_id_11a1eccb; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20731_home_homequicklink_image_id_11a1eccb ON public.home_homequicklink USING btree (image_id);


--
-- Name: idx_20731_home_homequicklink_link_page_id_a94de691; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20731_home_homequicklink_link_page_id_a94de691 ON public.home_homequicklink USING btree (link_page_id);


--
-- Name: idx_20731_home_homequicklink_page_id_afdee90c; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20731_home_homequicklink_page_id_afdee90c ON public.home_homequicklink USING btree (page_id);


--
-- Name: idx_20738_sqlite_autoindex_membres_annualfee_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20738_sqlite_autoindex_membres_annualfee_1 ON public.membres_annualfee USING btree (year);


--
-- Name: idx_20745_sqlite_autoindex_membres_memberprofile_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20745_sqlite_autoindex_membres_memberprofile_1 ON public.membres_memberprofile USING btree (member_no);


--
-- Name: idx_20745_sqlite_autoindex_membres_memberprofile_2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20745_sqlite_autoindex_membres_memberprofile_2 ON public.membres_memberprofile USING btree (user_id);


--
-- Name: idx_20752_membres_memberannualdues_fee_id_bfd4df35; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20752_membres_memberannualdues_fee_id_bfd4df35 ON public.membres_memberannualdues USING btree (fee_id);


--
-- Name: idx_20752_membres_memberannualdues_member_id_fe2ade4b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20752_membres_memberannualdues_member_id_fe2ade4b ON public.membres_memberannualdues USING btree (member_id);


--
-- Name: idx_20752_membres_memberannualdues_member_id_fee_id_a8bea819_un; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20752_membres_memberannualdues_member_id_fee_id_a8bea819_un ON public.membres_memberannualdues USING btree (member_id, fee_id);


--
-- Name: idx_20758_membres_payment_dues_id_17fe1080; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20758_membres_payment_dues_id_17fe1080 ON public.membres_payment USING btree (dues_id);


--
-- Name: idx_20764_sqlite_autoindex_members_annualfee_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20764_sqlite_autoindex_members_annualfee_1 ON public.members_annualfee USING btree (year);


--
-- Name: idx_20776_sqlite_autoindex_members_orgsection_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20776_sqlite_autoindex_members_orgsection_1 ON public.members_orgsection USING btree (title);


--
-- Name: idx_20783_members_member_photo_id_641fe5ab; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20783_members_member_photo_id_641fe5ab ON public.members_member USING btree (photo_id);


--
-- Name: idx_20790_sqlite_autoindex_members_memberprofile_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20790_sqlite_autoindex_members_memberprofile_1 ON public.members_memberprofile USING btree (member_no);


--
-- Name: idx_20790_sqlite_autoindex_members_memberprofile_2; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20790_sqlite_autoindex_members_memberprofile_2 ON public.members_memberprofile USING btree (user_id);


--
-- Name: idx_20797_members_memberannualdues_fee_id_358cb574; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20797_members_memberannualdues_fee_id_358cb574 ON public.members_memberannualdues USING btree (fee_id);


--
-- Name: idx_20797_members_memberannualdues_member_id_2b4585d4; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20797_members_memberannualdues_member_id_2b4585d4 ON public.members_memberannualdues USING btree (member_id);


--
-- Name: idx_20797_members_memberannualdues_member_id_fee_id_26883dda_un; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20797_members_memberannualdues_member_id_fee_id_26883dda_un ON public.members_memberannualdues USING btree (member_id, fee_id);


--
-- Name: idx_20804_members_orgchartsection_page_id_969eea09; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20804_members_orgchartsection_page_id_969eea09 ON public.members_orgchartsection USING btree (page_id);


--
-- Name: idx_20804_members_orgchartsection_section_id_daa969b6; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20804_members_orgchartsection_section_id_daa969b6 ON public.members_orgchartsection USING btree (section_id);


--
-- Name: idx_20809_members_orgchartsectionmember_member_id_6ac5bb55; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20809_members_orgchartsectionmember_member_id_6ac5bb55 ON public.members_orgchartsectionmember USING btree (member_id);


--
-- Name: idx_20809_members_orgchartsectionmember_parent_id_2b218735; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20809_members_orgchartsectionmember_parent_id_2b218735 ON public.members_orgchartsectionmember USING btree (parent_id);


--
-- Name: idx_20813_members_payment_dues_id_9886331b; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20813_members_payment_dues_id_9886331b ON public.members_payment USING btree (dues_id);


--
-- Name: idx_20819_sqlite_autoindex_members_usermenufragment_1; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE UNIQUE INDEX idx_20819_sqlite_autoindex_members_usermenufragment_1 ON public.members_usermenufragment USING btree (name);


--
-- Name: idx_20826_members_usermenufragmentitem_fragment_id_5a584301; Type: INDEX; Schema: public; Owner: wagtail
--

CREATE INDEX idx_20826_members_usermenufragmentitem_fragment_id_5a584301 ON public.members_usermenufragmentitem USING btree (fragment_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_fkey FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id);


--
-- Name: adhesions_applicationdocument adhesions_applicatio_application_id_0ed9a9df_fk_adhesions; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationdocument
    ADD CONSTRAINT adhesions_applicatio_application_id_0ed9a9df_fk_adhesions FOREIGN KEY (application_id) REFERENCES public.adhesions_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adhesions_applicationstatushistory adhesions_applicatio_application_id_3eddbad6_fk_adhesions; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationstatushistory
    ADD CONSTRAINT adhesions_applicatio_application_id_3eddbad6_fk_adhesions FOREIGN KEY (application_id) REFERENCES public.adhesions_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adhesions_applicationcomment adhesions_applicatio_application_id_9c931b81_fk_adhesions; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_applicationcomment
    ADD CONSTRAINT adhesions_applicatio_application_id_9c931b81_fk_adhesions FOREIGN KEY (application_id) REFERENCES public.adhesions_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adhesions_application adhesions_applicatio_candidate_id_db480466_fk_adhesions; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.adhesions_application
    ADD CONSTRAINT adhesions_applicatio_candidate_id_db480466_fk_adhesions FOREIGN KEY (candidate_id) REFERENCES public.adhesions_candidateprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: auth_group_permissions auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: auth_permission auth_permission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: auth_user_groups auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: auth_user_groups auth_user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: bibliotheque_bibliothequeitem bibliotheque_bibliothequeitem_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequeitem
    ADD CONSTRAINT bibliotheque_bibliothequeitem_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.bibliotheque_documentcategory(id);


--
-- Name: bibliotheque_bibliothequeitem bibliotheque_bibliothequeitem_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequeitem
    ADD CONSTRAINT bibliotheque_bibliothequeitem_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.wagtaildocs_document(id);


--
-- Name: bibliotheque_bibliothequeitem bibliotheque_bibliothequeitem_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequeitem
    ADD CONSTRAINT bibliotheque_bibliothequeitem_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.bibliotheque_bibliothequepage(page_ptr_id);


--
-- Name: bibliotheque_bibliothequepage bibliotheque_bibliothequepage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.bibliotheque_bibliothequepage
    ADD CONSTRAINT bibliotheque_bibliothequepage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: blog_blogindexpage blog_blogindexpage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: blog_blogpage_categories blog_blogpage_categories_blogcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage_categories
    ADD CONSTRAINT blog_blogpage_categories_blogcategory_id_fkey FOREIGN KEY (blogcategory_id) REFERENCES public.blog_blogcategory(id);


--
-- Name: blog_blogpage_categories blog_blogpage_categories_blogpage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage_categories
    ADD CONSTRAINT blog_blogpage_categories_blogpage_id_fkey FOREIGN KEY (blogpage_id) REFERENCES public.blog_blogpage(page_ptr_id);


--
-- Name: blog_blogpage blog_blogpage_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage
    ADD CONSTRAINT blog_blogpage_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: blog_blogpage blog_blogpage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpage
    ADD CONSTRAINT blog_blogpage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: blog_blogpagetag blog_blogpagetag_content_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_content_object_id_fkey FOREIGN KEY (content_object_id) REFERENCES public.blog_blogpage(page_ptr_id);


--
-- Name: blog_blogpagetag blog_blogpagetag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: django_admin_log django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: home_footersettings home_footersettings_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_footersettings
    ADD CONSTRAINT home_footersettings_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id);


--
-- Name: home_homeheroslide home_homeheroslide_cta_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homeheroslide
    ADD CONSTRAINT home_homeheroslide_cta_page_id_fkey FOREIGN KEY (cta_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_homeheroslide home_homeheroslide_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homeheroslide
    ADD CONSTRAINT home_homeheroslide_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: home_homeheroslide home_homeheroslide_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homeheroslide
    ADD CONSTRAINT home_homeheroslide_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id);


--
-- Name: home_homepage home_homepage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_homepage home_homepage_perspectives_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_perspectives_page_id_fkey FOREIGN KEY (perspectives_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_homepage home_homepage_spotlight_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_spotlight_page_id_fkey FOREIGN KEY (spotlight_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_homequicklink home_homequicklink_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homequicklink
    ADD CONSTRAINT home_homequicklink_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: home_homequicklink home_homequicklink_link_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homequicklink
    ADD CONSTRAINT home_homequicklink_link_page_id_fkey FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_homequicklink home_homequicklink_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_homequicklink
    ADD CONSTRAINT home_homequicklink_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id);


--
-- Name: home_menuitem home_menuitem_link_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_menuitem
    ADD CONSTRAINT home_menuitem_link_page_id_fkey FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_menuitem home_menuitem_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_menuitem
    ADD CONSTRAINT home_menuitem_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.home_menu(id);


--
-- Name: home_standardpage home_standardpage_hero_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_standardpage
    ADD CONSTRAINT home_standardpage_hero_image_id_fkey FOREIGN KEY (hero_image_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: home_standardpage home_standardpage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_standardpage
    ADD CONSTRAINT home_standardpage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_submenuitem home_submenuitem_link_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_submenuitem
    ADD CONSTRAINT home_submenuitem_link_page_id_fkey FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: home_submenuitem home_submenuitem_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.home_submenuitem
    ADD CONSTRAINT home_submenuitem_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.home_menuitem(id);


--
-- Name: members_member members_member_photo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_member
    ADD CONSTRAINT members_member_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: members_memberannualdues members_memberannualdues_fee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberannualdues
    ADD CONSTRAINT members_memberannualdues_fee_id_fkey FOREIGN KEY (fee_id) REFERENCES public.members_annualfee(id);


--
-- Name: members_memberannualdues members_memberannualdues_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberannualdues
    ADD CONSTRAINT members_memberannualdues_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members_memberprofile(id);


--
-- Name: members_memberprofile members_memberprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_memberprofile
    ADD CONSTRAINT members_memberprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: members_orgchartpage members_orgchartpage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartpage
    ADD CONSTRAINT members_orgchartpage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: members_orgchartsection members_orgchartsection_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsection
    ADD CONSTRAINT members_orgchartsection_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.members_orgchartpage(page_ptr_id);


--
-- Name: members_orgchartsection members_orgchartsection_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsection
    ADD CONSTRAINT members_orgchartsection_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.members_orgsection(id);


--
-- Name: members_orgchartsectionmember members_orgchartsectionmember_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsectionmember
    ADD CONSTRAINT members_orgchartsectionmember_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members_member(id);


--
-- Name: members_orgchartsectionmember members_orgchartsectionmember_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_orgchartsectionmember
    ADD CONSTRAINT members_orgchartsectionmember_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.members_orgchartsection(id);


--
-- Name: members_payment members_payment_dues_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_payment
    ADD CONSTRAINT members_payment_dues_id_fkey FOREIGN KEY (dues_id) REFERENCES public.members_memberannualdues(id);


--
-- Name: members_usermenufragmentitem members_usermenufragmentitem_fragment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.members_usermenufragmentitem
    ADD CONSTRAINT members_usermenufragmentitem_fragment_id_fkey FOREIGN KEY (fragment_id) REFERENCES public.members_usermenufragment(id);


--
-- Name: membres_member membres_member_photo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_member
    ADD CONSTRAINT membres_member_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: membres_memberannualdues membres_memberannualdues_fee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberannualdues
    ADD CONSTRAINT membres_memberannualdues_fee_id_fkey FOREIGN KEY (fee_id) REFERENCES public.membres_annualfee(id);


--
-- Name: membres_memberannualdues membres_memberannualdues_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberannualdues
    ADD CONSTRAINT membres_memberannualdues_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.membres_memberprofile(id);


--
-- Name: membres_memberprofile membres_memberprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_memberprofile
    ADD CONSTRAINT membres_memberprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: membres_orgchartpage membres_orgchartpage_page_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartpage
    ADD CONSTRAINT membres_orgchartpage_page_ptr_id_fkey FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: membres_orgchartsection membres_orgchartsection_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsection
    ADD CONSTRAINT membres_orgchartsection_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.membres_orgchartpage(page_ptr_id);


--
-- Name: membres_orgchartsection membres_orgchartsection_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsection
    ADD CONSTRAINT membres_orgchartsection_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.membres_orgsection(id);


--
-- Name: membres_orgchartsectionmember membres_orgchartsectionmember_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsectionmember
    ADD CONSTRAINT membres_orgchartsectionmember_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.membres_member(id);


--
-- Name: membres_orgchartsectionmember membres_orgchartsectionmember_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_orgchartsectionmember
    ADD CONSTRAINT membres_orgchartsectionmember_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.membres_orgchartsection(id);


--
-- Name: membres_payment membres_payment_dues_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.membres_payment
    ADD CONSTRAINT membres_payment_dues_id_fkey FOREIGN KEY (dues_id) REFERENCES public.membres_memberannualdues(id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.django_site(id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_socialapp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_fkey FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fkey FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id);


--
-- Name: wagtailadmin_editingsession wagtailadmin_editingsession_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailadmin_editingsession
    ADD CONSTRAINT wagtailadmin_editingsession_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailadmin_editingsession wagtailadmin_editingsession_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailadmin_editingsession
    ADD CONSTRAINT wagtailadmin_editingsession_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewres_collectionviewrestriction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewres_collectionviewrestriction_id_fkey FOREIGN KEY (collectionviewrestriction_id) REFERENCES public.wagtailcore_collectionviewrestriction(id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collectionviewrestriction_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewrestriction_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_resolved_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_resolved_by_id_fkey FOREIGN KEY (resolved_by_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_revision_created_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_revision_created_id_fkey FOREIGN KEY (revision_created_id) REFERENCES public.wagtailcore_revision(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_commentreply wagtailcore_commentreply_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_commentreply
    ADD CONSTRAINT wagtailcore_commentreply_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.wagtailcore_comment(id);


--
-- Name: wagtailcore_commentreply wagtailcore_commentreply_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_commentreply
    ADD CONSTRAINT wagtailcore_commentreply_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_groupapprovaltask_groups wagtailcore_groupapprovaltask_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupapprovaltask_groups
    ADD CONSTRAINT wagtailcore_groupapprovaltask_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: wagtailcore_groupapprovaltask_groups wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupapprovaltask_groups
    ADD CONSTRAINT wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_fkey FOREIGN KEY (groupapprovaltask_id) REFERENCES public.wagtailcore_groupapprovaltask(task_ptr_id);


--
-- Name: wagtailcore_groupapprovaltask wagtailcore_groupapprovaltask_task_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupapprovaltask
    ADD CONSTRAINT wagtailcore_groupapprovaltask_task_ptr_id_fkey FOREIGN KEY (task_ptr_id) REFERENCES public.wagtailcore_task(id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: wagtailcore_groupsitepermission wagtailcore_groupsitepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupsitepermission
    ADD CONSTRAINT wagtailcore_groupsitepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: wagtailcore_groupsitepermission wagtailcore_groupsitepermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupsitepermission
    ADD CONSTRAINT wagtailcore_groupsitepermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: wagtailcore_groupsitepermission wagtailcore_groupsitepermission_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_groupsitepermission
    ADD CONSTRAINT wagtailcore_groupsitepermission_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id);


--
-- Name: wagtailcore_modellogentry wagtailcore_modellogentry_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_modellogentry
    ADD CONSTRAINT wagtailcore_modellogentry_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_page wagtailcore_page_alias_of_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_alias_of_id_fkey FOREIGN KEY (alias_of_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_page wagtailcore_page_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_page wagtailcore_page_latest_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_latest_revision_id_fkey FOREIGN KEY (latest_revision_id) REFERENCES public.wagtailcore_revision(id);


--
-- Name: wagtailcore_page wagtailcore_page_live_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_fkey FOREIGN KEY (live_revision_id) REFERENCES public.wagtailcore_revision(id);


--
-- Name: wagtailcore_page wagtailcore_page_locale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_locale_id_fkey FOREIGN KEY (locale_id) REFERENCES public.wagtailcore_locale(id);


--
-- Name: wagtailcore_page wagtailcore_page_locked_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_locked_by_id_fkey FOREIGN KEY (locked_by_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_pagelogentry wagtailcore_pagelogentry_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagelogentry
    ADD CONSTRAINT wagtailcore_pagelogentry_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_pagesubscription wagtailcore_pagesubscription_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagesubscription
    ADD CONSTRAINT wagtailcore_pagesubscription_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_pagesubscription wagtailcore_pagesubscription_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pagesubscription
    ADD CONSTRAINT wagtailcore_pagesubscription_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_gro_pageviewrestriction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_gro_pageviewrestriction_id_fkey FOREIGN KEY (pageviewrestriction_id) REFERENCES public.wagtailcore_pageviewrestriction(id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewrestriction_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_referenceindex wagtailcore_referenceindex_base_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_referenceindex
    ADD CONSTRAINT wagtailcore_referenceindex_base_content_type_id_fkey FOREIGN KEY (base_content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_referenceindex wagtailcore_referenceindex_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_referenceindex
    ADD CONSTRAINT wagtailcore_referenceindex_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_referenceindex wagtailcore_referenceindex_to_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_referenceindex
    ADD CONSTRAINT wagtailcore_referenceindex_to_content_type_id_fkey FOREIGN KEY (to_content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_revision wagtailcore_revision_base_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_revision
    ADD CONSTRAINT wagtailcore_revision_base_content_type_id_fkey FOREIGN KEY (base_content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_revision wagtailcore_revision_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_revision
    ADD CONSTRAINT wagtailcore_revision_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_revision wagtailcore_revision_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_revision
    ADD CONSTRAINT wagtailcore_revision_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_fkey FOREIGN KEY (root_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_task wagtailcore_task_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_task
    ADD CONSTRAINT wagtailcore_task_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_finished_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_finished_by_id_fkey FOREIGN KEY (finished_by_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.wagtailcore_revision(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wagtailcore_task(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_workflow_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_workflow_state_id_fkey FOREIGN KEY (workflow_state_id) REFERENCES public.wagtailcore_workflowstate(id);


--
-- Name: wagtailcore_uploadedfile wagtailcore_uploadedfile_for_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_uploadedfile
    ADD CONSTRAINT wagtailcore_uploadedfile_for_content_type_id_fkey FOREIGN KEY (for_content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_uploadedfile wagtailcore_uploadedfile_uploaded_by_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_uploadedfile
    ADD CONSTRAINT wagtailcore_uploadedfile_uploaded_by_user_id_fkey FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_workflowcontenttype wagtailcore_workflowcontenttype_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowcontenttype
    ADD CONSTRAINT wagtailcore_workflowcontenttype_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_workflowcontenttype wagtailcore_workflowcontenttype_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowcontenttype
    ADD CONSTRAINT wagtailcore_workflowcontenttype_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES public.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowpage wagtailcore_workflowpage_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowpage
    ADD CONSTRAINT wagtailcore_workflowpage_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailcore_workflowpage wagtailcore_workflowpage_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowpage
    ADD CONSTRAINT wagtailcore_workflowpage_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES public.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflowstate_base_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflowstate_base_content_type_id_fkey FOREIGN KEY (base_content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflowstate_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflowstate_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflowstate_current_task_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflowstate_current_task_state_id_fkey FOREIGN KEY (current_task_state_id) REFERENCES public.wagtailcore_taskstate(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflowstate_requested_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflowstate_requested_by_id_fkey FOREIGN KEY (requested_by_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflowstate_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflowstate_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES public.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowtask wagtailcore_workflowtask_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowtask
    ADD CONSTRAINT wagtailcore_workflowtask_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wagtailcore_task(id);


--
-- Name: wagtailcore_workflowtask wagtailcore_workflowtask_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailcore_workflowtask
    ADD CONSTRAINT wagtailcore_workflowtask_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES public.wagtailcore_workflow(id);


--
-- Name: wagtaildocs_document wagtaildocs_document_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id);


--
-- Name: wagtaildocs_document wagtaildocs_document_uploaded_by_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_fkey FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmission_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailimages_image wagtailimages_image_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id);


--
-- Name: wagtailimages_image wagtailimages_image_uploaded_by_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_fkey FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_redirect_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_redirect_page_id_fkey FOREIGN KEY (redirect_page_id) REFERENCES public.wagtailcore_page(id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id);


--
-- Name: wagtailsearch_indexentry wagtailsearch_indexentry_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailsearch_indexentry
    ADD CONSTRAINT wagtailsearch_indexentry_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wagtail
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: wagtail
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict n0rtzcbQcENr9FUAuS1Xn7Qc7tX5GwLWUuEKjhBSACEbQ5xg2aVm2zrMYt2fyF0

--
-- PostgreSQL database cluster dump complete
--

