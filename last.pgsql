--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO soyuzbek;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO soyuzbek;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO soyuzbek;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO soyuzbek;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO soyuzbek;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO soyuzbek;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO soyuzbek;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO soyuzbek;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO soyuzbek;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO soyuzbek;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO soyuzbek;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO soyuzbek;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO soyuzbek;

--
-- Name: meta_tags; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.meta_tags (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    object_id integer,
    title character varying(80) NOT NULL,
    keywords character varying(250) NOT NULL,
    description text NOT NULL,
    content_type_id integer,
    CONSTRAINT meta_tags_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.meta_tags OWNER TO soyuzbek;

--
-- Name: meta_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.meta_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meta_tags_id_seq OWNER TO soyuzbek;

--
-- Name: meta_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.meta_tags_id_seq OWNED BY public.meta_tags.id;


--
-- Name: products_brand; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_brand (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    image character varying(100) NOT NULL,
    about text NOT NULL
);


ALTER TABLE public.products_brand OWNER TO soyuzbek;

--
-- Name: products_brand_category_set; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_brand_category_set (
    id integer NOT NULL,
    brand_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.products_brand_category_set OWNER TO soyuzbek;

--
-- Name: products_brand_category_set_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_brand_category_set_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_brand_category_set_id_seq OWNER TO soyuzbek;

--
-- Name: products_brand_category_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_brand_category_set_id_seq OWNED BY public.products_brand_category_set.id;


--
-- Name: products_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_brand_id_seq OWNER TO soyuzbek;

--
-- Name: products_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_brand_id_seq OWNED BY public.products_brand.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(100),
    slug character varying(50)
);


ALTER TABLE public.products_category OWNER TO soyuzbek;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO soyuzbek;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_color; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_color (
    id integer NOT NULL,
    name character varying(6) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.products_color OWNER TO soyuzbek;

--
-- Name: products_color_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_color_id_seq OWNER TO soyuzbek;

--
-- Name: products_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_color_id_seq OWNED BY public.products_color.id;


--
-- Name: products_favourite; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_favourite (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.products_favourite OWNER TO soyuzbek;

--
-- Name: products_favourite_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_favourite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_favourite_id_seq OWNER TO soyuzbek;

--
-- Name: products_favourite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_favourite_id_seq OWNED BY public.products_favourite.id;


--
-- Name: products_favourite_products; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_favourite_products (
    id integer NOT NULL,
    favourite_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.products_favourite_products OWNER TO soyuzbek;

--
-- Name: products_favourite_products_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_favourite_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_favourite_products_id_seq OWNER TO soyuzbek;

--
-- Name: products_favourite_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_favourite_products_id_seq OWNED BY public.products_favourite_products.id;


--
-- Name: products_image; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_image (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.products_image OWNER TO soyuzbek;

--
-- Name: products_image_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_image_id_seq OWNER TO soyuzbek;

--
-- Name: products_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_image_id_seq OWNED BY public.products_image.id;


--
-- Name: products_order; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_order (
    id integer NOT NULL,
    first_name character varying(254),
    last_name character varying(254),
    email character varying(254) NOT NULL,
    address character varying(254),
    phone character varying(23),
    zip_code character varying(10),
    subtotal character varying(30) NOT NULL,
    total character varying(30) NOT NULL,
    delivery character varying(30) NOT NULL,
    comment text,
    date timestamp with time zone
);


ALTER TABLE public.products_order OWNER TO soyuzbek;

--
-- Name: products_order_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_order_id_seq OWNER TO soyuzbek;

--
-- Name: products_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_order_id_seq OWNED BY public.products_order.id;


--
-- Name: products_orderproduct; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_orderproduct (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2),
    quantity smallint NOT NULL,
    photo character varying(100) NOT NULL,
    order_id integer NOT NULL,
    prodid character varying(254),
    CONSTRAINT products_orderproduct_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.products_orderproduct OWNER TO soyuzbek;

--
-- Name: products_orderproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_orderproduct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_orderproduct_id_seq OWNER TO soyuzbek;

--
-- Name: products_orderproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_orderproduct_id_seq OWNED BY public.products_orderproduct.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2),
    discount smallint NOT NULL,
    rating numeric(4,2) NOT NULL,
    status character varying(30) NOT NULL,
    brand_id integer,
    category_id integer,
    date timestamp with time zone NOT NULL,
    slug character varying(50),
    CONSTRAINT products_product_discount_check CHECK ((discount >= 0))
);


ALTER TABLE public.products_product OWNER TO soyuzbek;

--
-- Name: products_product_color; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_product_color (
    id integer NOT NULL,
    product_id integer NOT NULL,
    color_id integer NOT NULL
);


ALTER TABLE public.products_product_color OWNER TO soyuzbek;

--
-- Name: products_product_color_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_product_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_color_id_seq OWNER TO soyuzbek;

--
-- Name: products_product_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_product_color_id_seq OWNED BY public.products_product_color.id;


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO soyuzbek;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: products_product_size; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_product_size (
    id integer NOT NULL,
    product_id integer NOT NULL,
    size_id integer NOT NULL
);


ALTER TABLE public.products_product_size OWNER TO soyuzbek;

--
-- Name: products_product_size_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_product_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_size_id_seq OWNER TO soyuzbek;

--
-- Name: products_product_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_product_size_id_seq OWNED BY public.products_product_size.id;


--
-- Name: products_review; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_review (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    rating numeric(4,2) NOT NULL,
    comment text,
    product_id integer
);


ALTER TABLE public.products_review OWNER TO soyuzbek;

--
-- Name: products_review_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_review_id_seq OWNER TO soyuzbek;

--
-- Name: products_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_review_id_seq OWNED BY public.products_review.id;


--
-- Name: products_size; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.products_size (
    id integer NOT NULL,
    value character varying(8) NOT NULL,
    code character varying(6) NOT NULL
);


ALTER TABLE public.products_size OWNER TO soyuzbek;

--
-- Name: products_size_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.products_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_size_id_seq OWNER TO soyuzbek;

--
-- Name: products_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.products_size_id_seq OWNED BY public.products_size.id;


--
-- Name: users_email; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.users_email (
    id integer NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.users_email OWNER TO soyuzbek;

--
-- Name: users_email_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.users_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_email_id_seq OWNER TO soyuzbek;

--
-- Name: users_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.users_email_id_seq OWNED BY public.users_email.id;


--
-- Name: users_town; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.users_town (
    id integer NOT NULL,
    name character varying(40),
    country character varying(254)
);


ALTER TABLE public.users_town OWNER TO soyuzbek;

--
-- Name: users_town_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.users_town_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_town_id_seq OWNER TO soyuzbek;

--
-- Name: users_town_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.users_town_id_seq OWNED BY public.users_town.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_active boolean NOT NULL,
    last_login timestamp with time zone,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO soyuzbek;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO soyuzbek;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO soyuzbek;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO soyuzbek;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO soyuzbek;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO soyuzbek;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: users_userprofile; Type: TABLE; Schema: public; Owner: soyuzbek
--

CREATE TABLE public.users_userprofile (
    id integer NOT NULL,
    first_name character varying(254),
    last_name character varying(254),
    company_name character varying(254),
    address character varying(254),
    town_id integer,
    user_id integer
);


ALTER TABLE public.users_userprofile OWNER TO soyuzbek;

--
-- Name: users_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuzbek
--

CREATE SEQUENCE public.users_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userprofile_id_seq OWNER TO soyuzbek;

--
-- Name: users_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuzbek
--

ALTER SEQUENCE public.users_userprofile_id_seq OWNED BY public.users_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: meta_tags id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.meta_tags ALTER COLUMN id SET DEFAULT nextval('public.meta_tags_id_seq'::regclass);


--
-- Name: products_brand id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand ALTER COLUMN id SET DEFAULT nextval('public.products_brand_id_seq'::regclass);


--
-- Name: products_brand_category_set id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand_category_set ALTER COLUMN id SET DEFAULT nextval('public.products_brand_category_set_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_color id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_color ALTER COLUMN id SET DEFAULT nextval('public.products_color_id_seq'::regclass);


--
-- Name: products_favourite id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite ALTER COLUMN id SET DEFAULT nextval('public.products_favourite_id_seq'::regclass);


--
-- Name: products_favourite_products id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite_products ALTER COLUMN id SET DEFAULT nextval('public.products_favourite_products_id_seq'::regclass);


--
-- Name: products_image id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_image ALTER COLUMN id SET DEFAULT nextval('public.products_image_id_seq'::regclass);


--
-- Name: products_order id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_order ALTER COLUMN id SET DEFAULT nextval('public.products_order_id_seq'::regclass);


--
-- Name: products_orderproduct id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_orderproduct ALTER COLUMN id SET DEFAULT nextval('public.products_orderproduct_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_product_color id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_color ALTER COLUMN id SET DEFAULT nextval('public.products_product_color_id_seq'::regclass);


--
-- Name: products_product_size id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_size ALTER COLUMN id SET DEFAULT nextval('public.products_product_size_id_seq'::regclass);


--
-- Name: products_review id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_review ALTER COLUMN id SET DEFAULT nextval('public.products_review_id_seq'::regclass);


--
-- Name: products_size id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_size ALTER COLUMN id SET DEFAULT nextval('public.products_size_id_seq'::regclass);


--
-- Name: users_email id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_email ALTER COLUMN id SET DEFAULT nextval('public.users_email_id_seq'::regclass);


--
-- Name: users_town id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_town ALTER COLUMN id SET DEFAULT nextval('public.users_town_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Name: users_userprofile id; Type: DEFAULT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_userprofile ALTER COLUMN id SET DEFAULT nextval('public.users_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add Town	7	add_town
26	Can change Town	7	change_town
27	Can delete Town	7	delete_town
28	Can view Town	7	view_town
29	Can add user profile	8	add_userprofile
30	Can change user profile	8	change_userprofile
31	Can delete user profile	8	delete_userprofile
32	Can view user profile	8	view_userprofile
33	Can add email	9	add_email
34	Can change email	9	change_email
35	Can delete email	9	delete_email
36	Can view email	9	view_email
37	Can add Brand	10	add_brand
38	Can change Brand	10	change_brand
39	Can delete Brand	10	delete_brand
40	Can view Brand	10	view_brand
41	Can add Category	11	add_category
42	Can change Category	11	change_category
43	Can delete Category	11	delete_category
44	Can view Category	11	view_category
45	Can add Color	12	add_color
46	Can change Color	12	change_color
47	Can delete Color	12	delete_color
48	Can view Color	12	view_color
49	Can add Size	13	add_size
50	Can change Size	13	change_size
51	Can delete Size	13	delete_size
52	Can view Size	13	view_size
53	Can add Product	14	add_product
54	Can change Product	14	change_product
55	Can delete Product	14	delete_product
56	Can view Product	14	view_product
57	Can add Image	15	add_image
58	Can change Image	15	change_image
59	Can delete Image	15	delete_image
60	Can view Image	15	view_image
61	Can add Favourite	16	add_favourite
62	Can change Favourite	16	change_favourite
63	Can delete Favourite	16	delete_favourite
64	Can view Favourite	16	view_favourite
65	Can add Order	17	add_order
66	Can change Order	17	change_order
67	Can delete Order	17	delete_order
68	Can view Order	17	view_order
69	Can add order product	18	add_orderproduct
70	Can change order product	18	change_orderproduct
71	Can delete order product	18	delete_orderproduct
72	Can view order product	18	view_orderproduct
73	Can add Review	19	add_review
74	Can change Review	19	change_review
75	Can delete Review	19	delete_review
76	Can view Review	19	view_review
77	Can add meta tags	20	add_metatag
78	Can change meta tags	20	change_metatag
79	Can delete meta tags	20	delete_metatag
80	Can view meta tags	20	view_metatag
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-07-17 08:04:12.562+00	1	Category_sample	1	[{"added": {}}]	11	1
2	2019-07-17 08:05:02.091+00	1	Brand_sample	1	[{"added": {}}]	10	1
3	2019-07-17 08:06:25.583+00	1	Black	1	[{"added": {}}]	12	1
4	2019-07-17 08:06:39.51+00	1	100x333	1	[{"added": {}}]	13	1
5	2019-07-17 08:09:19.572+00	1	Product_sample	1	[{"added": {}}]	14	1
6	2019-07-17 08:11:27.941+00	1	Category_sample	2	[{"changed": {"fields": ["image"]}}]	11	1
7	2019-07-18 01:10:10.99+00	1	Product_sample	2	[{"added": {"name": "Image", "object": "Product_sample - 1"}}]	14	1
8	2019-07-18 02:04:53.736+00	2	bir_categori	1	[{"added": {}}]	11	1
9	2019-07-18 02:05:39.014+00	2	red	1	[{"added": {}}]	12	1
10	2019-07-18 02:05:53.514+00	2	XXL	1	[{"added": {}}]	13	1
11	2019-07-18 02:08:04.202+00	2	Bir-mal	1	[{"added": {}}, {"added": {"name": "Image", "object": "Bir-mal - 2"}}]	14	1
12	2019-07-18 06:40:39.18+00	2	bir_categori	2	[{"changed": {"fields": ["image"]}}]	11	1
13	2019-07-18 06:40:51.862+00	1	Category_sample	2	[{"changed": {"fields": ["image"]}}]	11	1
14	2019-07-18 06:41:34.945+00	2	Bir-mal	2	[{"changed": {"name": "Image", "object": "Bir-mal - 2", "fields": ["image"]}}]	14	1
15	2019-07-18 06:41:53.644+00	1	Product_sample	2	[{"changed": {"name": "Image", "object": "Product_sample - 1", "fields": ["image"]}}]	14	1
16	2019-07-20 11:45:22.982+00	2	Bir-mal	2	[]	14	1
17	2019-07-20 11:45:26.868+00	1	Product_sample	2	[]	14	1
18	2019-07-21 02:09:33.097+00	2	Массажная накидка	1	[{"added": {}}]	10	1
19	2019-07-21 02:10:20.282+00	2	Массажная накидка	2	[]	10	1
20	2019-07-22 15:34:38.342+00	2	bir_categori	3		11	1
21	2019-07-22 15:34:38.344+00	1	Category_sample	3		11	1
22	2019-07-22 15:34:57.01+00	1	Category_sample	3		11	1
23	2019-07-22 15:37:02.181+00	3	массажные накидки	1	[{"added": {}}]	11	1
24	2019-07-22 15:37:10.421+00	3	массажные накидки	3		11	1
25	2019-07-22 15:37:27.61+00	4	массажные накидки	1	[{"added": {}}]	11	1
26	2019-07-22 15:40:59.292+00	3	80х40	1	[{"added": {}}]	13	1
27	2019-07-22 15:41:38.536+00	3	накидка массажная	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 \\u043c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f - 3"}}]	14	1
28	2019-07-22 15:41:50.698+00	2	Bir-mal	3		14	1
29	2019-07-22 15:41:50.7+00	1	Product_sample	3		14	1
30	2019-07-22 15:42:20.76+00	2	bir_categori	3		11	1
31	2019-07-22 15:42:20.762+00	1	Category_sample	3		11	1
32	2019-07-22 15:44:11.605+00	4	массажные накидки	2	[{"changed": {"fields": ["image"]}}]	11	1
33	2019-07-22 15:44:57.194+00	3	накидка массажная	2	[]	14	1
34	2019-07-22 15:45:39.025+00	3	накидка массажная	2	[{"changed": {"fields": ["slug"]}}]	14	1
35	2019-07-22 15:45:56.55+00	3	nakidka massajnaya	2	[{"changed": {"fields": ["name"]}}]	14	1
36	2019-07-23 10:08:34.321+00	3	nakidka massajnaya	2	[]	14	1
37	2019-07-23 10:09:18.548+00	3	накидка массажная	2	[{"changed": {"fields": ["name"]}}]	14	1
38	2019-07-23 10:16:51.92+00	4	массажные накидки	2	[]	11	1
39	2019-07-23 10:17:17.312+00	4	массажные накидки	2	[]	11	1
40	2019-07-23 10:21:17.369+00	4	массажные накидки	2	[]	11	1
41	2019-07-23 10:21:40.509+00	2	Массажная накидка	2	[{"changed": {"fields": ["category_set"]}}]	10	1
42	2019-07-23 15:14:44.26+00	3	накидка массажная	2	[{"changed": {"fields": ["status"]}}]	14	1
43	2019-07-23 16:07:48.265+00	3	накидка массажная	2	[{"changed": {"fields": ["status"]}}]	14	1
44	2019-07-23 16:13:13.014+00	5	Бассейны	1	[{"added": {}}]	11	1
45	2019-07-24 12:21:22.869+00	6	Бассейны	1	[{"added": {}}]	11	1
46	2019-07-24 12:23:35.688+00	6	Бассейны	2	[]	11	1
47	2019-07-24 12:26:02.82+00	6	Бассейны	2	[]	11	1
48	2019-07-24 12:32:41.963+00	3	Бассейн Intex Easy S	1	[{"added": {}}]	10	1
49	2019-07-24 13:48:08.844+00	5	Бассейны	3		11	1
50	2019-07-24 13:50:05.531+00	4	Товары для дома	2	[{"changed": {"fields": ["name", "image"]}}]	11	1
51	2019-07-24 13:54:16.243+00	4	Best Way	1	[{"added": {}}]	10	1
52	2019-07-24 13:54:37.008+00	2	Массажная накидка	3		10	1
53	2019-07-24 13:58:47.201+00	6	Надувные бассейны	2	[{"changed": {"fields": ["name"]}}]	11	1
54	2019-07-24 14:01:01.446+00	4	Надувной бассейн	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u0431\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d - 4"}}]	14	1
55	2019-07-24 14:01:48.002+00	4	Надувной бассейн	2	[{"changed": {"fields": ["status"]}}]	14	1
56	2019-07-24 14:02:09.18+00	4	Надувной бассейн	2	[{"changed": {"fields": ["price"]}}]	14	1
57	2019-07-24 14:03:28.436+00	4	Надувной бассейн	2	[{"changed": {"fields": ["status"]}}]	14	1
58	2019-07-27 02:44:54.385+00	7	Товары для здоровья	1	[{"added": {}}]	11	1
59	2019-07-27 02:46:48.969+00	5	Us medica pilot	1	[{"added": {}}]	10	1
60	2019-07-27 02:47:43.964+00	4	Надувной бассейн	3		14	1
61	2019-07-27 02:47:43.966+00	3	накидка массажная	3		14	1
62	2019-07-27 02:57:03.12+00	5	Us Medica Pilot	2	[{"changed": {"fields": ["name"]}}]	10	1
63	2019-07-27 03:06:04.075+00	5	Массажная накидка US Medica Pilot	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 US Medica Pilot - 5"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 US Medica Pilot - 6"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 US Medica Pilot - 7"}}]	14	1
64	2019-07-27 03:21:40.73+00	6	Magic Massager	1	[{"added": {}}]	10	1
65	2019-07-27 03:43:19.533+00	6	Magic Massager	2	[]	10	1
66	2019-07-27 03:44:26.468+00	6	Magic Massager	2	[]	10	1
67	2019-07-27 03:51:55.648+00	6	Массажер Magic Massager	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u0435\\u0440 Magic Massager - 8"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u0435\\u0440 Magic Massager - 9"}}]	14	1
68	2019-07-27 04:05:33.957+00	7	Надувной Бассейн Intex 305х183х56 См	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u0411\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d Intex 305\\u0445183\\u044556 \\u0421\\u043c - 10"}}]	14	1
69	2019-07-27 04:16:59.645+00	8	Бассейн надувной 86×25 см	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u0411\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 86\\u00d725 \\u0441\\u043c - 11"}}]	14	1
70	2019-07-27 04:19:21.247+00	9	soyuz	1	[{"added": {}}, {"added": {"name": "Image", "object": "soyuz - 12"}}, {"added": {"name": "Image", "object": "soyuz - 13"}}, {"added": {"name": "Image", "object": "soyuz - 14"}}]	14	1
71	2019-07-27 04:19:54.882+00	9	soyuz	3		14	1
72	2019-07-27 04:23:06.831+00	7	Надувной Бассейн Intex 305х183х56 См	2	[{"changed": {"fields": ["category"]}}]	14	1
73	2019-07-27 04:47:49.945+00	1	gghh@gh.ik	3		9	1
74	2019-07-27 08:28:56.773+00	8	аксессуары	1	[{"added": {}}]	11	1
75	2019-07-27 08:31:31.008+00	10	ручной вентилрятор	1	[{"added": {}}]	14	1
76	2019-07-27 08:32:14.834+00	10	ручной вентилрятор	2	[{"changed": {"fields": ["price"]}}]	14	1
77	2019-07-27 08:34:10.355+00	10	ручной вентилрятор	2	[{"added": {"name": "Image", "object": "\\u0440\\u0443\\u0447\\u043d\\u043e\\u0439 \\u0432\\u0435\\u043d\\u0442\\u0438\\u043b\\u0440\\u044f\\u0442\\u043e\\u0440 - 15"}}, {"added": {"name": "Image", "object": "\\u0440\\u0443\\u0447\\u043d\\u043e\\u0439 \\u0432\\u0435\\u043d\\u0442\\u0438\\u043b\\u0440\\u044f\\u0442\\u043e\\u0440 - 16"}}]	14	1
78	2019-07-28 15:26:49.639+00	1	Надувной бассейн	1	[{"added": {}}]	20	1
79	2019-07-28 15:32:46.795+00	2	unical.kg	1	[{"added": {}}]	20	1
80	2019-07-28 16:49:49.851+00	11	Авто массажёр us medical pilot	1	[{"added": {}}]	14	1
81	2019-08-04 06:36:35.185+00	12	Smart Fitness EMS toning	1	[{"added": {}}]	14	1
82	2019-08-04 06:53:13.499+00	3	Pink	1	[{"added": {}}]	12	1
83	2019-08-04 06:54:59.685+00	13	Посуда для сухофруктов и конфетов	1	[{"added": {}}]	14	1
84	2019-08-04 07:26:20.243+00	4	green	1	[{"added": {}}]	13	1
85	2019-08-04 07:27:05.454+00	4	Green	1	[{"added": {}}]	12	1
86	2019-08-04 07:29:40.475+00	14	Ручной блендер	1	[{"added": {}}]	14	1
87	2019-08-04 08:24:47.87+00	5	Blue	1	[{"added": {}}]	12	1
88	2019-08-04 08:25:20.599+00	5	XL	1	[{"added": {}}]	13	1
89	2019-08-04 08:26:17.689+00	15	Дорожный утюг!	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0439 \\u0443\\u0442\\u044e\\u0433! - 17"}}, {"added": {"name": "Image", "object": "\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0439 \\u0443\\u0442\\u044e\\u0433! - 18"}}]	14	1
90	2019-08-05 02:41:31.569+00	7	EMS TRAINER 3 patch	1	[{"added": {}}]	10	1
91	2019-08-05 02:42:59.086+00	6	19 х 17	1	[{"added": {}}]	13	1
92	2019-08-05 02:43:55.204+00	16	Миостимулятор EMS TRAINER 3 patch	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041c\\u0438\\u043e\\u0441\\u0442\\u0438\\u043c\\u0443\\u043b\\u044f\\u0442\\u043e\\u0440 EMS TRAINER 3 patch - 19"}}, {"added": {"name": "Image", "object": "\\u041c\\u0438\\u043e\\u0441\\u0442\\u0438\\u043c\\u0443\\u043b\\u044f\\u0442\\u043e\\u0440 EMS TRAINER 3 patch - 20"}}, {"added": {"name": "Image", "object": "\\u041c\\u0438\\u043e\\u0441\\u0442\\u0438\\u043c\\u0443\\u043b\\u044f\\u0442\\u043e\\u0440 EMS TRAINER 3 patch - 21"}}]	14	1
93	2019-08-05 03:09:29.6+00	8	Менажница	1	[{"added": {}}]	10	1
94	2019-08-05 03:13:01.265+00	8	Менажница	3		10	1
95	2019-08-05 03:13:21.795+00	9	Unbranded	1	[{"added": {}}]	10	1
96	2019-08-05 03:16:06.135+00	7	27х13	1	[{"added": {}}]	13	1
97	2019-08-05 03:21:42.396+00	17	Менажница посуда для сухофруктов и конфетов	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041c\\u0435\\u043d\\u0430\\u0436\\u043d\\u0438\\u0446\\u0430 \\u043f\\u043e\\u0441\\u0443\\u0434\\u0430 \\u0434\\u043b\\u044f \\u0441\\u0443\\u0445\\u043e\\u0444\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432 \\u0438 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u043e\\u0432 - 22"}}, {"added": {"name": "Image", "object": "\\u041c\\u0435\\u043d\\u0430\\u0436\\u043d\\u0438\\u0446\\u0430 \\u043f\\u043e\\u0441\\u0443\\u0434\\u0430 \\u0434\\u043b\\u044f \\u0441\\u0443\\u0445\\u043e\\u0444\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432 \\u0438 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u043e\\u0432 - 23"}}]	14	1
98	2019-08-05 03:23:01.019+00	17	Менажница посуда для сухофруктов и конфетов	2	[{"added": {"name": "Image", "object": "\\u041c\\u0435\\u043d\\u0430\\u0436\\u043d\\u0438\\u0446\\u0430 \\u043f\\u043e\\u0441\\u0443\\u0434\\u0430 \\u0434\\u043b\\u044f \\u0441\\u0443\\u0445\\u043e\\u0444\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432 \\u0438 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u043e\\u0432 - 24"}}, {"added": {"name": "Image", "object": "\\u041c\\u0435\\u043d\\u0430\\u0436\\u043d\\u0438\\u0446\\u0430 \\u043f\\u043e\\u0441\\u0443\\u0434\\u0430 \\u0434\\u043b\\u044f \\u0441\\u0443\\u0445\\u043e\\u0444\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432 \\u0438 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u043e\\u0432 - 25"}}]	14	1
99	2019-08-05 03:26:31.941+00	10	iSmoozi	1	[{"added": {}}]	10	1
100	2019-08-05 03:28:35.971+00	8	22х7,5	1	[{"added": {}}]	13	1
101	2019-08-05 03:31:55.025+00	18	Портативный блендер для смузи	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041f\\u043e\\u0440\\u0442\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u0439 \\u0431\\u043b\\u0435\\u043d\\u0434\\u0435\\u0440 \\u0434\\u043b\\u044f \\u0441\\u043c\\u0443\\u0437\\u0438 - 26"}}, {"added": {"name": "Image", "object": "\\u041f\\u043e\\u0440\\u0442\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u0439 \\u0431\\u043b\\u0435\\u043d\\u0434\\u0435\\u0440 \\u0434\\u043b\\u044f \\u0441\\u043c\\u0443\\u0437\\u0438 - 27"}}, {"added": {"name": "Image", "object": "\\u041f\\u043e\\u0440\\u0442\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u0439 \\u0431\\u043b\\u0435\\u043d\\u0434\\u0435\\u0440 \\u0434\\u043b\\u044f \\u0441\\u043c\\u0443\\u0437\\u0438 - 28"}}]	14	1
102	2019-08-05 03:46:46.132+00	14	Ручной блендер	3		14	1
103	2019-08-05 03:56:11.718+00	11	Intex	1	[{"added": {}}]	10	1
104	2019-08-05 03:57:49.061+00	9	99х191	1	[{"added": {}}]	13	1
105	2019-08-05 04:04:06.959+00	19	НАДУВНОЙ МАТРАС INTEX 68757 99Х191Х22	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0410\\u0414\\u0423\\u0412\\u041d\\u041e\\u0419 \\u041c\\u0410\\u0422\\u0420\\u0410\\u0421 INTEX 68757 99\\u0425191\\u042522 - 29"}}, {"added": {"name": "Image", "object": "\\u041d\\u0410\\u0414\\u0423\\u0412\\u041d\\u041e\\u0419 \\u041c\\u0410\\u0422\\u0420\\u0410\\u0421 INTEX 68757 99\\u0425191\\u042522 - 30"}}, {"added": {"name": "Image", "object": "\\u041d\\u0410\\u0414\\u0423\\u0412\\u041d\\u041e\\u0419 \\u041c\\u0410\\u0422\\u0420\\u0410\\u0421 INTEX 68757 99\\u0425191\\u042522 - 31"}}]	14	1
106	2019-08-05 04:13:50.42+00	9	Надувные мебели	1	[{"added": {}}]	11	1
107	2019-08-05 04:15:26.145+00	10	185х76	1	[{"added": {}}]	13	1
108	2019-08-05 04:17:38.442+00	20	Надувной матрас Bestway 67000	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67000 - 32"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67000 - 33"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67000 - 34"}}]	14	1
109	2019-08-05 04:23:51.343+00	11	137x191	1	[{"added": {}}]	13	1
110	2019-08-05 04:25:04.857+00	21	Надувной матрас Bestway 67002	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67002 - 35"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67002 - 36"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67002 - 37"}}]	14	1
111	2019-08-05 04:28:25.201+00	12	152x203	1	[{"added": {}}]	13	1
112	2019-08-05 04:30:53.579+00	22	Надувной матрас Bestway 67374	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67374 - 38"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67374 - 39"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67374 - 40"}}]	14	1
113	2019-08-05 08:33:27.375+00	13	76х185	1	[{"added": {}}]	13	1
114	2019-08-05 08:34:07.318+00	23	Надувной матрас Bestway 67379	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67379 - 41"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67379 - 42"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67379 - 43"}}]	14	1
115	2019-08-05 08:39:50.386+00	14	188х99	1	[{"added": {}}]	13	1
116	2019-08-05 08:48:30.983+00	24	Надувной матрас Bestway 67407	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67407 - 44"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67407 - 45"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67407 - 46"}}]	14	1
117	2019-08-05 08:54:39.656+00	15	137x191	1	[{"added": {}}]	13	1
118	2019-08-05 08:55:19.095+00	25	Надувной матрас Bestway 67408	1	[{"added": {}}]	14	1
119	2019-08-05 08:59:42.029+00	16	203х147	1	[{"added": {}}]	13	1
120	2019-08-05 09:00:22.554+00	26	Надувной матрас Bestway Camping Mattress 67016B	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway Camping Mattress 67016B - 47"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway Camping Mattress 67016B - 48"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway Camping Mattress 67016B - 49"}}]	14	1
121	2019-08-05 09:06:20.316+00	17	188 х 71	1	[{"added": {}}]	13	1
122	2019-08-05 09:09:15.437+00	27	Надувной матрас Intex 58894	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 58894 - 50"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 58894 - 51"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 58894 - 52"}}]	14	1
123	2019-08-05 09:16:40.34+00	18	99х191	1	[{"added": {}}]	13	1
124	2019-08-05 09:17:21.897+00	28	Надувной матрас Intex 66927 Downy Twin 99x191x22	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 66927 Downy Twin 99x191x22 - 53"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 66927 Downy Twin 99x191x22 - 54"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 66927 Downy Twin 99x191x22 - 55"}}]	14	1
125	2019-08-05 10:00:35.924+00	19	72х189	1	[{"added": {}}]	13	1
126	2019-08-05 10:01:12.049+00	29	Надувной матрас Intex 68798 Кемпинг	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 68798 \\u041a\\u0435\\u043c\\u043f\\u0438\\u043d\\u0433 - 56"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 68798 \\u041a\\u0435\\u043c\\u043f\\u0438\\u043d\\u0433 - 57"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 68798 \\u041a\\u0435\\u043c\\u043f\\u0438\\u043d\\u0433 - 58"}}]	14	1
127	2019-08-05 10:06:46.042+00	28	Надувной матрас Intex 66927 Downy Twin 99x191x22	2	[{"changed": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Intex 66927 Downy Twin 99x191x22 - 53", "fields": ["image"]}}]	14	1
128	2019-08-05 10:13:29.236+00	7	Надувной Бассейн Intex 305х183х56 См	2	[{"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u0411\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d Intex 305\\u0445183\\u044556 \\u0421\\u043c - 59"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u0411\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d Intex 305\\u0445183\\u044556 \\u0421\\u043c - 60"}}, {"changed": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u0411\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d Intex 305\\u0445183\\u044556 \\u0421\\u043c - 10", "fields": ["image"]}}]	14	1
129	2019-08-05 10:16:54.718+00	13	Посуда для сухофруктов и конфетов	3		14	1
130	2019-08-05 11:17:44.432+00	20	193x102	1	[{"added": {}}]	13	1
131	2019-08-05 11:18:57.688+00	30	Кресло надувное Bestway 67277N Green	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041a\\u0440\\u0435\\u0441\\u043b\\u043e \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0435 Bestway 67277N Green - 61"}}, {"added": {"name": "Image", "object": "\\u041a\\u0440\\u0435\\u0441\\u043b\\u043e \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0435 Bestway 67277N Green - 62"}}, {"added": {"name": "Image", "object": "\\u041a\\u0440\\u0435\\u0441\\u043b\\u043e \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0435 Bestway 67277N Green - 63"}}]	14	1
132	2019-08-05 11:24:11.895+00	6	oreng	1	[{"added": {}}]	12	1
133	2019-08-05 11:24:43.807+00	7	orenge	1	[{"added": {}}]	12	1
134	2019-08-05 11:25:30.731+00	21	188х152	1	[{"added": {}}]	13	1
135	2019-08-05 11:26:03.119+00	31	Кресло надувное Bestway 67356N Orange black	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041a\\u0440\\u0435\\u0441\\u043b\\u043e \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0435 Bestway 67356N Orange black - 64"}}, {"added": {"name": "Image", "object": "\\u041a\\u0440\\u0435\\u0441\\u043b\\u043e \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0435 Bestway 67356N Orange black - 65"}}, {"added": {"name": "Image", "object": "\\u041a\\u0440\\u0435\\u0441\\u043b\\u043e \\u043d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0435 Bestway 67356N Orange black - 66"}}]	14	1
136	2019-08-05 11:34:16.461+00	25	Надувной матрас Bestway 67408	2	[{"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67408 - 67"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0434\\u0443\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0442\\u0440\\u0430\\u0441 Bestway 67408 - 68"}}]	14	1
137	2019-08-05 11:35:54.607+00	10	ручной вентилрятор	3		14	1
138	2019-08-05 12:07:46.056+00	10	электроника	1	[{"added": {}}]	11	1
139	2019-08-05 12:10:41.715+00	12	К 18	1	[{"added": {}}]	10	1
140	2019-08-05 12:10:55.86+00	10	Электроника	2	[{"changed": {"fields": ["name"]}}]	11	1
141	2019-08-05 12:11:55.005+00	22	20х10	1	[{"added": {}}]	13	1
142	2019-08-05 12:14:02.849+00	32	Ручной Мини Вентилятор	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u0420\\u0443\\u0447\\u043d\\u043e\\u0439 \\u041c\\u0438\\u043d\\u0438 \\u0412\\u0435\\u043d\\u0442\\u0438\\u043b\\u044f\\u0442\\u043e\\u0440 - 69"}}, {"added": {"name": "Image", "object": "\\u0420\\u0443\\u0447\\u043d\\u043e\\u0439 \\u041c\\u0438\\u043d\\u0438 \\u0412\\u0435\\u043d\\u0442\\u0438\\u043b\\u044f\\u0442\\u043e\\u0440 - 70"}}, {"added": {"name": "Image", "object": "\\u0420\\u0443\\u0447\\u043d\\u043e\\u0439 \\u041c\\u0438\\u043d\\u0438 \\u0412\\u0435\\u043d\\u0442\\u0438\\u043b\\u044f\\u0442\\u043e\\u0440 - 71"}}]	14	1
143	2019-08-05 12:25:57.535+00	13	USB Desk Fan	1	[{"added": {}}]	10	1
144	2019-08-05 12:28:26.998+00	33	Настольный вентилятор USB Desk Fan	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0441\\u0442\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u0435\\u043d\\u0442\\u0438\\u043b\\u044f\\u0442\\u043e\\u0440 USB Desk Fan - 72"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0441\\u0442\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u0435\\u043d\\u0442\\u0438\\u043b\\u044f\\u0442\\u043e\\u0440 USB Desk Fan - 73"}}, {"added": {"name": "Image", "object": "\\u041d\\u0430\\u0441\\u0442\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u0435\\u043d\\u0442\\u0438\\u043b\\u044f\\u0442\\u043e\\u0440 USB Desk Fan - 74"}}]	14	1
145	2019-08-05 12:32:10.447+00	19	НАДУВНОЙ МАТРАС INTEX 68757 99Х191Х22	2	[{"changed": {"fields": ["category"]}}]	14	1
146	2019-08-06 06:28:05.2+00	14	JFMC01	1	[{"added": {}}]	10	1
147	2019-08-06 06:29:30.753+00	23	78х20	1	[{"added": {}}]	13	1
148	2019-08-06 06:30:05.96+00	34	Массажная накидка JFMC01	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 JFMC01 - 75"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 JFMC01 - 76"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 JFMC01 - 77"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 JFMC01 - 78"}}, {"added": {"name": "Image", "object": "\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u043d\\u0430\\u043a\\u0438\\u0434\\u043a\\u0430 JFMC01 - 79"}}]	14	1
149	2019-08-06 06:42:20.773+00	15	WF03	1	[{"added": {}}]	10	1
150	2019-08-06 06:43:50.395+00	24	32х92	1	[{"added": {}}]	13	1
151	2019-08-06 06:48:12.553+00	35	Диспенсер кулерный WF03	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u0414\\u0438\\u0441\\u043f\\u0435\\u043d\\u0441\\u0435\\u0440 \\u043a\\u0443\\u043b\\u0435\\u0440\\u043d\\u044b\\u0439 WF03 - 80"}}, {"added": {"name": "Image", "object": "\\u0414\\u0438\\u0441\\u043f\\u0435\\u043d\\u0441\\u0435\\u0440 \\u043a\\u0443\\u043b\\u0435\\u0440\\u043d\\u044b\\u0439 WF03 - 81"}}]	14	1
152	2019-08-06 06:55:04.503+00	16	BONA V-55	1	[{"added": {}}]	10	1
153	2019-08-06 06:55:29.35+00	8	белый	1	[{"added": {}}]	12	1
154	2019-08-06 06:56:19.88+00	36	Диспенсер напольный BONA V-55	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u0414\\u0438\\u0441\\u043f\\u0435\\u043d\\u0441\\u0435\\u0440 \\u043d\\u0430\\u043f\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 BONA V-55 - 82"}}, {"added": {"name": "Image", "object": "\\u0414\\u0438\\u0441\\u043f\\u0435\\u043d\\u0441\\u0435\\u0440 \\u043d\\u0430\\u043f\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 BONA V-55 - 83"}}]	14	1
155	2019-08-06 07:00:42.217+00	17	61LA	1	[{"added": {}}]	10	1
156	2019-08-06 07:01:30.036+00	37	Диспенсер кулерный 61LA	1	[{"added": {}}, {"added": {"name": "Image", "object": "\\u0414\\u0438\\u0441\\u043f\\u0435\\u043d\\u0441\\u0435\\u0440 \\u043a\\u0443\\u043b\\u0435\\u0440\\u043d\\u044b\\u0439 61LA - 84"}}]	14	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	users	town
8	users	userprofile
9	users	email
10	products	brand
11	products	category
12	products	color
13	products	size
14	products	product
15	products	image
16	products	favourite
17	products	order
18	products	orderproduct
19	products	review
20	metatags	metatag
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-09-02 19:14:25.294286+00
2	contenttypes	0002_remove_content_type_name	2019-09-02 19:14:25.352089+00
3	auth	0001_initial	2019-09-02 19:14:25.60696+00
4	auth	0002_alter_permission_name_max_length	2019-09-02 19:14:25.913143+00
5	auth	0003_alter_user_email_max_length	2019-09-02 19:14:25.951198+00
6	auth	0004_alter_user_username_opts	2019-09-02 19:14:25.970312+00
7	auth	0005_alter_user_last_login_null	2019-09-02 19:14:25.991259+00
8	auth	0006_require_contenttypes_0002	2019-09-02 19:14:25.997221+00
9	auth	0007_alter_validators_add_error_messages	2019-09-02 19:14:26.013421+00
10	auth	0008_alter_user_username_max_length	2019-09-02 19:14:26.024981+00
11	auth	0009_alter_user_last_name_max_length	2019-09-02 19:14:26.035412+00
12	auth	0010_alter_group_name_max_length	2019-09-02 19:14:26.047174+00
13	auth	0011_update_proxy_permissions	2019-09-02 19:14:26.056292+00
14	users	0001_initial	2019-09-02 19:14:26.476796+00
15	admin	0001_initial	2019-09-02 19:14:27.012221+00
16	admin	0002_logentry_remove_auto_add	2019-09-02 19:14:27.16664+00
17	admin	0003_logentry_add_action_flag_choices	2019-09-02 19:14:27.182308+00
18	metatags	0001_initial	2019-09-02 19:14:27.301257+00
19	products	0001_initial	2019-09-02 19:14:28.06133+00
20	products	0002_favourite_user	2019-09-02 19:14:28.731177+00
21	products	0003_category_image	2019-09-02 19:14:28.833081+00
22	products	0004_brand_category_set	2019-09-02 19:14:28.930229+00
23	products	0005_auto_20190702_1215	2019-09-02 19:14:29.1796+00
24	products	0006_product_date	2019-09-02 19:14:29.386809+00
25	products	0007_auto_20190705_1516	2019-09-02 19:14:29.428211+00
26	products	0008_auto_20190705_1518	2019-09-02 19:14:29.450868+00
27	products	0009_order_orderproduct	2019-09-02 19:14:29.63981+00
28	products	0010_auto_20190708_1609	2019-09-02 19:14:29.738297+00
29	products	0011_auto_20190708_1644	2019-09-02 19:14:29.869418+00
30	products	0012_auto_20190710_0545	2019-09-02 19:14:29.934836+00
31	products	0013_auto_20190710_0732	2019-09-02 19:14:30.068213+00
32	products	0014_auto_20190710_1318	2019-09-02 19:14:30.080841+00
33	products	0015_review	2019-09-02 19:14:30.188177+00
34	products	0016_review_product	2019-09-02 19:14:30.261973+00
35	products	0017_auto_20190714_0626	2019-09-02 19:14:30.487777+00
36	products	0018_product_slug	2019-09-02 19:14:30.548173+00
37	products	0019_auto_20190719_1019	2019-09-02 19:14:30.810609+00
38	products	0020_auto_20190719_1024	2019-09-02 19:14:30.866639+00
39	products	0021_auto_20190720_0905	2019-09-02 19:14:30.885188+00
40	products	0022_auto_20190720_1339	2019-09-02 19:14:30.910294+00
41	products	0023_auto_20190723_1004	2019-09-02 19:14:30.924619+00
42	products	0024_category_slug	2019-09-02 19:14:30.936727+00
43	products	0025_auto_20190725_0956	2019-09-02 19:14:31.072899+00
44	products	0026_auto_20190725_1012	2019-09-02 19:14:31.105279+00
45	products	0027_auto_20190805_0654	2019-09-02 19:14:31.148999+00
46	sessions	0001_initial	2019-09-02 19:14:31.266309+00
47	users	0002_auto_20190630_1522	2019-09-02 19:14:31.42735+00
48	users	0003_auto_20190630_1525	2019-09-02 19:14:31.460819+00
49	users	0004_email	2019-09-02 19:14:31.590405+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
085zaox1ragph1m2h4ua1owg67bt4l9l	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-11 14:37:11.567+00
34nvp5t0ciqxkwz5dylhn363z8kt7n0f	YjYwMmJhYjJjNDgyNmY0ODU1NTVkMzhhYjY0ZGMwMThmZDQ2MjM3NDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-08-07 21:02:33.888+00
3zra22m03bjqja6v2l8hau72xfq1ubz4	OTBkN2U4OTE2MzZlYTlhZmUwM2Y1MGI3OTBjNDU2NjFjY2Q2MTRlMjp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRhNDhhMWQ2ZTU2ZWFhMjIxODgwOWVmOGFhNmIwNGViYThiZjI1ODMiLCJjYXJ0IjpbeyJwcm9kaWQiOiI1IiwibmFtZSI6Ilx1MDQxY1x1MDQzMFx1MDQ0MVx1MDQ0MVx1MDQzMFx1MDQzNlx1MDQzZFx1MDQzMFx1MDQ0ZiBcdTA0M2RcdTA0MzBcdTA0M2FcdTA0MzhcdTA0MzRcdTA0M2FcdTA0MzAgVVMgTWVkaWNhIFBpbG90IiwicHJpY2UiOiI1MjAwLjAwIiwicXVhbnRpdHkiOiIxIiwicGhvdG8iOiIvbWVkaWEvcHJvZHVjdC1pbWFnZXMvbWFzc2FqbmF5YV9uYWtpZGthX3NpZGVuaXkuanBnIn1dLCJzdWJ0b3RhbCI6IjUyMDAuMDAifQ==	2019-08-19 02:13:53.008+00
5stfrkdjaezm6cgjkc2w56fbl8s0u97l	MjU2YTE2N2ExYTU5NDdiNGZjMGY1NTJlYzNhNjFkOGNiYzBjYjFmOTp7Il9sYW5ndWFnZSI6InJ1IiwiY2FydCI6W3sicHJvZGlkIjoiNSIsIm5hbWUiOiJcdTA0MWNcdTA0MzBcdTA0NDFcdTA0NDFcdTA0MzBcdTA0MzZcdTA0M2RcdTA0MzBcdTA0NGYgXHUwNDNkXHUwNDMwXHUwNDNhXHUwNDM4XHUwNDM0XHUwNDNhXHUwNDMwIFVTIE1lZGljYSBQaWxvdCIsInByaWNlIjoiNTIwMC4wMCIsInF1YW50aXR5IjoiMSIsInBob3RvIjoiL21lZGlhL3Byb2R1Y3QtaW1hZ2VzL21hc3Nham5heWFfbmFraWRrYV9zaWRlbml5LmpwZyJ9XSwic3VidG90YWwiOiI1MjAwLjAwIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRhNDhhMWQ2ZTU2ZWFhMjIxODgwOWVmOGFhNmIwNGViYThiZjI1ODMifQ==	2019-08-17 15:23:56.471+00
5u3c88vo9ohg9npkcgzsf09qdx673pii	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-03 15:13:14.468+00
6qqjug26pnkytuik6yyg4pvs1ya1pma5	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-07 15:49:38.84+00
706z9uhywww9w61tqhgtbheg0dhb92ma	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-07 00:33:57.764+00
8nh5uet2e4uxm26svbt46x8qtvxatagp	OTVmN2QxZTFkNDk2YzQ1MTgyYWI1NDQ3YzUwYWQ0Y2JkMTQ4ZjcxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIn0=	2019-08-11 15:11:23.702+00
au4unu7lj0whh6vjc3t78b34cd0s4969	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-07 20:47:56.663+00
fj5zfy8io98i0vrtjivn64buyguhihp3	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-03 22:03:11.466+00
hlf3swwgteo6xmhykn194qqp2ctd7g2r	OTVmN2QxZTFkNDk2YzQ1MTgyYWI1NDQ3YzUwYWQ0Y2JkMTQ4ZjcxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIn0=	2019-08-05 15:34:04.668+00
iaygq41vrd8lq5e6lmnccjx9t4ztpz33	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-09 09:12:56.703+00
la4auodj23ms1z261zcx5jndfbie37ke	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-03 21:32:04.619+00
lgron1gbyz4f8zf3abkaubancdx6tern	MTY3MjM4NDE0ZjU3MmFhYWU1MDZiMjc3NTk4NDljOGViYzM1OWIxOTp7Il9sYW5ndWFnZSI6InJ1IiwiY2FydCI6W3sicHJvZGlkIjoiNiIsIm5hbWUiOiJcdTA0MWNcdTA0MzBcdTA0NDFcdTA0NDFcdTA0MzBcdTA0MzZcdTA0MzVcdTA0NDAgTWFnaWMgTWFzc2FnZXIiLCJwcmljZSI6IjIxMDAuMDAiLCJxdWFudGl0eSI6IjEiLCJwaG90byI6Ii9tZWRpYS9wcm9kdWN0LWltYWdlcy9XaGF0c0FwcF9JbWFnZV8yMDE5LTA3LTE1X2F0XzIyLjEzLjAyLmpwZWcifV0sInN1YnRvdGFsIjoiMjEwMC4wMCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIn0=	2019-08-19 08:13:18.94+00
n9rkx2lrwpw6ap5j6opx187uettlqfls	NTdkZTgzNWM1Yjk2ZjhiMTJkZmE1NzY5YWRlNzE4YTdjY2FjNDI2MTp7Il9sYW5ndWFnZSI6InJ1IiwiY2FydCI6W3sicHJvZGlkIjoiOCIsIm5hbWUiOiJcdTA0MTFcdTA0MzBcdTA0NDFcdTA0NDFcdTA0MzVcdTA0MzlcdTA0M2QgXHUwNDNkXHUwNDMwXHUwNDM0XHUwNDQzXHUwNDMyXHUwNDNkXHUwNDNlXHUwNDM5IDg2XHUwMGQ3MjUgXHUwNDQxXHUwNDNjIiwicHJpY2UiOiI2NTAuMDAiLCJxdWFudGl0eSI6IjQiLCJwaG90byI6Ii9tZWRpYS9wcm9kdWN0LWltYWdlcy8lRDAlOTElRDAlQjUlRDAlQjdfJUQwJUJEJUQwJUIwJUQwJUI3JUQwJUIyJUQwJUIwJUQwJUJEJUQwJUI4JUQxJThGLmpwZyJ9LHsicHJvZGlkIjoiMTAiLCJuYW1lIjoiXHUwNDQwXHUwNDQzXHUwNDQ3XHUwNDNkXHUwNDNlXHUwNDM5IFx1MDQzMlx1MDQzNVx1MDQzZFx1MDQ0Mlx1MDQzOFx1MDQzYlx1MDQ0MFx1MDQ0Zlx1MDQ0Mlx1MDQzZVx1MDQ0MCIsInByaWNlIjoiMzUwLjAwIiwicXVhbnRpdHkiOiIxIiwicGhvdG8iOiIvbWVkaWEvcHJvZHVjdC1pbWFnZXMvQ2hyeXNhbnRoZW11bS5qcGcifV0sInN1YnRvdGFsIjoiMjk1MC4wMCIsImZhdm91cml0ZXMiOlsicnVjaG5vaS12ZW50aWxyaWF0b3IiXX0=	2019-08-10 11:11:02.036+00
nuw0id0zbtb4z7o4q4jljondlkc96k2r	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-03 15:11:51.667+00
pc6p0mnktlnf4wynpc31i7nzqdgrx9ll	ZmQxMzNiMDZiN2NmYzQ0NzZmYzYzNzFlZDI4ZTRkZjZmMTRhYWI5MTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-08-03 15:13:14.025+00
pql64ihf8n2srs58lsxruwrblgt716je	OTVmN2QxZTFkNDk2YzQ1MTgyYWI1NDQ3YzUwYWQ0Y2JkMTQ4ZjcxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIn0=	2019-08-02 14:41:25.792+00
qen95klfyjmx8rp2qy9ejovlm3w7ug6h	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-07 20:50:04.207+00
qi93t01qvp2spy23wm73aw5ajlcgzk9h	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-11 15:44:47.297+00
rw2djsqwwgky5m5zrvrun90cfwx9sz91	OTVmN2QxZTFkNDk2YzQ1MTgyYWI1NDQ3YzUwYWQ0Y2JkMTQ4ZjcxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIn0=	2019-08-11 15:35:29.961+00
sqf0ldsk7ywt2ue9eukn6cysiccpsjnc	ZTMwZDFhMjk5Y2QwNmMxYmYzY2UyMTcyOTdhZTZjZDdkNmExMmJiZDp7ImNhcnQiOltdLCJzdWJ0b3RhbCI6IjAiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGE0OGExZDZlNTZlYWEyMjE4ODA5ZWY4YWE2YjA0ZWJhOGJmMjU4MyIsImZhdm91cml0ZXMiOlsicnVjaG5vaS12ZW50aWxyaWF0b3IiXX0=	2019-08-10 08:35:41.105+00
u6fsh92p2fs7ineuskath7qt1wreoexp	N2QxM2I2YzhkZmE5YTQ4Y2VlNjFjYTc0MWNhZDhmOWE2ZGIxZDk3MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIiwiZmF2b3VyaXRlcyI6WyIyIiwiMSIsInByb2R1Y3Rfc2FtcGxlIiwibmFraWRrYS1tYXNzYXpobmFpYSJdLCJjYXJ0IjpbXSwic3VidG90YWwiOiIwIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-08-13 21:24:26.919+00
v9mfqgtszz2mr9vgb7kndukh9l5vdify	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-09 06:15:21.494+00
vb7h22dbhqv9x0gclbn7ja2aojcs13sl	ZTkyZjlhZGUwOTAyZDFmNDhmNjg5ZTJkNDQxNWUzNGJlNzhhYTk3Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-08-07 00:25:30.026+00
vtec0jlrzkagwzdnunr392lmz2t9fsjv	MjQwNmY0NmM1Yzc3MzA5NDlmODA0ZDU5MjI2YTFlMDQwOGU3OWRlYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIiwiZmF2b3VyaXRlcyI6WyIxIiwiMiIsInByb2R1Y3Rfc2FtcGxlIl0sImNhcnQiOlt7InByb2RpZCI6MiwibmFtZSI6IkJpci1tYWwiLCJwcmljZSI6IjE5OTAuMDAiLCJxdWFudGl0eSI6IjEiLCJwaG90byI6Ii9tZWRpYS9wcm9kdWN0LWltYWdlcy9yc3pfaW1nXzIwMTgwOTA0XzE4MzI0MS5qcGcifSx7InByb2RpZCI6MSwibmFtZSI6IlByb2R1Y3Rfc2FtcGxlIiwicHJpY2UiOiIxMjAwMC4wMCIsInF1YW50aXR5IjoiMSIsInBob3RvIjoiL21lZGlhL3Byb2R1Y3QtaW1hZ2VzL21hc3NhZ2VfdGFiYmxlX3FYM3FhMXUuanBlZyJ9LHsicHJvZGlkIjoiMSIsIm5hbWUiOiJQcm9kdWN0X3NhbXBsZSIsInByaWNlIjoiMTIwMDAuMDAiLCJxdWFudGl0eSI6IjEiLCJwaG90byI6Ii9tZWRpYS9wcm9kdWN0LWltYWdlcy9tYXNzYWdlX3RhYmJsZV9xWDNxYTF1LmpwZWcifSx7InByb2RpZCI6IjEwIiwibmFtZSI6Ilx1MDQ0MFx1MDQ0M1x1MDQ0N1x1MDQzZFx1MDQzZVx1MDQzOSBcdTA0MzJcdTA0MzVcdTA0M2RcdTA0NDJcdTA0MzhcdTA0M2JcdTA0NDBcdTA0NGZcdTA0NDJcdTA0M2VcdTA0NDAiLCJwcmljZSI6IjM1MC4wMCIsInF1YW50aXR5IjoiMSIsInBob3RvIjoiL21lZGlhL3Byb2R1Y3QtaW1hZ2VzL0NocnlzYW50aGVtdW0uanBnIn1dLCJzdWJ0b3RhbCI6IjI2MzQwLjAwIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-08-14 11:51:23.949+00
i1mfmditf6mjgqt48d7jottgw0nuxma8	OWE1YTVhMzBiZTRhNzYxZDZjMDg5OTI1OWQzY2Q0Y2Y4YjcyNDg2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYTQ4YTFkNmU1NmVhYTIyMTg4MDllZjhhYTZiMDRlYmE4YmYyNTgzIiwiX2xhbmd1YWdlIjoiZW4ifQ==	2019-09-16 19:20:06.187391+00
\.


--
-- Data for Name: meta_tags; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.meta_tags (id, url, object_id, title, keywords, description, content_type_id) FROM stdin;
1	/shop/naduvnye-basseiny/	\N	Надувной бассейн	Надувной бассейн, Лето, Жара, Вода		\N
2	/	\N	unical.kg	unical, unicalkg, юникал, юникалкг, гтшсфд, гтшсфдлп	Интернет магазин предоставляющий большой выбор надувных бассейнов и много товаров для дома и семьи	\N
\.


--
-- Data for Name: products_brand; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_brand (id, name, image, about) FROM stdin;
1	Brand_sample	brands/IMG_20190617_182130.jpg	
2	Массажная накидка	brands/WhatsApp_Image_2019-06-21_at_18.52.46.jpeg	Характеристика\r\n\r\nА. 3 рабочий рисунок на спине: полный, верхний и нижний\r\nB. щипчики для шеи, положительный и обратный массаж, теплотерапия\r\nC. 3 уровня вибрационного массажа на бедре, для расслабления тела и укрепления метаболизма\r\nD. 15 Минут автоматического отключения
3	Бассейн Intex Easy S	brands/8099290ead4c41f56b3597a59d46f18a.jpg	Характеристики\r\n\r\nКонструкция надувной\r\nФорма круглый\r\nДиаметр 183 см\r\nГлубина 51 см\r\nОбъём 886 л\r\nДно бассейна мягкое надувное\r\nНаличие тента нет\r\nНавес от солнца нет\r\nВодяной насос отсутствует\r\nПодстилка под бассейн отсутствует\r\nВес в упаковке 3.2 кг
4	Best Way	brands/mqdefault.jpg	
5	Us Medica Pilot	brands/6b48af12e89b962fa1f5643afb24.jpeg	
6	Magic Massager	brands/WhatsApp_Image_2019-07-15_at_22.13.02_1.jpeg	
7	EMS TRAINER 3 patch	brands/2636.800.jpg	
9	Unbranded	brands/Без_названия_2_s0QjxAB.jpg	
10	iSmoozi	brands/Без_названия_5.jpg	
11	Intex	brands/images_3.jpg	
12	К 18	brands/77c281fa32e3b85f6c0ba0130e9a.jpeg	
13	USB Desk Fan	brands/Без_названия_44.jpg	
14	JFMC01	brands/Без_названия_48.jpg	
15	WF03	brands/Без_названия_49.jpg	
16	BONA V-55	brands/Без_названия_50.jpg	
17	61LA	brands/Без_названия_51.jpg	
\.


--
-- Data for Name: products_brand_category_set; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_brand_category_set (id, brand_id, category_id) FROM stdin;
1	2	4
2	4	6
3	5	7
4	6	7
5	7	7
6	9	4
7	10	4
8	11	4
9	12	10
10	13	10
11	14	7
12	15	4
13	16	4
14	17	4
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_category (id, name, image, slug) FROM stdin;
4	Товары для дома	categories/WhatsApp_Image_2019-06-21_at_18.52.46.jpeg	tovary-dlia-doma
6	Надувные бассейны	categories/8099290ead4c41f56b3597a59d46f18a.jpg	naduvnye-basseiny
7	Товары для здоровья	categories/images_2.jpg	tovary-dlia-zdorovia
8	аксессуары	categories/Penguins.jpg	aksessuary
9	Надувные мебели	categories/Без_названия_10.jpg	naduvnye-mebeli
10	Электроника	categories/77c281fa32e3b85f6c0ba0130e9a.jpeg	elektronika
\.


--
-- Data for Name: products_color; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_color (id, name, image) FROM stdin;
1	Black	
2	red	
3	Pink	
4	Green	
5	Blue	colors/Мини_дорожный_утюг.jpg
6	oreng	
7	orenge	
8	белый	
\.


--
-- Data for Name: products_favourite; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_favourite (id, user_id) FROM stdin;
\.


--
-- Data for Name: products_favourite_products; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_favourite_products (id, favourite_id, product_id) FROM stdin;
\.


--
-- Data for Name: products_image; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_image (id, image, product_id) FROM stdin;
5	product-images/massajnaya_nakidka_sideniy.jpg	5
6	product-images/6b48af12e89b962fa1f5643afb24.jpeg	5
7	product-images/images_2.jpg	5
8	product-images/WhatsApp_Image_2019-07-15_at_22.13.02.jpeg	6
9	product-images/masajeador-relajador-magic-massager-7-en-1-puntas-D_NQ_NP_818176-MCO26535_jVsUk40.jpg	6
10	product-images/Без_названия_34.jpg	7
11	product-images/Без_названия.jpg	8
17	product-images/Мини_дорожный_утюг.jpg	15
18	product-images/Мини_дорожный_утюг_Evz7nVr.jpg	15
19	product-images/63567719_images_12175409680.jpg	16
20	product-images/2636.800.jpg	16
21	product-images/76571172_images_11383672536.jpg	16
22	product-images/Без_названия_3.jpg	17
23	product-images/Без_названия_4.jpg	17
24	product-images/Без_названия_1.jpg	17
25	product-images/Без_названия_2_kLkUyhI.jpg	17
26	product-images/1890954672_w640_h640_blender-portativnyj-blender.jpg	18
27	product-images/92619109_w640_h640_udobnyj-blender-dlya.jpg	18
28	product-images/Без_названия_5.jpg	18
29	product-images/68757_3.jpg	19
30	product-images/Без_названия_8.jpg	19
31	product-images/Без_названия_9.jpg	19
32	product-images/Без_названия_11.jpg	20
33	product-images/Без_названия_12.jpg	20
34	product-images/Без_названия_10.jpg	20
35	product-images/Без_названия_15.jpg	21
36	product-images/Без_названия_16.jpg	21
37	product-images/Без_названия_13.jpg	21
38	product-images/Без_названия_18.jpg	22
39	product-images/86214618_images_12084434184.jpg	22
40	product-images/Без_названия_17.jpg	22
41	product-images/Без_названия_19.jpg	23
42	product-images/Без_названия_20.jpg	23
43	product-images/Без_названия_21.jpg	23
44	product-images/images_3.jpg	24
45	product-images/images_4.jpg	24
46	product-images/Без_названия_23.jpg	24
47	product-images/Без_названия_26.jpg	26
48	product-images/Без_названия_27.jpg	26
49	product-images/Без_названия_28.jpg	26
50	product-images/Без_названия_29.jpg	27
51	product-images/images_5.jpg	27
52	product-images/Без_названия_30.jpg	27
53	product-images/Без_названия_32_YNdWHHO.jpg	28
54	product-images/Без_названия_31.jpg	28
55	product-images/Без_названия_32.jpg	28
56	product-images/Без_названия_33.jpg	29
57	product-images/images_6.jpg	29
58	product-images/images_7.jpg	29
59	product-images/semeinyi-naduvnoi-bassein-intex-58484-okean-305x183x56-sm-1065-B.jpg	7
60	product-images/Без_названия_35.jpg	7
61	product-images/Без_названия_36.jpg	30
62	product-images/Без_названия_37.jpg	30
63	product-images/Без_названия_38.jpg	30
64	product-images/Без_названия_39.jpg	31
65	product-images/Без_названия_40.jpg	31
66	product-images/Без_названия_41.jpg	31
67	product-images/Без_названия_42.jpg	25
68	product-images/Без_названия_43.jpg	25
69	product-images/77c281fa32e3b85f6c0ba0130e9a.jpeg	32
70	product-images/HTB1IPliKXXXXXccXFXXq6xXFXXXx.jpg	32
71	product-images/HTB18K.RJVXXXXXPaXXXq6xXFXXXs.jpg	32
72	product-images/Без_названия_44.jpg	33
73	product-images/Без_названия_45.jpg	33
74	product-images/images_8.jpg	33
75	product-images/Без_названия_46.jpg	34
76	product-images/Без_названия_47.jpg	34
77	product-images/Без_названия_48.jpg	34
78	product-images/images_9.jpg	34
79	product-images/images_10.jpg	34
80	product-images/images_11.jpg	35
81	product-images/Без_названия_49.jpg	35
82	product-images/Без_названия_50.jpg	36
83	product-images/V55.jpg	36
84	product-images/Без_названия_51.jpg	37
\.


--
-- Data for Name: products_order; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_order (id, first_name, last_name, email, address, phone, zip_code, subtotal, total, delivery, comment, date) FROM stdin;
1	naryn	bilmem	narynbeknur@gmail.com	56, Tynchtyk, Bishkek	+996559503500	\N	9950.00	9950.00	0		2019-07-18 02:10:05.292+00
2	soyuz	orozbek uulu	soyuzbek196.kg@gmail.com	adress	+(996) (559) 50 05 00	\N	8000.00	8000.00	0		2019-07-27 07:40:22.302+00
3	sanjar	Abdullaev	sanjar@mail.com	dordoi, 34	+(996) (555) 55 55 55	\N	5200.00	5200.00	0		2019-07-27 08:21:25.431+00
4	ati	atasi	pochta@mail.kg	6 microdistrict	+(996) (555) 55 55 55	\N	2600.00	2600.00	0		2019-07-27 10:56:26.289+00
5	soyuzbek	orozbek uulu	sldfkj@glkd.com	dfkdsjf, 23234	+(996) (535) 33 53 53	\N	8000.00	8000.00	0		2019-07-28 09:59:25.297+00
6	soyuzk	sof	soyuzbek196.kg@gmail.com	sdlfkjsdlfkj, sdflksdjf	+(996) (555) 55 55 55	\N	2100.00	2100.00	0		2019-08-05 06:57:38.023+00
\.


--
-- Data for Name: products_orderproduct; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_orderproduct (id, name, price, quantity, photo, order_id, prodid) FROM stdin;
1	Bir-mal	1990.00	5	/media/product-images/rsz_img_20180904_183241.jpg	1	\N
2	накидка массажная	4000.00	2	/media/product-images/%D0%91%D0%B5%D0%B7_%D0%BD%D0%B0%D0%B7%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F_2.jpg	2	3
3	Массажная накидка US Medica Pilot	5200.00	1	/media/product-images/massajnaya_nakidka_sideniy.jpg	3	5
4	Бассейн надувной 86×25 см	650.00	4	/media/product-images/%D0%91%D0%B5%D0%B7_%D0%BD%D0%B0%D0%B7%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F.jpg	4	8
5	накидка массажная	4000.00	2	/media/product-images/%D0%91%D0%B5%D0%B7_%D0%BD%D0%B0%D0%B7%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F_2.jpg	5	3
6	Массажер Magic Massager	2100.00	1	/media/product-images/WhatsApp_Image_2019-07-15_at_22.13.02.jpeg	6	6
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_product (id, name, description, price, discount, rating, status, brand_id, category_id, date, slug) FROM stdin;
5	Массажная накидка US Medica Pilot	Автомобильная массажная накидка US Medica Pilot\r\n — это универсальное устройство для комплексного воздействия на область плеч, лопаток, груди и бёдер. Температуру подогрева, уровень интенсивности и ритмический рисунок вибрации можно подобрать индивидуально. Удобный пульт с дисплеем создаёт комфортные условия для использования в дороге. Накидка работает от прикуривателя.	5200.00	0	0.00	В наличии	5	7	2019-07-27 03:06:04.063+00	massazhnaia-nakidka-us-medica-pilot
6	Массажер Magic Massager	Вибромассажер  предназначен для массажа мышц, суставов, акупунктурных точек с помощью регуляции силы вибрации с инфракрасным излучением. Массажер Magic Massager 8 In 1 является незаменимым инструментом, применяемым в косметологии, который применяют для массажа всех частей тела, таких как голова, плечи, спина, бедра, ягодицы, бедра, икры и ноги с 8 различными видами массажа!	2100.00	0	0.00	В наличии	6	7	2019-07-27 03:51:55.586+00	massazher-magic-massager
7	Надувной Бассейн Intex 305х183х56 См	Надувной детский бассейн Intex Семейный аквариум 58485 предназначен для купания детей. Сделан из прочного ПВХ материала. Стойкий солнечным лучам. Яркий дизайн и сочные цвета не оставят вас равнодушными. Безопасен в использовании. Материал бассейна состоит из прочного винила, толщиной 0.33 мм. Детский надувной бассейн "Семейный" с разноцветными внешними стенками и водоотводом в полу. Бассейн сделан из прочного винила, имеет 3 воздушные камеры с двойными клапанами.	2900.00	0	0.00	В наличии	3	6	2019-08-05 10:13:29.185+00	naduvnoi-bassein-intex-305kh183kh56-sm
8	Бассейн надувной 86×25 см	Детский бассейн с надувным дном Радуга позволит малышу освежиться в жаркий летний день в абсолютной безопасности. Мягкие стенки и дно защитят его от ударов, а глубина специально адаптирована для детей самого раннего возраста. Детский бассейн с надувным дном и яркой расцветкой станет прекрасным решением для летнего отдыха детворы. А если погода на улице не позволит малышам купаться, наполните его шариками для сухого бассейна. Надувные бассейны для детей Intex - лучшее место для летнего досуга ваших малышей!	650.00	0	0.00	В наличии	3	6	2019-07-27 04:16:59.635+00	bassein-naduvnoi-86x25-sm
11	Авто массажёр us medical pilot	Массажная накидка us medical pilot!!!\r\nКонструктивное и функциональное особенности!\r\n- компактность не большой вес.\r\n- 8 программа массажа.\r\n- оснащение функцией прогрева\r\n- автоматическое отключие через 30 мин\r\n- оснащение ремнями для крепления к спинке сиденья\r\n- комплектация пультом ду, оснащенным жк- дисплеем с подсветкой	5200.00	0	2.50	В наличии	2	7	2019-07-28 16:49:49.841+00	avto-massazhior-us-medical-pilot
12	Smart Fitness EMS toning	Как известно, при активных занятиях спортом наш организм запускает биохимические реакции, ведущие к формированию мышечного рельефа.\r\n Добиться аналогичного результата но без тренировок или в дополнение к ним поможет миостимулятор с говорящим названиям " Идеяльные кубики пресса" Smart Fitness Ems	2000.00	0	2.50	В наличии	1	7	2019-08-04 06:36:35.174+00	smart-fitness-ems-toning
15	Дорожный утюг!	Удобно и комфортно!\r\nНе занимает много мест!\r\n \r\nГод гарантия! Тел: 0501321111	650.00	0	2.00	В наличии	1	4	2019-08-04 08:26:17.674+00	dorozhnyi-utiug
16	Миостимулятор EMS TRAINER 3 patch	Лучший тренажер из линейки EMS! Новый процессор QH91 способен генерировать частоту импульсов таким образом, что они воздействуют не на ткани, а на нервные окончания, которые приводят в тонус мышцы и заставляют их тренироваться даже без вашего участия. Рефлекторные сокращения, глубокие и приятные "качки" мышечных волокон обеспечивают безупречный пампинг.\r\n    \r\n    Глубокий контроль мышц - вот что делает тренировку продуктивной, здесь контролем занимается процессор QH91 . Больше не нужны годы тренировок, чтобы научится правильно сокращать мускулы, разработчики и лучшие тренера уже все сделали сами. Достаточно просто приложить тренажер к любому участку тела, выбрать режим тренировки и весь опыт фитнес индустрии будет работать на тебя.\r\n    Это не только полезно, но и приятно! Заменяет массаж, снимает боль в мышцах, делает кожу более эластичной за счёт стимуляции самых мелких волокон.\r\n\r\nРазнообразие программ позволит:\r\n- тренироваться,\r\n- наслаждаться массажем,\r\n- сжигать подкожный жир,\r\n- держать мышцы в тонусе или наращивать их.\r\nРезультаты программы "тренировка" видны уже спустя 5 дней!\r\n\r\n- 6 режимов тренировки: от массажа и анти-целлюлитных программ до наращивания мускулатуры!\r\n- Имеет 3 пары электродных накладок, что позволяет одновременно тренировать все группы мышц брюшного пресса, талии, а в положении сзади - мышцы спины!\r\n- Два тренажера на два сектора воздействия (бицепсы, трицепсы, косые мышцы живота и т.д.). Отлично подходят для точечного массажа. \r\n- Cчитается профессиональным миостимулятором!\r\nВыполняйте упражнения во время чтения и домашних дел, в деловых поездках или даже в праздничные дни. \r\n\r\nEMS-trainer можно носить под одеждой, что облегчает тренировки, даже когда вы на работе или в куда-то идете. Все, что вам нужно сделать, это настроить тренажер под себя и позволить ему тренировать мышцы, чтобы помочь вам достичь еще более красивое телосложения.\r\n\r\nФУНКЦИИ ТРЕНАЖЕРА:\r\n- Ритмичное воздействие - снижает давления и снимает стрессы;\r\n- Глубокое действие - улучшает микроциркуляцию крови;\r\n- Тренировка - усиление нагрузки на мышцы;\r\n- Легкое покалывание - снимает боли и предотвращает усталость;\r\n- Длительное воздействие - восстанавливает эластичность кожи;\r\n- Массаж - для похудания и сжигания лишних калорий;\r\n\r\nХарактеристики:\r\n\r\nПитание: по 2 * AAA (не входит в комплект)\r\nРегулируемая интенсивность: 6 уровней;\r\nМощность: 9,8 mA;\r\nЧастота: 25 Гц;\r\nВремя непрерывной работы: 12 минут;\r\nРазмер: 19 х 17 х 0,2 см;\r\nЦвет: черный;\r\nВес: 50 г.	2000.00	0	0.00	В наличии	7	7	2019-08-05 02:43:55.11+00	miostimuliator-ems-trainer-3-patch
17	Менажница посуда для сухофруктов и конфетов	Менажница - посуда для сухофруктов, ореха, конфет и сладостей разделённое на несколько ячеек, позволяющее положить в одну тарелку разную еду, не смешивая её между собой. Необычный дизайн в виде цветка украсит ваш стол и удивит ваших гостей. Материал качественный пластик в розовом и голубом цвете. Модели одноуровневые и двухуровневые.	1300.00	0	0.00	В наличии	9	4	2019-08-05 03:23:01.009+00	menazhnitsa-posuda-dlia-sukhofruktov-i-konfetov
18	Портативный блендер для смузи	Свежеприготовленный смузи из фруктов, овощей, ягод и других ингредиентов – это очень полезный напиток для здоровья. Ведь в нём сохраняются все витамины, растительные волокна, минералы и при этом, всё быстро и легко усваивается пищеварительной системой.\r\nНе всегда есть время и возможность приготовить свежий смузи или вкусный полезный коктейль. Стационарный блендер с собой не возьмёшь, а уже приготовленный напиток с собой не возьмёшь, так как он быстро теряет вкус и полезные свойства. Теперь есть великолепное устройство!\r\n\r\nПортативный блендер для смузи - это идеальное устройство. Теперь не надо иметь стационарный большой блендер или миксер. В любом месте, на работе, в спортивном зале, в машине, на отдыхе, на пикнике, во время прогулки у вас есть возможность приготовить здоровый и вкусный смузи и вкусный коктейль. Осталось заполнить ингредиентами стакан и нажать кнопку.Буквально в течении одной минуты вкуснейший напиток готов.\r\n\r\nХарактеристики и комплектация блендера для смузи\r\n\r\nРазмеры высота 22см. диаметр 7,5 см.\r\n\r\nОбъём стакана  380 мл.\r\n\r\nЕмкость батареи 2000 mAh\r\n\r\nЦвет: жёлтый, зелёный и розовый ( при заказе указывайте цвет в комментарии к заказу)\r\n\r\nПолная зарядка аккумулятора 2 часа.\r\n\r\nПри полной зарядке, можно приготовить  30 полных стаканов напитка.\r\n\r\nВес блендера 370 грамм\r\n\r\nВес в упаковке 430 грамм..\r\n\r\nВ комплект входит блендер и шнур USB для зарядки.	1400.00	0	0.00	В наличии	10	4	2019-08-05 03:31:54.967+00	portativnyi-blender-dlia-smuzi
19	НАДУВНОЙ МАТРАС INTEX 68757 99Х191Х22	Надувной матрас Intex Classic Downy Bed 68757 - классическая модель, простой и экономичный вариант для дома или путешествий. Надувной матрас достаточно компактен в сложенном виде, что удобно для хранения и транспортировки.\r\n\r\n     Флокированное (напоминающее на ощупь бархат), плотное покрытие поверхности матраса удерживает постельное бельё от скатывания и сползания, а так же обеспечит приятные тактильные ощущения.\r\n\r\nОсновные характеристики:\r\n\r\nРазмеры: 99x191x22 см (Высота спального места: 22 см)\r\n\r\nМаксимальная нагрузка: 136 кг\r\n\r\nМатериал сверху: винил 0.52 мм с влагоустойчивым флокированным покрытием\r\n\r\nМатериал по бокам: винил 0.38 мм\r\n\r\nМатериал снизу: винил 0.38 мм	1800.00	0	0.00	В наличии	11	9	2019-08-05 12:32:10.443+00	naduvnoi-matras-intex-68757-99kh191kh22
20	Надувной матрас Bestway 67000	Надувной матрас Bestway 67000\r\n\r\n   Очень полезная и нужная вещь в доме ― это надувной матрац, кровать, диван или кресло. Они моментально решают вопрос с размещением нагрянувших родствеников или задержавшихся друзей. Удобные, мобильные, прочные и красивые, надувные предметы мебели всегда у Вас под рукой. Надувная мебель всегда выручит в сложной ситуации. При хранении такая мебель, в отличие от обычной, не занимает много места так как ее можно сдуть и сложить в небольшое отделение, подальше. \r\n\r\nОдноместный надувной матрас Bestway ― удобен и прост в использовании, что позволит вам без труда организовать дополнительное спальное место. \r\n\r\nХарактеристики:\r\n\r\nПроизводитель: Bestway (Китай)\r\n\r\nТип: матрас надувной\r\n\r\nНазначение: универсальное\r\n\r\nРазмер  185х76х22\r\n\r\nМаксимальная нагрузка: 200 кг\r\n\r\nЦвет: синий\r\n\r\nПреимущества товара:\r\n\r\nкачественные материалы\r\nуниверсальность\r\nлегкий вес	900.00	0	0.00	В наличии	4	9	2019-08-05 04:17:38.428+00	naduvnoi-matras-bestway-67000
21	Надувной матрас Bestway 67002	Полуторная модель матраса Bestway 67002 позволит воспользоваться ею в различных обстоятельствах дома, в офисе, на даче, во время путешествий, а так же по приезду неожиданных гостей. Кровать не занимает много места как в надутом виде, так и в собранном состоянии, при этом вполне способна разместить до двух человек. Благодаря небольшому размеру и весу матрас можно с уверенностью укладывать в дорожную поклажу, и со спокойной душой отправляться в путешествие, будучи уверенный, что комфортный и удобный отдых Вам обеспечен.\r\n\r\nКроме того, особая конструкция матраса, состоящая из продольных цилиндров позволяет поддерживать тело человека в правильном для него положении, делая Ваш сон максимально комфортным и полноценным. В матрасы данной серии встроены специальные клапаны , которые позволяют быстро накачивать и сдувать кровать при помощи любого насоса, который приобретается отдельно.	1650.00	0	0.00	В наличии	4	9	2019-08-05 04:25:04.846+00	naduvnoi-matras-bestway-67002
22	Надувной матрас Bestway 67374	Надувной матрас Bestway 67374  изготовлен﻿ из высокопрочного водонепроницаемого ПВХ, что позволяет его использовать в условиях отдыха на воде. Благодаря флокированному покрытию, кровать неприхотлива в уходе. После эксплуатации изделие достаточно протереть влажной тканью, высушить и сложить в исходное состояние.\r\n\r\n Данная модель надувной кровати выполнена в стильном темно-синем цвете, который дает ей возможность органично вписаться в современный интерьер. Покрытие матраса вызывает приятные ощущения при соприкосновении с телом. По своей структуре материал напоминает велюр, что позволяет постельному белью не скользить в процессе сна, а Ваш отдых наполнить приятными впечатлениями. \r\n\r\nХарактеристики и комплектация:\r\n\r\nПроизводитель: Bestway.\r\nСерия: Flocked Air Bed\r\nМатериал: прочный ПВХ - поливинилхлорид.\r\nТолщина материала: 0.38 мм.\r\nПокрытие: велюровое.\r\nКоличество мест: 2.\r\nДлина: 203 см.\r\nШирина: 152 см.\r\nВысота: 22.\r\nМаксимальная нагрузка: 210 кг.\r\nНасос: ручной входит в комплект.\r\nПодушки 2 шт\r\nВ комплекте: матрас, ручной насос, 2 надувные подушки\r\nУпаковка: картонная коробка.	2000.00	0	0.00	В наличии	4	9	2019-08-05 04:30:53.511+00	naduvnoi-matras-bestway-67374
23	Надувной матрас Bestway 67379	Надувной матрас Bestway Comfort Green Single 67379 - черный.\r\nОчень полезная и нужная вещь в доме - это надувной матрац, кровать, диван или кресло. Они моментально решают вопрос с размещением нагрянувших родствеников или задержавшихся друзей. Удобные, мобильные, прочные и красивые, надувные предметы мебели всегда у Вас под рукой. Надувная мебель всегда выручит в сложной ситуации. При хранении такая мебель, в отличие от обычной, не занимает много места так как ее можно сдуть и сложить в небольшое отделение, подальше. \r\n\r\nОдноместный надувной матрас Bestway - удобен и прост в использовании, что позволит вам без труда организовать дополнительное спальное место. Изготовлен из прочного водонепроницаемого винила, сверху покрыт мягким флокированным покрытием, напоминающим велюр, который не позволяет соскальзывать постельному белью. \r\nВы можете использовать этот матрас не только в помещении, но и с легкостью брать его с собой на природу, в поход, на море или туристическую поездку. Легко и компактно складывается для хранения и переноски.\r\n\r\nНадувной матрас спроектирован с инновационной внутренней системой поддержки, которая получена в результате уникальной технологии сварки швов вдоль и поперек надувного матраса.\r\nДанный тип конструкции позволяет снизить эффекты прогибания, проваливания и продольного колебания поверхности надувного матраса, поверхность матраса более жесткая. Клапан с универсальными переходниками позволяет подключать разные типы насосов (ручной, ножной, электрический). Насос приобретается отдельно!!!\r\n\r\nХарактеристики:\r\n\r\nПроизводитель: Bestway (Китай)\r\n\r\nТип: матрас надувной\r\n\r\nНазначение: универсальное\r\n\r\nМатериал: винил + флокированное покрытие \r\n\r\nМаксимальная нагрузка: 180 кг\r\n\r\nРазмеры спального места: 76х185 см\r\n\r\nВысота: 22 см\r\n\r\nЦвет: черный\r\n\r\nВес: 2,19 кг	950.00	0	0.00	В наличии	4	9	2019-08-05 08:34:07.304+00	naduvnoi-matras-bestway-67379
24	Надувной матрас Bestway 67407	Bestway 67407 отличается своей сверх прочностью материалов таких как винил и полиэстер, которые в свою очередь способны выдерживать сильные удары, растяжения, солнечный ультрафиолет, а так же обладают водоотталкивающими свойствами. Технология внутренней конструкции матраса Bestway 67407, является запатентованной технологией торговой марки Бествей, и представляет собой, расположенные внутри матраса перегородки в форме стаканов. Благодаря этому матрас Bestway 67407 приобретает ортопедический эффект. Верхний слой матраса покрыт флоком, что делает матрас Bestway 67407 приятным на ощупь, а также предотвращает соскальзывание простыней. Благодаря тому, что матрас компактно сворачивается в сдутом состоянии, у Вас не возникнет трудностей с его транспортировкой. В комплекте с матрасом Bestway 67407 насос не поставляется. Данный матрас отличается от других моделей, не обычным привлекательным светло-серым цветом.\r\n     \r\nХарактеристики Bestway 67407:\r\n\r\nМатериал: водонепроницаемый винил\r\n\r\nПрочность: высокая\r\n\r\nВерхний слой (покрытие): флокированное\r\n\r\nЦвет: Светло-серый\r\n\r\nНасос: приобретается отдельно.\r\n\r\nМаксимальная нагрузка: вес в 136 кг.\r\n\r\nКомплектация: Надувной матрас, ремкомплект.\r\n\r\nРазмеры:188х99х22 см.\r\n\r\nВес: 2.7 kg	1350.00	0	0.00	В наличии	4	9	2019-08-05 08:48:30.966+00	naduvnoi-matras-bestway-67407
25	Надувной матрас Bestway 67408	Надувной матрас Bestway 67408 – это удобный матрас для домашнего отдыха. Его можно использовать как на воде, так и дома. Он изготовлен из высококачественного и прочного ПВХ. Флокированное покрытие напоминает велюр, оно не даст постельному белью соскользнуть. Матрас компактен, он сдувается очень быстро и легко убирается в сумку или шкаф.\r\n\r\nОсновные характеристики\r\n\r\nЧисло мест 2\r\n\r\nРазмеры (ШxГxВ) 137x191x22 см\r\n\r\nЦвет серый\r\n\r\nМатериалПВХ+флок	1650.00	0	0.00	В наличии	4	9	2019-08-05 11:34:16.454+00	naduvnoi-matras-bestway-67408
26	Надувной матрас Bestway Camping Mattress 67016B	Надувной матерчатый матрас на одного двух человек серии Camping. Внутренняя структура матраса изготовлена по технологии I-BEAM CONSTRUCTION, поперечные перегородки сделаны из множества полиэфирных волокон, которые придают матрасу повышенную прочность и надежность. Наружная поверхность матраса выполнена из прочного rayon (разновидность вискозы).\r\nМатрас универсальный, его можно использовать как спальный матрас, так и взять на пляж и даже использовать для плавания. Матрас оснащен универсальным клапаном для накачивания и сдувания – подойдет любой тип насоса. В комплект насос не входит, приобретается отдельно.\r\nВ комплект входит специализированная самоклеющаяся заплатка для ремонта. \r\n\r\nХарактеристики\r\n\r\nСерия:  Camping\r\nРазмеры: 203х147 см\r\nМаксимальная нагрузка: 230 кг\r\nМатериал:    Высококачественный винил\r\nТолщина материала: 0.43/0.30 мм \r\nСпальных мест: односпальный/полутороспальный\r\nНасос приобретается отдельно\r\nВремя надувания:    100 секунд  \r\nВес: 3.34 кг	2300.00	0	0.00	В наличии	4	9	2019-08-05 09:00:22.541+00	naduvnoi-matras-bestway-camping-mattress-67016b
27	Надувной матрас Intex 58894	Надувной пляжный матрас с подушкой поможет сделать ваш отдых комфортным, увлекательным и интересным. Подголовник имеет особую структуру внутренних перегородок, с помощью которых расслабляются мышцы шеи. Изделие состоит из двух воздушных камер и будет держаться на плаву, даже если одна из них сдуется. С этим матрасом ваше лето станет незабываемым!\r\n\r\nКомплектация: матрас надувной с подголовником;\r\nремкомплект.\r\n\r\nХарактеристики:\r\n\r\n2 воздушные камеры. \r\nПрозрачный верх и матовое дно. \r\nМатериал: ПВХ. \r\nРазмер матраса: 188 см х 71 см. \r\nРазмер упаковки: 23 см х 8 см х 21 см. \r\nВес: 1,3 кг.	650.00	0	0.00	В наличии	4	9	2019-08-05 09:09:15.424+00	naduvnoi-matras-intex-58894
28	Надувной матрас Intex 66927 Downy Twin 99x191x22	Описание товара Особенности надувного матраса Intex 66927 Twin Downy Bed: модель выпускается со встроенным насосом; имеется клапан для ручного накачивания; модель – односпальная. Надувной матрас Intex 66927 Twin Downy Bed - это односпальный надувной матрас зелёного цвета с особо прочным водоотталкивающим покрытием. Изготовлен матрас из зелёного высококачественного ПВХ материала. Верхняя часть матраса Intex 66927 выполнена из флокированного материала, напоминающего велюр, который не позволяет скатываться постельному белью. Особенность матраса Intex 66927 Twin Downy Bed - это встроенный насос – «лягушка», благодаря которому, этот матрас является незаменимым в туристических походах, на природе, на даче. Надуть надувной матрас Intex 66927 Twin Downy Bed Вы можете с помощью насоса за несколько минут. Тем не менее, имеется встроенный клапан 2 In 1 для возможности накачивания матраса внешним насосом.\r\n\r\nХарактеристики\r\n\r\nРазмер                                  односпальный\r\nЦвет                                       зеленый\r\nКомплектацияматрас;      насос;\r\nГабариты                              99х191х22	1900.00	0	0.00	В наличии	11	9	2019-08-05 10:06:46.036+00	naduvnoi-matras-intex-66927-downy-twin-99x191x22
29	Надувной матрас Intex 68798 Кемпинг	Модель: Матрас INTEX 68798 \r\n\r\nРазмер: 72х189х20 см\r\n\r\nМаксимальная нагрузка: 136 кг\r\n\r\nЦвет: черный\r\n\r\nВес: 1,97 кг\r\n\r\nГабариты упаковки: 24 х 31 х 8 см\r\n\r\n\r\n\r\nОписание:\r\n\r\nКомпактность и очень лёгкий вес пожалуй главная особенность этого матраса.\r\n\r\nОн не займёт много места в рюкзаке туриста и будет не заменим в путешествии с палатками.\r\n\r\nВнутри матраса "Интекс" однокамерная конструкция с продольными перегородками.\r\n\r\nОн изготовлен из прочного непромокаемого, двухслойного ламинированного ПВХ.\r\n\r\nМатрас INTEX 68797, имеет клапан усовершенствованной конструкции, позволяющий его быстро надувать, и так же быстро сдувать.\r\n\r\nВ сложенном виде его можно с лёгкостью переносить без посторонней помощи.	1050.00	0	0.00	В наличии	11	9	2019-08-05 10:01:12.037+00	naduvnoi-matras-intex-68798-kemping
30	Кресло надувное Bestway 67277N Green	Надувное кресло-кровать BESTWAY 67277N для отдыха и сна.\r\n\r\nВ разложенном состоянии может использоваться как кровать для детей и подростков. \r\nСверху кресло покрыто специальным материалом - имитация велюра, что делает поверхность мягкой и приятной на ощупь. \r\nПриданию формы способствуют внутренние перегородки в виде стаканов, которые равномерно перераспределяют давление внутри кресла и делают поверхность более ровной и удобной для сидения и сна. \r\nМногофункциональное надувное кресло не теряет форму, всегда устойчиво и удобно.\r\n\r\nМаксимальная нагрузка: 120 кг\r\n\r\nРазмеры: 193x102x64 см	1950.00	0	0.00	В наличии	4	9	2019-08-05 11:18:57.676+00	kreslo-naduvnoe-bestway-67277n-green
31	Кресло надувное Bestway 67356N Orange black	Универсальная кровать-трансформер BestWay 67356 с насосом 220В позволит ее владельцам в действительности ощутить, что такое настоящая многофункциональность. Продуманная до малейших деталей конструкция надувного дивана делает его уникальным решением вопроса отдыха и комфорта в малогабаритной квартире или в загородном доме.В зависимости от потребностей кровать-трансформе может представлять собой диван, двуспальную кровать с изголовьем или без, шезлонг для двоих, а также высокую одноместную кровать. Прочный материал ПВХ и особая конструкция внутренних перегородок обеспечивает возможность выдерживать значительные нагрузки.Надуть кровать-трансформер не составит труда. Встроенный электронасос сделает это в считанные минуты.Особенности велюр-дивана Bestway 67356:в комплекте: диван, электрический насос 220 В, сумка для хранения;резьбовые клапаны для быстрого надувания/стравливания воздуха;удобная складывающаяся конструкция;электронасос Sidewinder, надувающий диван за 3 минуты;прочная нейлоновая сумка для транспортировки;максимальная нагрузка: 295 кг;размер в pазложенном виде: 188х152х64 см.	4900.00	0	0.00	В наличии	4	9	2019-08-05 11:26:03.107+00	kreslo-naduvnoe-bestway-67356n-orange-black
32	Ручной Мини Вентилятор	1. USB мини складной вентилятор, может быть использован как стол вентилятор, клип вентилятор, портативный ручной вентилятор. с вешалкой и металлический зажим может быть присоединен к зонтик, детские коляски, рабочий стол, палатки ect.\r\n2. Аккумуляторная батарея работает вентилятор, USB powered вентилятор поставляется с перезаряжаемые и сменный 2000MA 18650 Литий-Ионный аккумулятор, может быть поручена USB зарядное устройство, компьютер, power bank\r\n3. Unique портативный вентилятор дизайн, творческий стиль, изготовлен из высококачественного ABS, имеет прочную структуру и устойчивые к давлению\r\n4. multi-ступенчатая регулировка вентилятора блока питания, free to turn down или увеличить объем воздуха с бесступенчатой скорости технологии. эффективная мощность и преобразования схемы может свести к минимуму потери для экономии энергии и защиты окружающей среды\r\n5. Great путешествия вентиляторы для охлаждения или красоты в жаркую погоду деятельности, как солнечные ванны кемпинг	300.00	0	0.00	В наличии	12	10	2019-08-05 12:14:02.59+00	ruchnoi-mini-ventiliator
33	Настольный вентилятор USB Desk Fan	Настольный сверхтихий мини-вентилятор с питанием от USB\r\n\r\nВентилятор с двумя лопастями\r\nБольшой объем воздуха\r\nНастройка комфортного обдува\r\n2 скорости\r\nУгол наклона до 30 градусов\r\nПитание от USB\r\nБесшумная конструкция\r\n\r\nФункции:\r\n\r\nДвусторонние лопасти вентилятора\r\nРегулировка силы потока воздуха\r\nКонструкция с возможностью небольшого наклона\r\nАдаптер питания 5 В с USB-интерфейсом.	800.00	0	0.00	В наличии	13	10	2019-08-05 12:28:26.987+00	nastolnyi-ventiliator-usb-desk-fan
34	Массажная накидка JFMC01	Установите на кресло или автомобильное сиденье для глубокого массажа тела. Шиацу-массаж шеи и спины, а также вибромассаж ягодиц. 3D-ролики имитируют реальные движения рук массажиста. Управление пультом: выбор зоны, интенсивности вибрации, включение подогрева. \r\n\r\nФорм-фактор: накидка\r\n\r\nМатериал: искусственная кожа, текстиль, дышащая сетка\r\n\r\nТвердый каркас спинки\r\n\r\nЭластичный ремень для крепления на кресло\r\n\r\nОптимальный угол между спинкой и сиденьем: 105°\r\n\r\nВид массажа: Шиацу, вибромассаж\r\n\r\nОбласть массажа: шея, спина, поясница, ягодицы, задняя поверхность бедер\r\n\r\nСмена направления и выбор зоны массажа\r\n\r\nИнфракрасный подогрев\r\n\r\nВибромассаж: 3 уровня интенсивности\r\n\r\nАвтоматическое отключение: 15 минут\r\n\r\nУправление: пульт ДУ\r\n\r\nКармашек для пульта\r\n\r\nРазмеры: \r\n\r\nОбщая длина спинки: 780 мм (500 мм - под спину, 280 мм - подголовник)\r\n\r\nТолщина спинки без роликов: 80 мм\r\n\r\nТолщина подголовника: 130 мм (без роликов)\r\n\r\nШирина части под поясницу: 430 мм\r\n\r\nРазмер сиденья: 410 х 390 мм\r\n\r\nВес массажера: 7200 г\r\n\r\nВ комплекте:\r\n\r\nСетевое зарядное устройство\r\n\r\nАвтомобильное зарядное устройство	8900.00	0	0.00	В наличии	14	7	2019-08-06 06:30:05.943+00	massazhnaia-nakidka-jfmc01
35	Диспенсер кулерный WF03	Напольный диспенсер для воды, поможет Вам наливать воду в кружку из 19-литрового бутылки воды, но при этом охладит, либо нагреет воду, до оптимальной температуры, заданной заводскими характеристиками. Удобные краники "Нажим кружкой". Стильный черный  цвет с серебристой крышкой придаст изюминку в вашем дизайне (кухня, офис, помещение) В нижней части кулера предусмотрен шкафчик на 16л. для хранения непортящихся продуктов.	5400.00	0	0.00	В наличии	15	4	2019-08-06 06:48:12.541+00	dispenser-kulernyi-wf03
36	Диспенсер напольный BONA V-55	Bona V55 - Отличный аппарат с электронным охлаждением и нагревом. “Нажим кружкой”, с анти скользящими накладками на краники, что не даёт соскальзывать кружке при наборе воды с аппарата. Дизайн выполнен в довольно стильном варианте. Металлические стенки аппарата придают крепость кулеру. Усиленный штырь для прокалывания верхней части бутылки при установке на кулер. Внижней части аппарата предусмотрен шкафчик на 16л. для хранения непортящихся продуктов.	6200.00	0	0.00	В наличии	16	4	2019-08-06 06:56:19.773+00	dispenser-napolnyi-bona-v-55
37	Диспенсер кулерный 61LA	Напольный диспенсер для воды, поможет Вам наливать воду в кружку из 19-литрового бутылки воды, но при этом охладит, либо нагреет воду, до оптимальной температуры, заданной заводскими характеристиками. Удобные краники "Нажим кружкой". Стильный стальной цвет с чёрной крышкой придаст изюминку в вашем дизайне (кухня, офис, помещение) В нижней части кулера предусмотрен шкафчик на 16л. для хранения непортящихся продуктов.	6400.00	0	0.00	В наличии	17	4	2019-08-06 07:01:30.026+00	dispenser-kulernyi-61la
\.


--
-- Data for Name: products_product_color; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_product_color (id, product_id, color_id) FROM stdin;
1	5	1
2	6	1
3	7	1
4	8	2
5	11	1
6	12	1
7	15	5
8	16	1
9	17	3
10	18	2
11	19	5
12	20	1
13	20	5
14	21	5
15	22	1
16	22	5
17	23	1
18	23	5
19	24	1
20	24	5
21	25	1
22	25	5
23	26	1
24	26	5
25	27	1
26	27	3
27	27	5
28	28	4
29	29	1
30	29	5
31	30	4
32	30	5
33	31	7
34	32	4
35	33	1
36	33	4
37	33	7
38	34	1
39	35	1
40	36	8
41	37	8
\.


--
-- Data for Name: products_product_size; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_product_size (id, product_id, size_id) FROM stdin;
1	5	1
2	6	3
3	7	3
4	8	3
5	11	2
6	12	2
7	15	1
8	16	6
9	17	7
10	18	8
11	19	9
12	20	10
13	21	11
14	22	12
15	23	13
16	24	14
17	25	15
18	26	16
19	27	17
20	28	18
21	29	19
22	30	20
23	31	21
24	32	6
25	32	22
26	33	22
27	34	23
28	35	24
29	36	24
30	37	24
\.


--
-- Data for Name: products_review; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_review (id, name, email, rating, comment, product_id) FROM stdin;
\.


--
-- Data for Name: products_size; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.products_size (id, value, code) FROM stdin;
1	100x333	
2	XXL	
3	80х40	
4	green	01
5	XL	
6	19 х 17	
7	27х13	
8	22х7,5	
9	99х191	
10	185х76	
11	137x191	
12	152x203	
13	76х185	
14	188х99	
15	137x191	
16	203х147	
17	188 х 71	
18	99х191	
19	72х189	
20	193x102	
21	188х152	
22	20х10	
23	78х20	
24	32х92	
\.


--
-- Data for Name: users_email; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.users_email (id, email) FROM stdin;
2	batyrov.nurseit@mail.ru
3	soyuzbe3k196@gmail.com
4	soyuzbek@mail.com
\.


--
-- Data for Name: users_town; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.users_town (id, name, country) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.users_user (id, password, email, is_staff, is_superuser, is_active, last_login, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$u0V8coVfCpMq$5pn97VdxXrsXelv5ouvu/3yGOn8CsOpIhTuUJ7cYUas=	narynbeknurt@gmail.com	t	t	t	2019-09-02 19:15:26.848129+00	2019-07-17 07:15:27.293+00
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: users_userprofile; Type: TABLE DATA; Schema: public; Owner: soyuzbek
--

COPY public.users_userprofile (id, first_name, last_name, company_name, address, town_id, user_id) FROM stdin;
1	\N	\N	\N	\N	\N	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 156, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 49, true);


--
-- Name: meta_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.meta_tags_id_seq', 2, true);


--
-- Name: products_brand_category_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_brand_category_set_id_seq', 14, true);


--
-- Name: products_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_brand_id_seq', 17, true);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_category_id_seq', 10, true);


--
-- Name: products_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_color_id_seq', 8, true);


--
-- Name: products_favourite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_favourite_id_seq', 1, false);


--
-- Name: products_favourite_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_favourite_products_id_seq', 1, false);


--
-- Name: products_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_image_id_seq', 84, true);


--
-- Name: products_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_order_id_seq', 6, true);


--
-- Name: products_orderproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_orderproduct_id_seq', 6, true);


--
-- Name: products_product_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_product_color_id_seq', 41, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_product_id_seq', 37, true);


--
-- Name: products_product_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_product_size_id_seq', 30, true);


--
-- Name: products_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_review_id_seq', 1, false);


--
-- Name: products_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.products_size_id_seq', 24, true);


--
-- Name: users_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.users_email_id_seq', 4, true);


--
-- Name: users_town_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.users_town_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: users_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuzbek
--

SELECT pg_catalog.setval('public.users_userprofile_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: meta_tags meta_tags_content_type_id_object_id_3a764674_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.meta_tags
    ADD CONSTRAINT meta_tags_content_type_id_object_id_3a764674_uniq UNIQUE (content_type_id, object_id);


--
-- Name: meta_tags meta_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.meta_tags
    ADD CONSTRAINT meta_tags_pkey PRIMARY KEY (id);


--
-- Name: products_brand_category_set products_brand_category_set_brand_id_category_id_b219cd43_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand_category_set
    ADD CONSTRAINT products_brand_category_set_brand_id_category_id_b219cd43_uniq UNIQUE (brand_id, category_id);


--
-- Name: products_brand_category_set products_brand_category_set_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand_category_set
    ADD CONSTRAINT products_brand_category_set_pkey PRIMARY KEY (id);


--
-- Name: products_brand products_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_brand_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_color products_color_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_color
    ADD CONSTRAINT products_color_pkey PRIMARY KEY (id);


--
-- Name: products_favourite products_favourite_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite
    ADD CONSTRAINT products_favourite_pkey PRIMARY KEY (id);


--
-- Name: products_favourite_products products_favourite_produ_favourite_id_product_id_fd141d4d_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite_products
    ADD CONSTRAINT products_favourite_produ_favourite_id_product_id_fd141d4d_uniq UNIQUE (favourite_id, product_id);


--
-- Name: products_favourite_products products_favourite_products_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite_products
    ADD CONSTRAINT products_favourite_products_pkey PRIMARY KEY (id);


--
-- Name: products_image products_image_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_image
    ADD CONSTRAINT products_image_pkey PRIMARY KEY (id);


--
-- Name: products_order products_order_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_order
    ADD CONSTRAINT products_order_pkey PRIMARY KEY (id);


--
-- Name: products_orderproduct products_orderproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_orderproduct
    ADD CONSTRAINT products_orderproduct_pkey PRIMARY KEY (id);


--
-- Name: products_product_color products_product_color_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_color
    ADD CONSTRAINT products_product_color_pkey PRIMARY KEY (id);


--
-- Name: products_product_color products_product_color_product_id_color_id_45306f2c_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_color
    ADD CONSTRAINT products_product_color_product_id_color_id_45306f2c_uniq UNIQUE (product_id, color_id);


--
-- Name: products_product products_product_name_fa23bcd2_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_name_fa23bcd2_uniq UNIQUE (name);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product_size products_product_size_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_size
    ADD CONSTRAINT products_product_size_pkey PRIMARY KEY (id);


--
-- Name: products_product_size products_product_size_product_id_size_id_2405cad9_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_size
    ADD CONSTRAINT products_product_size_product_id_size_id_2405cad9_uniq UNIQUE (product_id, size_id);


--
-- Name: products_review products_review_email_139903ac_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_email_139903ac_uniq UNIQUE (email);


--
-- Name: products_review products_review_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_pkey PRIMARY KEY (id);


--
-- Name: products_size products_size_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_size
    ADD CONSTRAINT products_size_pkey PRIMARY KEY (id);


--
-- Name: users_email users_email_email_key; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_email_key UNIQUE (email);


--
-- Name: users_email users_email_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_pkey PRIMARY KEY (id);


--
-- Name: users_town users_town_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_town
    ADD CONSTRAINT users_town_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_userprofile users_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_pkey PRIMARY KEY (id);


--
-- Name: users_userprofile users_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: meta_tags_content_type_id_fd627f9d; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX meta_tags_content_type_id_fd627f9d ON public.meta_tags USING btree (content_type_id);


--
-- Name: products_brand_category_set_brand_id_15706cea; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_brand_category_set_brand_id_15706cea ON public.products_brand_category_set USING btree (brand_id);


--
-- Name: products_brand_category_set_category_id_620db058; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_brand_category_set_category_id_620db058 ON public.products_brand_category_set USING btree (category_id);


--
-- Name: products_category_slug_c558efae; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_category_slug_c558efae ON public.products_category USING btree (slug);


--
-- Name: products_category_slug_c558efae_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_category_slug_c558efae_like ON public.products_category USING btree (slug varchar_pattern_ops);


--
-- Name: products_favourite_products_favourite_id_0ee9b4ff; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_favourite_products_favourite_id_0ee9b4ff ON public.products_favourite_products USING btree (favourite_id);


--
-- Name: products_favourite_products_product_id_9340b746; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_favourite_products_product_id_9340b746 ON public.products_favourite_products USING btree (product_id);


--
-- Name: products_favourite_user_id_bb16613a; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_favourite_user_id_bb16613a ON public.products_favourite USING btree (user_id);


--
-- Name: products_image_product_id_978188e9; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_image_product_id_978188e9 ON public.products_image USING btree (product_id);


--
-- Name: products_orderproduct_order_id_57095287; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_orderproduct_order_id_57095287 ON public.products_orderproduct USING btree (order_id);


--
-- Name: products_product_brand_id_3e2e8fd1; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_brand_id_3e2e8fd1 ON public.products_product USING btree (brand_id);


--
-- Name: products_product_category_id_9b594869; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);


--
-- Name: products_product_color_color_id_d177b023; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_color_color_id_d177b023 ON public.products_product_color USING btree (color_id);


--
-- Name: products_product_color_product_id_b353c622; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_color_product_id_b353c622 ON public.products_product_color USING btree (product_id);


--
-- Name: products_product_name_fa23bcd2_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_name_fa23bcd2_like ON public.products_product USING btree (name varchar_pattern_ops);


--
-- Name: products_product_size_product_id_b45b11fd; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_size_product_id_b45b11fd ON public.products_product_size USING btree (product_id);


--
-- Name: products_product_size_size_id_bf8d2941; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_size_size_id_bf8d2941 ON public.products_product_size USING btree (size_id);


--
-- Name: products_product_slug_70d3148d; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_slug_70d3148d ON public.products_product USING btree (slug);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: products_review_email_139903ac_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_review_email_139903ac_like ON public.products_review USING btree (email varchar_pattern_ops);


--
-- Name: products_review_product_id_d933ffa7; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX products_review_product_id_d933ffa7 ON public.products_review USING btree (product_id);


--
-- Name: users_email_email_78829b7d_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_email_email_78829b7d_like ON public.users_email USING btree (email varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_userprofile_town_id_b82f5d02; Type: INDEX; Schema: public; Owner: soyuzbek
--

CREATE INDEX users_userprofile_town_id_b82f5d02 ON public.users_userprofile USING btree (town_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meta_tags meta_tags_content_type_id_fd627f9d_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.meta_tags
    ADD CONSTRAINT meta_tags_content_type_id_fd627f9d_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_brand_category_set products_brand_categ_brand_id_15706cea_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand_category_set
    ADD CONSTRAINT products_brand_categ_brand_id_15706cea_fk_products_ FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_brand_category_set products_brand_categ_category_id_620db058_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_brand_category_set
    ADD CONSTRAINT products_brand_categ_category_id_620db058_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_favourite_products products_favourite_p_favourite_id_0ee9b4ff_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite_products
    ADD CONSTRAINT products_favourite_p_favourite_id_0ee9b4ff_fk_products_ FOREIGN KEY (favourite_id) REFERENCES public.products_favourite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_favourite_products products_favourite_p_product_id_9340b746_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite_products
    ADD CONSTRAINT products_favourite_p_product_id_9340b746_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_favourite products_favourite_user_id_bb16613a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_favourite
    ADD CONSTRAINT products_favourite_user_id_bb16613a_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_image products_image_product_id_978188e9_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_image
    ADD CONSTRAINT products_image_product_id_978188e9_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_orderproduct products_orderproduct_order_id_57095287_fk_products_order_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_orderproduct
    ADD CONSTRAINT products_orderproduct_order_id_57095287_fk_products_order_id FOREIGN KEY (order_id) REFERENCES public.products_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_brand_id_3e2e8fd1_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_brand_id_3e2e8fd1_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_9b594869_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_color products_product_col_product_id_b353c622_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_color
    ADD CONSTRAINT products_product_col_product_id_b353c622_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_color products_product_color_color_id_d177b023_fk_products_color_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_color
    ADD CONSTRAINT products_product_color_color_id_d177b023_fk_products_color_id FOREIGN KEY (color_id) REFERENCES public.products_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_size products_product_siz_product_id_b45b11fd_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_size
    ADD CONSTRAINT products_product_siz_product_id_b45b11fd_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_size products_product_size_size_id_bf8d2941_fk_products_size_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_product_size
    ADD CONSTRAINT products_product_size_size_id_bf8d2941_fk_products_size_id FOREIGN KEY (size_id) REFERENCES public.products_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_product_id_d933ffa7_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_product_id_d933ffa7_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userprofile users_userprofile_town_id_b82f5d02_fk_users_town_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_town_id_b82f5d02_fk_users_town_id FOREIGN KEY (town_id) REFERENCES public.users_town(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userprofile users_userprofile_user_id_87251ef1_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuzbek
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_user_id_87251ef1_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

