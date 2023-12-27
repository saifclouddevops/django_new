--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Ubuntu 15.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: addapp_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addapp_account (
    id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.addapp_account OWNER TO postgres;

--
-- Name: addapp_account_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addapp_account_applications (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    members_id bigint NOT NULL
);


ALTER TABLE public.addapp_account_applications OWNER TO postgres;

--
-- Name: addapp_account_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addapp_account_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addapp_account_applications_id_seq OWNER TO postgres;

--
-- Name: addapp_account_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addapp_account_applications_id_seq OWNED BY public.addapp_account_applications.id;


--
-- Name: addapp_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addapp_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addapp_account_id_seq OWNER TO postgres;

--
-- Name: addapp_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addapp_account_id_seq OWNED BY public.addapp_account.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_cron_cronjoblock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_cron_cronjoblock (
    id bigint NOT NULL,
    job_name character varying(200) NOT NULL,
    locked boolean NOT NULL
);


ALTER TABLE public.django_cron_cronjoblock OWNER TO postgres;

--
-- Name: django_cron_cronjoblock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_cron_cronjoblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_cron_cronjoblock_id_seq OWNER TO postgres;

--
-- Name: django_cron_cronjoblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_cron_cronjoblock_id_seq OWNED BY public.django_cron_cronjoblock.id;


--
-- Name: django_cron_cronjoblog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_cron_cronjoblog (
    id bigint NOT NULL,
    code character varying(64) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    is_success boolean NOT NULL,
    message text NOT NULL,
    ran_at_time time without time zone
);


ALTER TABLE public.django_cron_cronjoblog OWNER TO postgres;

--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_cron_cronjoblog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_cron_cronjoblog_id_seq OWNER TO postgres;

--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_cron_cronjoblog_id_seq OWNED BY public.django_cron_cronjoblog.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: firstapp_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firstapp_members (
    id bigint NOT NULL,
    name character varying(130),
    domain character varying(30) NOT NULL,
    authentication_url character varying(1000),
    description text,
    logo_img character varying(100),
    server character varying(100),
    app_belongs character varying(20),
    based_on character varying(20),
    server_selection character varying(20),
    server_status_on character varying(20),
    is_active boolean NOT NULL
);


ALTER TABLE public.firstapp_members OWNER TO postgres;

--
-- Name: firstapp_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firstapp_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firstapp_members_id_seq OWNER TO postgres;

--
-- Name: firstapp_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firstapp_members_id_seq OWNED BY public.firstapp_members.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint,
    id_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    algorithm character varying(5) NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    code_challenge character varying(128) NOT NULL,
    code_challenge_method character varying(10) NOT NULL,
    nonce character varying(255) NOT NULL,
    claims text NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_idtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_idtoken (
    id bigint NOT NULL,
    jti uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    application_id bigint,
    user_id integer
);


ALTER TABLE public.oauth2_provider_idtoken OWNER TO postgres;

--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_idtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_idtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_idtoken_id_seq OWNED BY public.oauth2_provider_idtoken.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: sso_server_consumer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sso_server_consumer (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    private_key character varying(64) NOT NULL,
    public_key character varying(64) NOT NULL
);


ALTER TABLE public.sso_server_consumer OWNER TO postgres;

--
-- Name: sso_server_consumer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sso_server_consumer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sso_server_consumer_id_seq OWNER TO postgres;

--
-- Name: sso_server_consumer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sso_server_consumer_id_seq OWNED BY public.sso_server_consumer.id;


--
-- Name: sso_server_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sso_server_token (
    id bigint NOT NULL,
    request_token character varying(64) NOT NULL,
    access_token character varying(64) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    redirect_to character varying(1023) NOT NULL,
    consumer_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.sso_server_token OWNER TO postgres;

--
-- Name: sso_server_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sso_server_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sso_server_token_id_seq OWNER TO postgres;

--
-- Name: sso_server_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sso_server_token_id_seq OWNED BY public.sso_server_token.id;


--
-- Name: userlogin_myprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userlogin_myprofile (
    id bigint NOT NULL,
    first_name character varying(130),
    last_name character varying(130),
    email character varying(130),
    description text NOT NULL,
    company character varying(50),
    job character varying(50),
    country character varying(50),
    address character varying(255),
    phone character varying(50),
    twitter character varying(100),
    facebook character varying(100),
    instagram character varying(100),
    linkedin character varying(100),
    profile_img character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public.userlogin_myprofile OWNER TO postgres;

--
-- Name: userlogin_myprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userlogin_myprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userlogin_myprofile_id_seq OWNER TO postgres;

--
-- Name: userlogin_myprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userlogin_myprofile_id_seq OWNED BY public.userlogin_myprofile.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: addapp_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account ALTER COLUMN id SET DEFAULT nextval('public.addapp_account_id_seq'::regclass);


--
-- Name: addapp_account_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account_applications ALTER COLUMN id SET DEFAULT nextval('public.addapp_account_applications_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_cron_cronjoblock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_cron_cronjoblock ALTER COLUMN id SET DEFAULT nextval('public.django_cron_cronjoblock_id_seq'::regclass);


--
-- Name: django_cron_cronjoblog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_cron_cronjoblog ALTER COLUMN id SET DEFAULT nextval('public.django_cron_cronjoblog_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: firstapp_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firstapp_members ALTER COLUMN id SET DEFAULT nextval('public.firstapp_members_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_idtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_idtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_idtoken_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: sso_server_consumer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_consumer ALTER COLUMN id SET DEFAULT nextval('public.sso_server_consumer_id_seq'::regclass);


--
-- Name: sso_server_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_token ALTER COLUMN id SET DEFAULT nextval('public.sso_server_token_id_seq'::regclass);


--
-- Name: userlogin_myprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin_myprofile ALTER COLUMN id SET DEFAULT nextval('public.userlogin_myprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	userwebuser43@gmail.com	f	t	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: addapp_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addapp_account (id, user_id) FROM stdin;
1	2
14	1
22	33
24	35
27	38
30	43
\.


--
-- Data for Name: addapp_account_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addapp_account_applications (id, account_id, members_id) FROM stdin;
115	1	1
116	1	2
117	1	6
118	1	7
119	1	8
120	1	9
121	1	10
122	1	11
123	1	12
124	1	13
125	1	14
126	1	15
127	1	16
128	1	17
129	1	18
130	1	19
131	1	20
132	1	5
133	1	32
134	1	3
273	14	7
274	14	8
275	14	9
276	14	10
277	14	11
278	14	12
279	14	13
280	14	14
281	14	15
282	14	16
283	14	17
284	14	18
285	14	19
286	14	6
287	14	2
288	14	20
289	14	32
290	14	5
291	14	37
292	14	39
293	14	41
294	14	43
295	14	45
296	14	47
297	14	3
298	14	36
299	14	38
300	14	40
301	14	42
302	14	44
303	14	46
304	14	1
401	30	1
402	30	2
403	30	3
404	30	5
405	30	6
406	30	7
407	30	8
408	30	9
409	30	10
410	30	11
411	30	12
412	30	13
413	30	14
414	30	15
415	30	16
416	30	17
417	30	18
418	30	19
419	30	20
420	30	32
421	30	36
422	30	37
423	30	38
424	30	39
425	30	40
426	30	41
427	30	42
428	30	43
429	30	44
430	30	45
340	27	6
341	22	6
342	22	2
343	22	1
344	24	7
345	24	8
346	24	9
347	24	10
348	24	11
349	24	12
350	24	13
351	24	14
352	24	15
353	24	16
354	24	17
355	24	18
431	30	46
432	30	47
356	24	19
357	24	6
358	24	2
359	24	20
360	24	37
361	24	32
362	24	45
363	24	5
364	24	39
365	24	41
366	24	43
367	24	47
368	24	3
369	24	36
370	24	38
371	24	40
372	24	42
373	24	44
374	24	46
375	24	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add members	8	add_members
30	Can change members	8	change_members
31	Can delete members	8	delete_members
32	Can view members	8	view_members
33	Can add consumer	9	add_consumer
34	Can change consumer	9	change_consumer
35	Can delete consumer	9	delete_consumer
36	Can view consumer	9	view_consumer
37	Can add token	10	add_token
38	Can change token	10	change_token
39	Can delete token	10	delete_token
40	Can view token	10	view_token
41	Can add email address	11	add_emailaddress
42	Can change email address	11	change_emailaddress
43	Can delete email address	11	delete_emailaddress
44	Can view email address	11	view_emailaddress
45	Can add email confirmation	12	add_emailconfirmation
46	Can change email confirmation	12	change_emailconfirmation
47	Can delete email confirmation	12	delete_emailconfirmation
48	Can view email confirmation	12	view_emailconfirmation
49	Can add social account	13	add_socialaccount
50	Can change social account	13	change_socialaccount
51	Can delete social account	13	delete_socialaccount
52	Can view social account	13	view_socialaccount
53	Can add social application	14	add_socialapp
54	Can change social application	14	change_socialapp
55	Can delete social application	14	delete_socialapp
56	Can view social application	14	view_socialapp
57	Can add social application token	15	add_socialtoken
58	Can change social application token	15	change_socialtoken
59	Can delete social application token	15	delete_socialtoken
60	Can view social application token	15	view_socialtoken
61	Can add application	16	add_application
62	Can change application	16	change_application
63	Can delete application	16	delete_application
64	Can view application	16	view_application
65	Can add access token	17	add_accesstoken
66	Can change access token	17	change_accesstoken
67	Can delete access token	17	delete_accesstoken
68	Can view access token	17	view_accesstoken
69	Can add grant	18	add_grant
70	Can change grant	18	change_grant
71	Can delete grant	18	delete_grant
72	Can view grant	18	view_grant
73	Can add refresh token	19	add_refreshtoken
74	Can change refresh token	19	change_refreshtoken
75	Can delete refresh token	19	delete_refreshtoken
76	Can view refresh token	19	view_refreshtoken
77	Can add id token	20	add_idtoken
78	Can change id token	20	change_idtoken
79	Can delete id token	20	delete_idtoken
80	Can view id token	20	view_idtoken
81	Can add user	21	add_user
82	Can change user	21	change_user
83	Can delete user	21	delete_user
84	Can view user	21	view_user
85	Can add account	22	add_account
86	Can change account	22	change_account
87	Can delete account	22	delete_account
88	Can view account	22	view_account
89	Can add my profile	23	add_myprofile
90	Can change my profile	23	change_myprofile
91	Can delete my profile	23	delete_myprofile
92	Can view my profile	23	view_myprofile
93	Can add cron job log	24	add_cronjoblog
94	Can change cron job log	24	change_cronjoblog
95	Can delete cron job log	24	delete_cronjoblog
96	Can view cron job log	24	view_cronjoblog
97	Can add cron job lock	25	add_cronjoblock
98	Can change cron job lock	25	change_cronjoblock
99	Can delete cron job lock	25	delete_cronjoblock
100	Can view cron job lock	25	view_cronjoblock
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
33	pbkdf2_sha256$260000$xsQyX71LcwnKB4c0mDfWRR$gNYEZRloxFbQL3H3HkX3SdUpJcU1VqhCSSRxttpA8jk=	2023-05-17 16:07:02.479693+05:30	f	karthick.gp@ajaxmediatech.com	karthick	G P	karthick.gp@ajaxmediatech.com	t	t	2023-05-09 13:13:07+05:30
1	pbkdf2_sha256$260000$4edjDoEbQtTKaLrxC9bwgD$y65JwmfOwyEAvVYEQdsuuUNap6+xhG1Khyh9vzb/3mk=	2023-06-09 14:48:45.493461+05:30	t	webuser	webuser	primary	webuser@gmail.com	t	t	2023-03-08 11:37:38+05:30
38	pbkdf2_sha256$260000$197vzSySgoZknqyKNhd42f$6P10qSHDTpCcPt14ra76YKlDn/2lH9RxpAycxd3kKnM=	2023-08-07 11:27:59.909451+05:30	t	anusuya	anusuya	R	anusiya@ajaxmediatech.com	t	t	2023-05-11 17:27:25+05:30
43	pbkdf2_sha256$260000$r9VUJp0Jz77ZuF73i3eEEk$wrElVFWRvkjoZEY4ArBTA51tNW6Wv0GRTUG8j2hgI6w=	2023-08-07 16:04:48.849764+05:30	t	jmr@mcs.global				t	t	2023-08-07 15:56:55+05:30
44	pbkdf2_sha256$260000$a1lK5QUy9Rw87O4WFzSPYJ$ObU9YE255VOLgv4QXOLCHiQ497yCMcuO2ox6o54Njd4=	\N	t	sripriya				t	t	2023-08-07 16:07:42+05:30
35	pbkdf2_sha256$260000$ZlU7QOeONThVhew74ZQvPZ$mnaV0BhaZCyAwZsRbrtbpwT0Anl/zUyEr7YyFSMKwq0=	2023-05-17 12:41:55.146746+05:30	t	sanjaykumar@ajaxmediatech.com	sanjaykumar	-	sanjaykumar@ajaxmediatech.com	t	t	2023-05-09 15:24:08+05:30
2	pbkdf2_sha256$260000$XesvVSK6xbQQBQzwxy7QQ8$60gTOxpdy5fjSmXGdO5eQn4Dd+phOyPCnxJFAAjiRKs=	2023-09-11 12:00:26.797699+05:30	t	admin	-	-	admin@gmail.com	t	t	2023-03-09 11:22:41+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-03-08 13:39:24.796407+05:30	2	webuser	1	[{"added": {}}]	21	1
2	2023-03-08 16:02:25.724442+05:30	3	testuser	1	[{"added": {}}]	21	1
3	2023-03-09 11:23:18.157748+05:30	1	webuser	2	[{"changed": {"fields": ["password"]}}]	4	2
4	2023-03-13 12:30:02.161778+05:30	2	admin	2	[{"added": {"name": "account", "object": "Account object (1)"}}]	4	2
5	2023-03-13 12:39:16.755304+05:30	3	user1	3		4	2
6	2023-03-13 12:50:05.019449+05:30	4	user1	3		4	2
7	2023-03-14 13:04:51.686569+05:30	1	webuser	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	4	2
8	2023-03-20 13:41:37.023633+05:30	1	webuser	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}, {"added": {"name": "account", "object": "Account object (14)"}}]	4	2
9	2023-03-21 17:03:07.377468+05:30	24	user	2	[{"changed": {"fields": ["password"]}}]	4	2
10	2023-03-21 17:03:42.136241+05:30	24	user	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Superuser status"]}}, {"added": {"name": "account", "object": "Account object (15)"}}]	4	2
11	2023-03-21 17:51:59.917227+05:30	1	webuser	2	[{"changed": {"name": "account", "object": "Account object (14)", "fields": ["Applications"]}}]	4	1
12	2023-03-22 11:05:58.799606+05:30	25	newuser	1	[{"added": {}}, {"added": {"name": "account", "object": "Account object (16)"}}]	4	1
13	2023-03-22 11:06:48.145205+05:30	25	newuser	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Superuser status"]}}]	4	1
14	2023-03-22 11:07:22.145322+05:30	26	employee1	1	[{"added": {}}]	4	1
15	2023-03-22 11:07:36.470061+05:30	26	employee1	2	[{"added": {"name": "account", "object": "Account object (17)"}}]	4	1
16	2023-03-22 11:08:11.816737+05:30	26	employee1	2	[{"changed": {"fields": ["First name", "Email address", "Staff status", "Superuser status"]}}]	4	1
17	2023-05-09 10:48:21.064451+05:30	29	karthick@ajaxmediatech.com	1	[{"added": {}}, {"added": {"name": "account", "object": "Account object (20)"}}]	4	1
18	2023-05-09 10:53:18.847403+05:30	30	karthick.gp@ajaxmediatech.com	1	[{"added": {}}, {"added": {"name": "account", "object": "Account object (21)"}}]	4	1
19	2023-05-09 12:55:21.048558+05:30	29	karthick@ajaxmediatech.com	3		4	1
20	2023-05-09 12:55:39.706143+05:30	30	karthick.gp@ajaxmediatech.com	2	[]	4	1
21	2023-05-09 13:14:54.192163+05:30	33	karthick.gp@ajaxmediatech.com	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	4	1
22	2023-05-09 13:34:37.376548+05:30	31	g	3		4	1
23	2023-05-09 15:09:37.586364+05:30	34	g	2	[{"added": {"name": "account", "object": "Account object (23)"}}]	4	1
24	2023-05-09 15:19:14.859179+05:30	5	karthick.gp@ajaxmediatech.com	2	[{"changed": {"fields": ["User"]}}]	13	1
25	2023-05-09 15:19:28.693814+05:30	34	g	3		4	1
26	2023-05-09 15:24:08.968595+05:30	35	sanjaykumar@ajaxmediatech.com	1	[{"added": {}}]	4	1
27	2023-05-09 15:24:51.216753+05:30	6	sanjaykumar@ajaxmediatech.com	1	[{"added": {}}]	13	1
28	2023-05-09 15:26:30.951659+05:30	35	sanjaykumar@ajaxmediatech.com	2	[{"added": {"name": "account", "object": "Account object (24)"}}]	4	1
29	2023-05-09 16:27:06.130482+05:30	28	Anusuya	3		4	1
30	2023-05-09 16:27:06.156876+05:30	23	Customuser1	3		4	1
31	2023-05-09 16:27:06.165056+05:30	26	employee1	3		4	1
32	2023-05-09 16:27:06.173339+05:30	25	newuser	3		4	1
33	2023-05-09 16:27:06.181659+05:30	24	user	3		4	1
34	2023-05-09 16:27:06.190062+05:30	27	user1	3		4	1
35	2023-05-09 16:27:06.198462+05:30	15	user11	3		4	1
36	2023-05-09 16:27:06.206664+05:30	16	user14	3		4	1
37	2023-05-09 16:27:06.215077+05:30	17	user15	3		4	1
38	2023-05-09 16:27:06.223331+05:30	18	user16	3		4	1
39	2023-05-09 16:27:06.231734+05:30	19	user17	3		4	1
40	2023-05-09 16:27:06.239978+05:30	20	user18	3		4	1
41	2023-05-09 16:27:06.248853+05:30	21	user20	3		4	1
42	2023-05-09 16:27:06.256788+05:30	22	user212	3		4	1
43	2023-05-09 16:27:06.26514+05:30	32	user3	3		4	1
44	2023-05-11 17:20:53.315583+05:30	37	test	1	[{"added": {}}, {"added": {"name": "account", "object": "Account object (26)"}}]	4	1
45	2023-05-11 17:21:15.603958+05:30	37	test	3		4	1
46	2023-05-11 17:30:53.438304+05:30	7	anusuya	1	[{"added": {}}]	13	1
47	2023-05-12 14:29:59.387659+05:30	8	webuser	1	[{"added": {}}]	13	1
48	2023-05-12 15:42:13.638534+05:30	1	Djangocore	1	[{"added": {}}]	14	1
49	2023-05-12 15:42:21.089941+05:30	1	Djangocore	2	[]	14	1
50	2023-05-12 16:23:43.330912+05:30	2	http://192.168.51.111:8000/	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	7	1
51	2023-05-17 10:50:35.974263+05:30	39	user	3		4	1
52	2023-05-17 10:54:35.714453+05:30	40	user	3		4	1
53	2023-05-17 11:02:16.005503+05:30	1	webuser	2	[{"changed": {"fields": ["Uid"]}}]	13	1
54	2023-08-07 11:03:40.553333+05:30	41	user123	3		4	2
55	2023-08-07 11:17:05.620694+05:30	38	anusuya	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	4	2
56	2023-08-07 11:18:15.420643+05:30	38	anusuya	2	[]	4	2
57	2023-08-07 11:20:27.416271+05:30	42	TestUser	1	[{"added": {}}, {"added": {"name": "account", "object": "Account object (29)"}}]	4	2
58	2023-08-07 11:20:36.754638+05:30	42	TestUser	2	[]	4	2
59	2023-08-07 11:22:49.734111+05:30	42	TestUser	3		4	2
60	2023-08-07 15:56:55.762533+05:30	43	jmr@mcs.global	1	[{"added": {}}]	4	2
61	2023-08-07 15:57:19.813988+05:30	43	jmr@mcs.global	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}, {"added": {"name": "account", "object": "Account object (30)"}}]	4	2
62	2023-08-07 16:00:56.595002+05:30	11	jmr@mcs.global	1	[{"added": {}}]	13	2
63	2023-08-07 16:03:38.627448+05:30	43	jmr@mcs.global	2	[{"changed": {"fields": ["password"]}}]	4	2
64	2023-08-07 16:07:42.899479+05:30	44	sripriya	1	[{"added": {}}]	4	2
65	2023-08-07 16:07:53.896663+05:30	44	sripriya	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	4	2
66	2023-08-07 16:08:38.22608+05:30	12	sripriya	1	[{"added": {}}]	13	2
67	2023-09-09 14:11:49.462867+05:30	48	HCM Marine	1	[{"added": {}}]	8	2
68	2023-09-09 14:23:16.176063+05:30	48	HCM Marine	2	[{"changed": {"fields": ["Logo img"]}}]	8	2
69	2023-09-09 14:34:09.948911+05:30	3	Courts - amt	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
70	2023-09-09 14:34:55.114587+05:30	20	Asset Management System - amt	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
71	2023-09-09 14:35:23.850629+05:30	18	Keyclock SSO - amt	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
72	2023-09-09 14:38:37.096343+05:30	18	Keyclock SSO - amt	2	[]	8	2
73	2023-09-09 14:38:56.117374+05:30	5	Keyclock SSO - ajax	2	[{"changed": {"fields": ["Is active"]}}]	8	2
74	2023-09-09 14:40:03.849263+05:30	6	AJAX PMS - amt	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
75	2023-09-09 14:40:49.60027+05:30	32	AJAX PAYROLL - amt	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
76	2023-09-09 14:41:20.44504+05:30	19	Superset Dashboard - amt	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
77	2023-09-09 14:42:01.703954+05:30	2	VVmarine - vvmarine	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
78	2023-09-09 14:47:03.456258+05:30	49	Marine Harvesting - vvmarine	1	[{"added": {}}]	8	2
79	2023-09-09 14:49:07.524594+05:30	14	SL MCS Account - mcs_sl	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
80	2023-09-09 14:49:59.96733+05:30	12	VVPAINTS - vvpaints	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
81	2023-09-09 14:51:30.786884+05:30	15	MCS CRM - ERPNext - mcs_global	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
82	2023-09-09 14:52:12.457152+05:30	16	MCS ERP - ERPNext - mcs_global	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
83	2023-09-09 14:54:14.387342+05:30	17	Indtech PMS - mcs_global	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
84	2023-09-09 15:50:35.231614+05:30	1	VVSUGARS - ds_sugars	2	[{"changed": {"fields": ["App belongs"]}}]	8	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	firstapp	members
9	sso_server	consumer
10	sso_server	token
11	account	emailaddress
12	account	emailconfirmation
13	socialaccount	socialaccount
14	socialaccount	socialapp
15	socialaccount	socialtoken
16	oauth2_provider	application
17	oauth2_provider	accesstoken
18	oauth2_provider	grant
19	oauth2_provider	refreshtoken
20	oauth2_provider	idtoken
21	firstapp	user
22	addapp	account
23	userlogin	myprofile
24	django_cron	cronjoblog
25	django_cron	cronjoblock
\.


--
-- Data for Name: django_cron_cronjoblock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_cron_cronjoblock (id, job_name, locked) FROM stdin;
\.


--
-- Data for Name: django_cron_cronjoblog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_cron_cronjoblog (id, code, start_time, end_time, is_success, message, ran_at_time) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-03-08 11:33:54.815967+05:30
2	auth	0001_initial	2023-03-08 11:33:55.699924+05:30
3	account	0001_initial	2023-03-08 11:33:56.066838+05:30
4	account	0002_email_max_length	2023-03-08 11:33:56.091752+05:30
5	admin	0001_initial	2023-03-08 11:33:56.300424+05:30
6	admin	0002_logentry_remove_auto_add	2023-03-08 11:33:56.316579+05:30
7	admin	0003_logentry_add_action_flag_choices	2023-03-08 11:33:56.334885+05:30
8	contenttypes	0002_remove_content_type_name	2023-03-08 11:33:56.360188+05:30
9	auth	0002_alter_permission_name_max_length	2023-03-08 11:33:56.376449+05:30
10	auth	0003_alter_user_email_max_length	2023-03-08 11:33:56.391951+05:30
11	auth	0004_alter_user_username_opts	2023-03-08 11:33:56.408452+05:30
12	auth	0005_alter_user_last_login_null	2023-03-08 11:33:56.425295+05:30
13	auth	0006_require_contenttypes_0002	2023-03-08 11:33:56.433962+05:30
14	auth	0007_alter_validators_add_error_messages	2023-03-08 11:33:56.448832+05:30
15	auth	0008_alter_user_username_max_length	2023-03-08 11:33:56.496574+05:30
16	auth	0009_alter_user_last_name_max_length	2023-03-08 11:33:56.522295+05:30
17	auth	0010_alter_group_name_max_length	2023-03-08 11:33:56.539736+05:30
18	auth	0011_update_proxy_permissions	2023-03-08 11:33:56.555954+05:30
19	auth	0012_alter_user_first_name_max_length	2023-03-08 11:33:56.572168+05:30
20	firstapp	0001_initial	2023-03-08 11:33:56.655254+05:30
21	firstapp	0002_auto_20230210_0936	2023-03-08 11:33:56.678257+05:30
22	firstapp	0003_alter_members_logo_img	2023-03-08 11:33:56.685076+05:30
23	firstapp	0004_auto_20230217_0747	2023-03-08 11:33:56.698831+05:30
24	firstapp	0005_auto_20230217_1130	2023-03-08 11:33:56.71548+05:30
25	firstapp	0006_auto_20230217_1136	2023-03-08 11:33:56.735956+05:30
26	firstapp	0007_auto_20230217_1141	2023-03-08 11:33:56.747244+05:30
27	firstapp	0008_user	2023-03-08 11:33:57.509968+05:30
28	firstapp	0009_rename_access_apps_user_access_applications	2023-03-08 11:33:57.525121+05:30
29	firstapp	0010_delete_user	2023-03-08 11:33:57.538564+05:30
30	oauth2_provider	0001_initial	2023-03-08 11:33:58.80303+05:30
31	oauth2_provider	0002_auto_20190406_1805	2023-03-08 11:33:58.846737+05:30
32	oauth2_provider	0003_auto_20201211_1314	2023-03-08 11:33:58.86021+05:30
33	oauth2_provider	0004_auto_20200902_2022	2023-03-08 11:33:59.191943+05:30
34	oauth2_provider	0005_auto_20211222_2352	2023-03-08 11:33:59.311504+05:30
35	oauth2_provider	0006_alter_application_client_secret	2023-03-08 11:33:59.358784+05:30
36	sessions	0001_initial	2023-03-08 11:33:59.545183+05:30
37	sites	0001_initial	2023-03-08 11:33:59.585047+05:30
38	sites	0002_alter_domain_unique	2023-03-08 11:33:59.710913+05:30
39	socialaccount	0001_initial	2023-03-08 11:34:00.45483+05:30
40	socialaccount	0002_token_max_lengths	2023-03-08 11:34:00.544739+05:30
41	socialaccount	0003_extra_data_default_dict	2023-03-08 11:34:00.578182+05:30
42	sso_server	0001_initial	2023-03-08 11:34:01.196681+05:30
43	sso_server	0002_consumer_name_max_length	2023-03-08 11:34:01.209836+05:30
44	sso_server	0003_token_redirect_to_max_length	2023-03-08 11:34:01.268084+05:30
45	sso_server	0004_auto_20230124_0916	2023-03-08 11:34:02.451193+05:30
48	firstapp	0011_user	2023-03-08 12:00:35.734294+05:30
49	firstapp	0012_delete_user	2023-03-08 16:49:06.008+05:30
50	addapp	0001_initial	2023-03-10 13:42:59.507975+05:30
52	userlogin	0001_initial	2023-03-24 11:22:53.186707+05:30
53	userlogin	0002_delete_user	2023-03-24 11:22:53.209564+05:30
54	userlogin	0003_myprofile	2023-03-24 11:22:53.353477+05:30
55	django_cron	0001_initial	2023-09-09 13:52:22.253611+05:30
56	django_cron	0002_remove_max_length_from_CronJobLog_message	2023-09-09 13:52:22.265278+05:30
57	django_cron	0003_cronjoblock	2023-09-09 13:52:22.395681+05:30
58	django_cron	0004_auto_20230909_0821	2023-09-09 13:52:22.924789+05:30
59	firstapp	0013_auto_20230909_0821	2023-09-09 13:52:22.999058+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
fhkkiwa6kfkqhyzmbr141h9m1cjliiwo	.eJxVjMsOwiAURP-FtWl4tYA7_RFyuVwCsaGJwMr477amC13OmZnzYh5Gz340evoS2ZUpxy6_MAA-qB4NrOuBJ0DcRu3Td3PWbbrtiWovCL1s9X6-_lQZWt49BEJpctZENEppwQmClXrhiItCQ9yQlFpZBCMTNy7MCBJDEHFOMSbN3h_jAz0C:1pytnq:eW0zs9pbLMbEMIewzTvAvTe8Kf6IwBNwYiFY8DnoTRw	2023-05-16 18:00:18.596076+05:30
8v8kxezv25xt1zuo7lxhof3x73parog7	.eJxVjctuwyAQRX-lYtsETRgMmGX3-QY0PBzTOlAZR2lV9d-Lqyza5Zx75t4v5ui2ze7W0upyZJad2OEv8xTeUtmD-ErlUnmoZVuz57vCH2nj5xrT8vJw_xXM1Ob-bUgNXiqJXkUZSSk_RqP8pMaIKSSNHRoQcgpKoJi0NwMRahEmpCHq39KWWsu1uPTxntdPZuHA9olC19QX7snvVxcXaptb6iWXjgUIPAIeT_IJtMXRInAYwCj5DGAB2PcPpStSTg:1pbzax:i8zIkCN8tKmJtu3ikU2VK7klIWzQxE5uiJ_KDo7XALE	2023-03-28 13:31:19.100213+05:30
b16llhqkk0zmio19g6htnsjaqo08txow	.eJxVjMsOwiAQRf-FtSFQeQwu3fcbyDBMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJcxYXMYjT75aQHlx3kO9Yb01Sq-syJ7kr8qBdji3z83q4fwcFe_nWHsFwQgietR1YBQdoNZ9DyIaAaMrgkzIuK9DaaW-ZPbAFJGMnY7R4fwDfwjeS:1pciiZ:XlzDoCL3fuGDwiVKkDXSEpR2Uj2CLJtTAFojjPBYKV8	2023-03-30 13:42:11.433921+05:30
pt3cwi3ikdmjyaa4md8nf0464u79if35	.eJxVjctuwyAQRX-lYtsETXgZs-w-34AGGMe0DlTGUVpV_ffiKot2OeeeufeLebxts781Wn1OzLETO_xlAeMblT1Ir1gulcdatjUHviv8kTZ-romWl4f7r2DGNvdvi0YHZZQMJqmExoQxWRMmMyZJkQbZoQWhpmiEFNMQrEaUg4iTRJ2G39JGreVaPH285_WTOTiwfaLglfrCncJ-dXHBtvmlXnLpWICQR9BHGJ9AO6UcCC6UPenxGcABsO8fpYFSUw:1pwG97:USZbLqwPUSQjz33mNEzFcImmXq0whLsKBwDmwAQgU4o	2023-05-23 11:14:21.735854+05:30
e9eij8r07d3y9bceph1lumgwwcjrwwg3	.eJxVjctuwyAQRX-lYtsEjQEDZtl9vgEND8e0BCpjK62q_ntxlUW7nHPP3PtFLO7bYvcWV5sCMWQgp7_MoX-L5QjCK5Zrpb6WbU2OHgp9pI1eaoj55eH-K1iwLf1boxydkII7GURAKd0UtHSznAKPPireoQYmZi8ZZ7NyekTkivmZ4xjUb2mLraVabPx4T-snMXAix0TBW-wL9-iOq4sZ22ZzvabSMQPGzzCeYXoCaZg2XFE2MDaIZwAD0P2WtrivmZiy5_z9A594V7o:1pwGqH:-IaQTfYVS-2EPC8ahECLwS8E4qZzw2O-CkTtMsC5ejo	2023-05-23 11:58:57.26524+05:30
17vkcw27h85eehawkob1gu5sor170gj0	.eJxVjDsOwjAQRO_iGln-JP7QwUWs3fVKjogcCTtVxN3BKAWU82bmHSLB3kvaGz_TksVVWC0uvxCBHlxHA-s6sASiba9dfjdn3eTtk7j2haAvW72frz9VgVaGBwx78kgQVHbZxeCDUWizBUDWMzunVfTs0fjZEtnM04SsnEIOBqN4vQH7MD0B:1pwHYN:czfB4d_kxVd2CyjqO-DkJgC2Qxiw1ZMonybKZ_CT9V4	2023-05-23 12:44:31.287141+05:30
jeuyliq6hlhvza2ai3h9fy06jsb8z1my	.eJxVjUFSxCAQRa9isXWGYpqkk7B07xmoBjoTlAErJKWW5d0l1ix02e-__v9LWNq3xe6VVxuDMOIiTn-ZI__K-QjCC-Vrkb7kbY1OHoq8p1U-l8Dp6e7-K1ioLu17JOxdh512GLpAiG4KI7oZp6DZ86AbHBV0s0fQMA9u7In0AH7W1Ifht7RyrbFkyx9vcf0URp3EMZHpxm3hnd1xNTFR3Wwq15gbBgX6rPqzmh4UGn0xABJAI-KjUkap5te48b4mYfKe0vcPnz5Xuw:1pwGwp:Z24s8jRrGMbqQpXdB4CJ3RwWopv4Mfceq-vNF2wOGEw	2023-05-23 12:05:43.318372+05:30
xhpo4pdlpu41y8h5ajilv2wuz4rt4kt0	.eJxVjctuwyAQRX-lYtsEYd6w7D7fgIaHY1oClbGVVlX_vbjKol3OuWfu_UIO9m1xe0-ryxFZNKHTX-YhvKV6BPEV6rXh0Oq2Zo8PBT_Sji8tpvLycP8VLNCX8a1BCs8lZ15GHkFKb6KWfpYmshSSYgNqQvkcJGV0Vl4LAKZomBmIqH5Le-o9t-rSx3teP5ElJ3RMVLilsXBP_riGWKBvrrRrrgNTQtmZiDMxT4RbPlluMBVKm-mZEEvI8Hve0r4WZOteyvcPoPdXyg:1pwFAl:taBlJKZdeOwkFF7MIXV7j4BdUkRQaLwHEEP_7BfYjb8	2023-05-23 10:11:59.521072+05:30
hhjaorczxv8t8ojxmp8iq86w101y0w7y	.eJxVjctOwzAQRX8FeUtr-RGPEy_Z9xus8SONwbVRnKggxL_joC5gOeeeufeLWNy3xe4trjYFYggnp7_MoX-L5QjCK5Zrpb6WbU2OHgp9pI1eaoj55eH-K1iwLf17RFBugEE6CENAADeFEdwMU5DRRy07HJkYZg9Cilm7USFKLfwsUQX9W9pia6kWGz_e0_pJDDuRY6LgLfaFe3TH1cWMbbO5XlPpWDAhz0yeJX_izCgwaqJcARf6mTHDWPdb2uK-ZmLKnvP3D59OV70:1piCWP:o7Qc79tTzajDBO1h7_H8xKbWthBsh7TPbfPBwmMG_D4	2023-04-14 16:32:17.12652+05:30
cnsfun03pa0hb96hdqwxbtb688tiqa01	.eJxVjMEOwiAQRP-FsyHtAgW86Y-QXbqExoYmAifjv9uaHvQ4b2beSwTsLYde-RmWWVyFAnH5hYTxweVocF0PLDHGrZcmv5uzrvK2Jy5tidiWrdzP158qY827B2BSbEEbS6RoSH52E4xaGeN9SskSWg-WEkdHZmAEPU7gHLtI6LVi8f4Aza08YQ:1pwHac:XwzfYhTIgN-0DHGF-hh8Erae4tI58R0I7FG72CYjDvs	2023-05-23 12:46:50.288712+05:30
y4sqyoxxaj7m6rt24vw5d1irizxwuvwb	.eJxVj81uwyAQhF-l4toELRibn2PvfQa0hk1MS6AyttQo6rsXSzm0x5n5dkb7YB73bfF7o9WnyByT7PTXmzF8UjmC-IHlWnmoZVvTzA-EP9PG32uk_PZk_xUs2JZ-rdEomtFYTWKUBHYyOAoarI0qmBAu0egZ1BTBCDEJPRJpQ6PBoMaLUuIobdRaqsXT91da78zBiR0TBW_UFzDeUulYxrb5XK9d9G9ADmcYzlK_wOTAukFwK6QC9QrgADrf0kb7mpkre84_v2vRVeg:1pjCAN:QJR4k-XZQmxyYOBMqJZI5HYqry8ofPOFOMZEQJQB-Rs	2023-04-17 10:21:39.515184+05:30
h603feuigtrg9gofrm46i9ja8mavheow	.eJxVjUFSxCAQRa9isXUm1dIJEJbu5wxUEzoTFMEKSY2W5d0l1ix02e-__v9LONq3xe2VVxeDsOJJnP4yT9Mr5yMIL5SvpZtK3tbou0Pp7mntLiVwer67_woWqkv7NqQG36sevQp9IKX8GIzysxoD8sQaGzQg-3lSEuWsvRmIUMtpRhqC_i2tXGss2fHHe1w_hYWTOCYyvXFbuLE_riYmqptL5RpzwxIknmE4w_gAyvZgETscDI76EcACNL_Gjfc1CZv3lL5_AKCLV8c:1pwH1a:Srd9ufRl4AfY_Mv1fXQ0yyjU80_Zuud2CyVI63RV5nw	2023-05-23 12:10:38.589715+05:30
1kqjaj8gitcj1gpukanh7qeienkv734x	.eJxVjctuwjAQRX-l8rZgTfzGS_Z8gzV-hLgNNoqDaFX133EQi3Y5556594c4vK2Tu7W0uByJJQPZ_WUew2cqWxA_sJwrDbWsS_Z0U-grbfRUY5qPL_dfwYRt6t8GlfRCCe5VFBGV8odolB_VIfIUkuYdGmBiDIpxNmpvJCLXLIwcZdTP0pZay7W49HXNyzexsCPbRMFL6gv35LerizO21c31nEvHDBjfg9gP5g20lcxKSWGQRsA7gAUgvw-lkFJQ:1pog9x:9jf5xw4oXThdlMMd3a8GOxLZkpyuEQYMWOejfjk8L4U	2023-05-02 13:23:53.316245+05:30
pkfstx1rszocsps8349vpq7bh9zkpwmx	.eJxVjUFuwyAQRa9SsW2CJoAxZpl9zoAGGMe0DkTGUVpVvXtwlEW7nPff_P_DHN7Wyd0qLS5FZtmB7f4yj-GT8hbED8znwkPJ65I83xT-Sis_lUjz8eX-K5iwTu3boO680kp6HVVErf0QjfajHqKkQL1s0IBQY9BCirH3pkOUvQijxC72z9JKtaaSHX1d0_LNLOzYNpHxQm3hTn67mjhjXd1czik3LEDIPci9OLxBZ6W2wnCjjBngHcACsN8HpcFSXA:1peWUU:P3DJXo6sjQ_D4C5LyU8v9_O094JmySZ_yT9j5HIh13E	2023-04-04 13:03:06.266169+05:30
rzllzaeqieju872oj86vsaffu3scr672	.eJxVjDsOwjAQRO_iGln-JP7QwUWs3fVKjogcCTtVxN3BKAWU82bmHSLB3kvaGz_TksVVWC0uvxCBHlxHA-s6sASiba9dfjdn3eTtk7j2haAvW72frz9VgVaGBwx78kgQVHbZxeCDUWizBUDWMzunVfTs0fjZEtnM04SsnEIOBqN4vQH7MD0B:1pwHjq:PUuL7EJ_SVg9CsK_r-XuuaqqboI2eEgJedZI6GtkLMw	2023-05-23 12:56:22.356631+05:30
ujm2oea9ixj32d8mlbb8rlsudii4hbs1	.eJxVjctOwzAQRX8FeUtrTfyOl-z5Bmv8SGNIbRSnAlT13-tUXcByzj1z75U4vGyzu7S0uhyJJQM5_GUew2cqexA_sJwqDbVsa_Z0V-gzbfS9xrS8Pd1_BTO2uX8bVNILJbhXUURUyo_RKD-pMfIUkuYdGmBiCopxNmlvJCLXLEwcZdSP0pZay7W49POV119i4UD2iYLn1Be-k9-vLi7YNrfUUy4dM2D8COI4mBfQVgoLAx30KKR8BbAA5HYHpbhSVg:1pogge:chPY7I9Zglx84GrZgKh2G4g3n4f--JBoqFoV_cQRoV8	2023-05-02 13:57:40.112212+05:30
hi7bn93px1mwb2p2q93tznj2s0sgkgwy	.eJxVjDsOwjAQRO_iGln-JP7QwUWs3fVKjogcCTtVxN3BKAWU82bmHSLB3kvaGz_TksVVWC0uvxCBHlxHA-s6sASiba9dfjdn3eTtk7j2haAvW72frz9VgVaGBwx78kgQVHbZxeCDUWizBUDWMzunVfTs0fjZEtnM04SsnEIOBqN4vQH7MD0B:1pwHks:BfkPsBqRRoh-HintQIqL23zHXFltC3ltfLjwrLIykIo	2023-05-23 12:57:26.051887+05:30
hvxtyofmydo3yu4xnb8t9w5gfks3sxyc	.eJxVjctuwjAQRX-l8rZgTfzGS_Z8gzV-hLgNNoqDaFX133EQi3Y5556594c4vK2Tu7W0uByJJQPZ_WUew2cqWxA_sJwrDbWsS_Z0U-grbfRUY5qPL_dfwYRt6t8GlfRCCe5VFBGV8odolB_VIfIUkuYdGmBiDIpxNmpvJCLXLIwcZdTP0pZay7W49HXNyzexsCPbRMFL6gv35LerizO21c31nEvHDBjfg9yDeANjB20Fo5KxQcE7gAUgvw-lCFJI:1puq08:wuu6TkPTXnE65miSEvlX1O43s0HaVEVR02VfqEH7ry8	2023-05-19 13:07:12.522962+05:30
wzelf5qtmva40rvws6fwcwxdkdzzr1yp	.eJxVjDsOwjAQRO_iGln-JP7QwUWs3fVKjogcCTtVxN3BKAWU82bmHSLB3kvaGz_TksVVWC0uvxCBHlxHA-s6sASiba9dfjdn3eTtk7j2haAvW72frz9VgVaGBwx78kgQVHbZxeCDUWizBUDWMzunVfTs0fjZEtnM04SsnEIOBqN4vQH7MD0B:1pwI4A:St2h6lhOB6Ejet8yfCWlRqj_giSjfOkiOnmis48HEkQ	2023-05-23 13:17:22.784645+05:30
3znq38dusxhve7nm0znj556gqh5tcqtc	.eJxVjMsOwiAQRf-FtSHKY6Au3fcbyAwDUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcJhZXcRGnX0YYn6nugh9Y703GVpd5Irkn8rBdjo3T63a0fwcFe9nWHsGSAaMJ2DAC0MAeKMPAOsXk9Ab9WZkcQWmVHXmLqJ2KWaNlx-LzBfBgOG8:1pwIK7:edbj-lWCl7X-70ZqEGiyUQ1uQSEc71PW-Rr1WUsorSM	2023-05-23 13:33:51.140006+05:30
00li5ppd1sm30drdy7juhtlkmfsphtwh	.eJxVjMsOwiAQRf-FtSHKY6Au3fcbyAwDUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcJhZXcRGnX0YYn6nugh9Y703GVpd5Irkn8rBdjo3T63a0fwcFe9nWHsGSAaMJ2DAC0MAeKMPAOsXk9Ab9WZkcQWmVHXmLqJ2KWaNlx-LzBfBgOG8:1pwJAH:kwdoZFBdouDR7XDIpoiVV3jvz5f1AF1g7HEnYAaVwec	2023-05-23 14:27:45.299659+05:30
pnurjol25v7v2q1mpm7vw6xk4nfktlk4	.eJxVjM0OwiAQhN-FsyH8lS7e9EXIdqGB2NBE4GR8d6npQec2883Mi3nsLfle49PnwK5MG3b5DRekRywHwW07Yo5Eey-Nfzsnrvw2XCwtE7a8l_u5-rtKWNP4kUOrsFYSqKAs6NU6J0mQBgpiMIxIztAEzgUryACSnhdUk5yDAcXeH8M_O-U:1pwJCT:gXWc2hHwGZiuqLE_J5_0EeCRVzaYO87GvTiRXVHpijo	2023-05-23 14:30:01.401107+05:30
rnrwy22v8prrzywzt4a4q02p3rohfhs9	.eJxVjbtuwzAMRf9FaxuDelm2t_YbugsURcduDQmNpCnIv1cuMrQAl_vguXfhsdXNt8I3v0exCD2L179mQPridCZ4HKc9IFFuqQ6_nWdchreuONWdsO45vT-__qE2LFvnMEpteJ5cJKe1kcAYJmVGIBo1OQbHShk9ETq1gpuDJVQUgox2jXE1HRo_MV3zic7-yNfcqj-wVH_j78al9hEFSl_AXuT4IeVibb_BWjlL_QKwAIjHD4GIUWU:1pytHX:1hI3RaHz5nNvtYKgjqkLksBWvIHrMdYe_v0Ir8fLRFI	2023-05-16 17:26:55.610008+05:30
9sc2o2v9gizaoypsmhvnnuzepykyeslb	.eJxVzktOxDAMBuCroG6ZqfJ00u6YM7CPnEenhZKISSIWiLuTjCrELP3b_uzvwWAtq6k53Mzmh3mgw-l_ZtG9h9gbuO89HtG5VGMZ7zNHO48vrQqxbA7LluLl2HqgVsxrczSCtAIEt-CFRwA7eQ12gcnz4ILiLdSEicUB42xRVktErphbOEqvOurfMF5Tp5PZ0zXVYnbMxdzCZw25tCOMMH4m8kzVK4FZqJnRUUlKmX4mZCakIf2niB-hTX8F26sW3plGbvEBefpDQAk10QP5-QUf0WP1:1pzAwT:GeSKT-X39Q9RbpwefjIzG33RW17prnJigjb9Ews0ft4	2023-05-17 12:18:21.763334+05:30
70vgv7mguo5ow9e4pe1efxhsr9y6pfm5	.eJxVjrluwzAQRP-FrWNixSWXksr07twTy0NHIoiISFWG_z0S4sJp53gzD-F4r5PbS9rcHEUvGvHxrnkO32k9jfjF65hlyGvdZi_PiHy5Rd5yTMvnK_sPMHGZjnbLZLwmjZ6ijkzku9iSH6iLmEKyeIgtKD0EUqgG61vDjFaFAdlEe0L_Dpzo7JY85r26hUt1W_rZU6nHiAKFVzDXxt7B9Ah9QxK11h1eAHoA8fwFUupMzw:1pz9js:whO3bfNQJCP8Vw0rXzkWMBuE3EeqmukfNfNuzjNlB6k	2023-05-17 11:01:16.345933+05:30
m3o6dih4rlsulxxmg1dgxmg97100qu3e	.eJxVTz1vwyAQ_S-sSdBhgzkzds-WHZ3hEru1TGqwlKjqf0-QPLTr-34_wtNWRr9lXv0UhRONOP7FBgpfvFQiftJySzKkpazTIKtE7myW5xR5_ti1_wJGyuPbbQk1D4S9ZWUahr5DMorbvo86YAjXiHYA3UVApTplDbNFNkhBm6vWqoZmznlKi-fHfVqfwsFxH1Xrkp_TLW3Fz5SLX_l741zqH2jaE-BJ6QtY12oHVtp3PagDgAMQvy-cY1Mx:1qVS5X:hJKRtHfDvDyaEV6CrlV1N0iXA0kog_vAudP4vW8tU3Y	2023-08-28 13:04:07.710181+05:30
b2thq4mo6vk7joon4k5ll9gqzxsomczj	.eJxVjMsOwiAQRf-FtSHKY6Au3fcbyAwDUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcJhZXcRGnX0YYn6nugh9Y703GVpd5Irkn8rBdjo3T63a0fwcFe9nWHsGSAaMJ2DAC0MAeKMPAOsXk9Ab9WZkcQWmVHXmLqJ2KWaNlx-LzBfBgOG8:1pwJw1:6kVJx1uLZar0T1eaj9ccrw2ni77tJzh7D7Gy7LsJYCo	2023-05-23 15:17:05.042004+05:30
e5856kva84x0af842usxunm1ncok1asa	.eJxVz8FuwyAMBuBXmXJdGzlQB5Lb-gy7IxdMky0DrcBhmvbugyqaVomLf-PP8N0ZKnkxJfHNrK6bO6m7w__wQvadQ-vQtrW4J2tjCbm_39nbqX-pFYe8WsprDOd96oFaKC3VYZi8m_Q4aULrFNJgnXMnwMnKE4jRO8fCWq3Ig0TNymrWnj0IVIPGS0XdG4VrbHQ0W7zGks1GKZsbfxZOuS4RIOQR8DioV8C5HiF7LUdE_QwwA1SkvSnQB7evhZLKF9XwzlRyDQ_I0x-iAIVQO_LzC4NZZD4:1pz9Ln:yWVhQkUEGw7ym6oluP35m-b-Wuc9cJoHkQz0A2VbuOc	2023-05-17 10:36:23.850579+05:30
6c96asyp9f6lqnkq5tyggg4tpiwffdtv	.eJxVjMsOwiAURP-FtWl4tYA7_RFyuVwCsaGJwMr477amC13OmZnzYh5Gz340evoS2ZUpxy6_MAA-qB4NrOuBJ0DcRu3Td3PWbbrtiWovCL1s9X6-_lQZWt49BEJpctZENEppwQmClXrhiItCQ9yQlFpZBCMTNy7MCBJDEHFOMSbN3h_jAz0C:1pz9Xy:eFVyEUrG1bG7LIz_I1GRRuuqnYHKziQm2Lo4gPBFdd8	2023-05-17 10:48:58.73636+05:30
kd0mys07e5kxye8mlwuu9x0iz249a6u0	.eJxVjkFPxCAQhf-K4eouoQOlLUfv3ryTAabbuhW00Kgx_nfppgc3c5r33nxvfpjFrUx2y7TaOTDDGnb6rzn0V4q7EV4xXhL3KZZ1dnyP8MPN_DkFWp6O7B1gwjzV6x5165RW0umgAmrthtBrN-ohSPLUySr2AtToNUgYO9e3iLIDP0psQ3eDZsp5TtHS1_u8fjMjTsdTe12yS7qkrdgFc7ErfWyUSy0GAfIs2jOoFzEYpQx0HFSjG3gUwghRwfufEd-opj_J7VsVb5iKnOMd5OGAABe9rHNAfv8AeatmtQ:1q1l2h:N4YJ3Lc0fNpRGNtP-nnoevJk5keUEIVvkLxMODTuUg8	2023-06-07 15:14:27.242088+05:30
0qd0jqobj66ijn3hexpq7q1t5ks4bpzw	.eJxVT7lOxDAQ_Re37Fozie-Sno7emtizm0AUQ-xIIMS_g6UU0L77fYlIR5vjUXmPSxZBDOLyF5sovfLWifxC273IVLa2L5PsEnmyVT6VzOvjqf0XMFOdf92WnOKJnLeMemDwxpFGHr3PKrmUbtnZCZTJ4BANWs1sHWtHSembUthDK9e6lC3yx9uyf4oAl3NUrytxLfdytLhSbXHn94Nr639gGK_gr4jPYMIIQaE0MFg_PgAEAPH9A5vLUyw:1qfaRV:NG27kADTZVhVjLg3eYrp4QXN68fOlS1iDTNyRyGjLPY	2023-09-25 12:00:41.740962+05:30
4go6seafkbij2l4fxi9xf5xmo2jghw9j	.eJxVjrkSgjAURf8lrZJ5ZIWU9nb2mZeFRRkyklA5_rswUmh7l3Pvi1hcy2DXHBc7BmJITc6_mkP_iPNuhDvOfaI-zWUZHd0j9HAzvaYQp8uR_QMMmIet3aCSTijBnQoioFKuDY1ynWoDjz5qvokNMNF5xTjrtGskItfMdxxl0Dv0e2BHJzulPq3FTpiLXeJzjblsIwwYr0BWtb6BNAyMaGnNtJTyBGAAyPsDUxxM0g:1pz9aj:kc7atqYkj7pAy7VLqvnwG15Yd1P_zQZg0bIaa7lldUA	2023-05-17 10:51:49.128425+05:30
x14agzknavz4enmd2lgxa8uxkrapseqq	.eJxVjr1OxDAQhF8FueXOcvwfl_R09Nba3lwCwYY4ESDEu-McKbhyZ2a_mW_iYVtHv1Vc_JSIIx05_dcCxBfMu5GeIV8KjSWvyxToHqGHW-ljSTg_HNkbwAh1bN8WtApSSxF0kgm0Dn2yOgy6TwIjGtFEy7gcouaCDyZYBSAMj4MAlcwVWrHWqWSPn2_T8kUcOx2j9rri53Ip2-pnqKtf8H3DurZizrg4M3XuzBNTjksnFO1NZ624Z8wx1sD7zgyv2NIfGPariVdMQ075BnL3B-l6KhUX0h6Qn19-LmbC:1pz9eN:RxVc0Ao2iM-8_wl0QOhdHnBfoNNA8bFcjkNWsAJyqdc	2023-05-17 10:55:35.973647+05:30
dplcach7xlqw8q9hq2e14yp5kl9j4935	.eJxVjUtywyAQRO_C1rFqPMCAtEvOkD01fGTJUUHFwCqVu0dKeWEv-_XM6x_huLfF9Zrubo1iEhfx9sw8h6-Uj4K37cADh1B6bsP_zaOuw_ueUm5r4LaW_PH4elEtXJfdY5m0V6Skp6giE_kxWvIzjVGmkIzcoQVUcyCUOBtvNbM0GGbJOppDGm-cr-VQF7eVa-nNbVybu6fvnmrbRxBQnkGfL-YT9KT0hDiMCsjiCWACEL9_XqRRSA:1pz9yU:QkYoQdqfePwViIX04LqpV1ptq7byXhIlxTUQodWmm6U	2023-05-17 11:16:22.946313+05:30
dzembwpvj82wxcsrmz6a0m0zrvxfn9pu	.eJxVzs1OwzAMB_BXQb2yVV4-nKw39gzcI-eja6EkYknEAfHuJFOF2NF_2z_7ezBUy2JqDjez-mEaTsPhf2bJvYfYG7RtPR7JuVRjGe8zezuPL60KsayOypriZd96oBbKS3M0obQCBbfohSdEe_Ya7Yxnz4MLirdQAxOzQ8bZrKyWRFwxN3OSXnXUv1G8pk4ns6VrqsVslIu5hc8acmlHGDB-BHk8qVfAiYlJsBFBI6hngAmgIf2nSB-hTX8F26sW3plGrvEBefpDJFPtrR35-QUfbWPr:1pzAaY:1pQGZrxLDvyTkeYOtLptukNOWnsj3-vBNZnJeUyioho	2023-05-17 11:55:42.626045+05:30
9e3jq5t3vp09e5sm7v9bexaotpip84lz	.eJxVzktOxDAMBuCroG5hojTvdgdnYB85j07DhEQ0iVgg7k4yjASz9G_7s78mDa3uuhV_6OCmdZqnp_-ZAXvxaTQgxhEjsDa3VNF15tYu6LlXPtVgoYacXm5bd9QOZe-OAsENE4wa4ZgDIczilDCbWBz11kvaQ4UJ26wglGzSKA5AJbEbBe7kQN0bpHMedNYxn3OrOkKp-vAfzZfajxBM6Anz0yxfsViJWmeGqGRCsUeMV4w7Mn5K8O779Kc3o-rhlelkSHfIwy-COeIL5eQPKaH6dsRpTS3G7x8le2lm:1pzAdy:tEGR-mtiIdFXagnF0plpMRmugPT_KqtgjDyAMVAD16I	2023-05-17 11:59:14.375417+05:30
4kdrcwnyynvc9rjkrfrkt85o2x4e996z	.eJxVzsFOxCAQBuBXMb26S6YUypSjd2_eCYXpti6ClpK4Mb671DTGvc7_zzfz1RhbttmUTKtZfKObDpvT_-Fo3ZXinvhXGy-JuRS3dRnZXmFHmtlz8hSeju4dMNs8122CYfID9gNa6byStnXeewFycJ0A3k_eE3cOlZ2gk0jKIeFEE3CpWpTjjmbKeUnR0Of7st4aDafjqf1cMiFdUtlMsHkzK30Uyls9zIF3Z5DnVr2A0oJrMbC-7QSKRwANUOH9z2jfqLZtLLncbB3-MpVc4h3yUJGW6xYZdkqi_EPyslFZQ6NjCeH7BxYibIc:1pzBo9:Ie_l_75xOdWe6AY9lKEuNxBfjqmTaIBJxk072IOychk	2023-05-31 13:12:49.61433+05:30
qqzeuaznv85hsl54q54t2ijdcj304bap	.eJxVjs1uhCAUhV-lYdsZcgVRYTXpvs9gLnhVRsSJYDJN03cvJrNot-d85-eb9XjkuT8S7b0fmGFSsstf0aJbKJ7OcMc4bdxtMe_e8hPhLzfxz22g8PFi_xXMmOaSxmoUzrW2VpVGZ-3YaZJ6aN3YAFrRVNSOKIVSjRQWOu0k0ail6rTq6q6iszRRSn6LPT0ffv9iBi7snIi4UllYcM-zdwufHje843OlwWMmN5fLa4kHTLkP2-RjgQUIeQV1Bf0G2oAwteatVrKCdwADUPjkMx17YCYeIfz8AkviX-8:1pwJGU:1q-0JBmhlMRDiMuE46YFjt5Xre8NIHwojR-V-i7B-xI	2023-05-23 14:34:10.663896+05:30
x5vagpjcmpwkwageyckh8i55lhuvz3sj	.eJxVjrkSgjAURf8lrZJ5JOQFKO3t7DMvC4syZCShcvx3YaTQ9i7n3hcztObBrCksZvSsZSU7_2qW3CPMu-HvNPeRuzjnZbR8j_DDTfwafZguR_YPMFAatnZNqGyFlbToK0-ItvE12g4bL4MLWm5iDaLqHAopOm1rRSS1cJ0k5fUO_R7Y0dFMsY9rNhOlbJbwXEPK24gAIQtQRalvoFop2hK51lCK5gTQArD3B1MOTNA:1pz9lo:te1nLsj1hImwIPP9hKMAI3MXoGiV1QUT0EBE5ER4U6A	2023-05-17 11:03:16.771643+05:30
smsoc70pzw8a88mxgdyz1tjjqopzxt87	.eJxVjctuwyAQRX-lYtsEjcEeDMvu-w1oeDimdaAyjtoqyr8HR1m0yzn3zL1XZumyzfZS42pTYIZ17PCXOfKfMe9B-KB8KtyXvK3J8V3hz7Ty9xLi8vZ0_xXMVOf2PRIOrsdeOgx9IESnw4huQh1k9FHJBkcQ_eRRSDEpNw5EUgk_SRqCepTWWGsq2cafr7T-MgMHtk9kOse28B3dfjVxobrZpZxSbliAkEcYjh2-gDadMiC5FBq1fgUwAOx2B6YUUl8:1pyswT:eXliATZ1aUicOTV0N-laRbjTnaMaaCqF8N3y2FTkZ-Q	2023-05-16 17:05:09.904051+05:30
rpxt5z0wezsp2lnofbjtmom1v00y598z	.eJxVjk1ugzAQha9SedsEjScYMKuq-5zBGuNJMDEmwlhKFPXuNVIW7XLmfe_nJQzlbTQ58Wq8E704KXH4-7Q03DjuipsoXpdqWOK2elvtSPVWU3VeHIfvN_svYKQ0FndNZAEVK9mQtrXG1lllFcpmaNq6c4hDJ2toJXYaGmZondQXvKAlaR10e2jilPwSDT_ufn2KHg5ir4g0c2lIFCd63vJM6xdN9JjZedp4GMvkudgDpc2E5epjgRHwdAR1BP0hoQfsASpQ2ID8hHJD4ZPfOK9B9DGH8PMLuqZfOw:1pwKAW:uFqPbHEA1V_oeQFFzhMr1wONDMV3Y4czK7RyW_eBygE	2023-05-23 15:32:04.084352+05:30
r3xuvrcga8wznpi9se2utxkgawa9vja1	.eJxVzjtuwzAMBuCrFF7bCHrSsrfkDN0F6uHYjSuhkYQORe9eKfDQjPxJfuTPYLCW1dQc7mbzwzyw4e1_ZtHdQuwN3PceE3Qu1VjIY-ZoZ3JuVYhlc1i2FC_H1hO1Yl6boxGUlSCFBS89AtjJa7ALTF4EF0bRQk25XBxwwZfRaoUoRu4WgcqPHfUfGK-p08ns6ZpqMTvmYu7hq4Zc2hFOuThRdWLjO4WZTTPThE1SS_pK6UxpQ_pPET9Dm_4OtlctfDCN3OIT8nIgQLQCrvSB_P4BIj1j_w:1pzAVK:bFqzYRzz3jasx9qoCXKkCpdiZM3YKbgkW0tJDXAR-GQ	2023-05-17 11:50:18.195656+05:30
o40fc315n5udu3ozynncp7ko085fntrn	.eJxVz8FSxCAMBuBXcXrV7aRQ2tCbPoN3JgthW60wLnBwHN9d2OmM7jF_4Evy3RkqeTUl8dVsrls6id3T__BM9p1D69C-t7gna2MJub-9Odqpf64Vh7xZylsML8evO2qltFaHQXuncdJIyrpZ0WCdcyMobeUIYvLOsbAWZ_IgFfJskdGzB6HmAdW5ou6NwiU2Opo9XmLJZqeUzZU_C6dchwgQ8gTqNMyvMC5KLGLsNWI1HgEWgIq0nQJ9cDstlFS-qIY3ppJbuEMe_hCB0yQP5OcXg99kSg:1pz99F:nay4bkQRJQxNF2qveXbRMuhpUsZxv2K9rRiTC-FpOMU	2023-05-17 10:23:25.026352+05:30
3vd9cd22rdgmflgkv9552u6vujc1fh3n	.eJxVjrkOwjAQRP_FLcRafKydlPR09Nb6CAGiWMROhfh3EkEB7Rxv5skcLXVwS0mzu0bWsQPb_2qewj1NmxFvNF0yD3mq89XzLcK_buGnHNN4_Gb_AAOVYW1bQu0VKukxqkiIvo0WfY9tlCkkI1fRglB9QCFFb7zVRNKI0EvS0WzQz4ENnd2YL3mpbqRS3ZweSyp1HREgZAO6OZgzYKehUy1HawyaHUAHwF5vVDRM5g:1pzAzp:6ZH1L_j9zHkdoMFBsJi-Qh3ja3NU6Hy67UJgAN6Fscw	2023-05-17 12:21:49.69697+05:30
icfgwq2fpj9xkaqp3r80kd4k5bcd3r7c	.eJxVzjtuwzAMBuCrFF7bCLQelK0tOUN3gXo4duNKaCyjQ9G7Vwo8NCN_kh_501nay2z3Ld7tEjrT9d3b_8yRv8XUGrSuLWbkfd5TYY-Zo72xc61iKounsuR0ObaeqJm2uToDoXISpXAYZCBEN4YB3YRjENFHLWo4AJeTRy74pN2giITmfhKkgm5o-KB0zY3Ods3XvBe70lbsPX7tcSv1CAcuTqBOvX4HZYQ2gEyLHrR8BTAAFWk_JfqMdfo7ulbV8MFUcklPyEtD0MDI9CBQjgfy-wcftGP6:1pz9qU:zmb-4mopCCxSq4Erkb1L8PsbL4oKiPNYOJlKhfiXXuU	2023-05-17 11:08:06.744714+05:30
56syl30w2c7dnrlf69i0hea4p9uahxq7	.eJxVjMsOwiAURP-FtWl4tYA7_RFyuVwCsaGJwMr477amC13OmZnzYh5Gz340evoS2ZUpxy6_MAA-qB4NrOuBJ0DcRu3Td3PWbbrtiWovCL1s9X6-_lQZWt49BEJpctZENEppwQmClXrhiItCQ9yQlFpZBCMTNy7MCBJDEHFOMSbN3h_jAz0C:1pytGb:rwwYfGcj7Gkc63JtAa1lMcKekKYg7nK-KSTSk_fspu8	2023-05-16 17:25:57.276696+05:30
mqpolywnfae5n0jwnp22s7db3taor7xy	.eJxVkD9PwzAQxb8K8koanNhxnIwdEAtigA0h6_wnbWhqB9tRi6p-d-ySATbfu-ff3b0LCk6NMIFSbrFRhAjRoP79gqw5R9SjB1Sg2TtlQkjV5HajTUpQbk42lJ6wxL2YwcMxG9C1QK8nf9j57ZO2L4_oo0DiZlmC8WLUyVOhf5oEdTA2N_Qn2J0rlbPRj7LMlnLthvLZaTNtV-8_wB7CPv3mwBpJGSWSaaqBMdlpzuTAOk2MMi1JIsc1HRSrST20kjcApK3VQKDR7Q0a0pmjs8Kc59F_ox4X61J5nBPpfLdEMUGIwpuvxYQcUY1rssFsg7s33PUV72lbVlXDW36PcY9xAuc9LRxzZCcjc5XEG-Y30b-QuxXSlLQjlFUr5PoDrXiHNQ:1q7YGd:WsgYm4770uivdnmfOXFxutROukvu4YxXV05rM-4yWvg	2023-06-23 14:48:47.116587+05:30
0xjy95tx6nlk80wc98txshu4rybbuinh	.eJxVjM0OwiAQhN-FsyH8lS7e9EXIdqGB2NBE4GR8d6npQec2883Mi3nsLfle49PnwK5MG3b5DRekRywHwW07Yo5Eey-Nfzsnrvw2XCwtE7a8l_u5-rtKWNP4kUOrsFYSqKAs6NU6J0mQBgpiMIxIztAEzgUryACSnhdUk5yDAcXeH8M_O-U:1pwJWw:dxr9ZY9w0qYMvbPr0fQpRIVRKJtFr9s1PIf2Ka7qYts	2023-05-23 14:51:10.650276+05:30
70q4sj2rbmumhbzz1kvttxy95zilimyl	.eJxVjkFPxCAQhf-K4epuQ4FOW47evXknA0y31QpaaNQY_7uwaaJ7nPfefO99M4N7ns2eaDOLZ5q17PRfs-heKFTDP2O4xMbFkLfFNjXSHG5qHqOn9eHI3gBmTHP5HhA6q0BJC155BLCjH8BOMHpJjnpZxIELNTkQUky9HTpE2Qs3Sex8f4UmSmmJwdDn27J9Mc1Px6haF80aL3HPZsWUzUbvO6VcigUX8sy7cwtPbauV1Gps5NCBgnvONecFXHcGfKWS_iBbryJeMQW5hBvI3R9EjGJUB-TnF32GZsM:1pyt5p:ETafjgJXU6NrjXSIaRr0uU0-4Sz5K9j2rKMSVzM9a6A	2023-05-16 17:14:49.400092+05:30
pp2waze3hgjxrs4wauolln7bfgt6krs4	.eJxVj71OxDAQhF8FpeXOWjv-L-np6C3H3rsEcjbEjgRCvDs2SnGUOzP77ez34PxeZ7cX3NwSBzuw4XSvTT68YepGfPXpmknIqW7LRHqEHG4hzzni-nRk_wFmX-a2rbzmOHltFFLBEIzUXlAcjYk86BAuUasJuIygKZVUCUSlUWgfuLhwTju0YClLTg4_35fta7BwOkr1c9mt-Zr36lZfqtvwY8dS-z_AxjPoM6UvYCwoyxkBPYI2jwAWoIF7z-Rv2NI-3pbUpD9IA7bhHvEA0gpjGSVSKCblgfj5Bf9cZO4:1qUO7S:uMGvEXQmscZFrt6gUasLHpS8K2pENv3aCbgb6aOa4oY	2023-08-25 14:37:42.083779+05:30
sy1gu8opwzv0h5o6u0p3vbrm1ft8xmke	.eJxVz8FuwyAMBuBXmXLdigwJAXLbnmF35IJpsmagFThM0959UOWwHv0bPts_g8VaVlsz3ezmh2UY9fDyPzyju1LsHdz3HjN0LtVY2P3N0c7stVUUy-awbCm-Hb8eqBXz2hwCE7zRs9EonVcSufPeTyCNGycQc_CehHNaYYBRalJOkw4UQEjFtTw31H9gvKROJ7unS6rF7piLvdFXpVzaEAFiPIE8cfUOcuFqAcOAm5Y-AywADek7RfykflqsuX5jC-9MI7f4gDwdiGZmmmYwB_L7B4A-ZEA:1pz9XB:09kKqYOZc8LpkB0CDXPDkZdEH698M7cTF_vBU2M8C_8	2023-05-17 10:48:09.041396+05:30
k0ry3nqpnl941wklnkzggb9jnrrh1gvx	.eJxVjrtOxDAQRf_FLbuWnxPHJT3d9tbYnmwCUQyxIy1C_DsJSgHtPff1xQJubQxbpTVMmXkm2eWvFjG90XKA_IrLvfBUlrZOkR8WftLKX0qm-fn0_isYsY572iHYaMDoCNlkBIh9dhAH6LOmRJ3eRSeUGRIorYYuOouoO5UGjTZ3v6WVap3KEujxPq2fzIvLeeqYK2Eu97K1MGNtYaWPjWrbh5VQ-irsVcJNSm-VF5obK3tnn4TwQrDvH_lVVA0:1pytDn:emh0KotnpIbsbvkfcSeX06nPnpkqICjwOyNBz581hgs	2023-05-16 17:23:03.459661+05:30
yflxww5ndyst1wxkmj0vbfpyhhmltc2l	.eJxVjM0KgzAQBt8lZ5GNNX_e2hcJa7LB0DSCJr2UvntVpOBxZ76dD0Pn5pqLfdMSQyRv6YUxsSHXlJq_rSstbGC8Zw2zWMt0EBv9Bnu4whHdk_JuMKUdt2elPTanXtv7dlEu0WGJc36cX5fUhOu0dwR0nkskxxHBKNQoA7jReNERgIcgldKKSxFQe5TaCKCbl9wZpaTW7PsDd_tOFw:1pz9da:c70so1gckAjdecWmpfy8hqUwj483BAaXUDKW8ygiYrQ	2023-05-17 10:54:46.125408+05:30
kn1tpagyysysjqnw29pfci6kgzp14ipe	.eJxVjk9PxCAUxL-K4eou4X9bjt69eSdQXrcoghaIGuN3l24a4x7fzLzfzDcyttXVtAKbCR5pRNHpv-bs_AJpN_yzTZeM55zqFhzeI_hwC37MHuLDkb0BrLas_Xu0SjqhBHfKC2-VcpMflVvU5DnMMPAujoSJZVaMs2Vwo7SWD2xeuJV-uEILlBJyMvD5FrYvpMnpGLXXZRPzJbdqoi3VbPDeoNRezAjjZ6LOZHgik-ZMS4rlODLK7gnRhHTwvjPZV-jpD3D71cUrpiNDuoHcdQiTmgosKCWC_0FKqNC2iHRqMf78AqalbBk:1q6pX9:Tsdd03l4t70kL2FsOKm7aV-F-BlC0RPiuh-KwHUfqpg	2023-06-21 15:02:51.588676+05:30
2rk609ihzm2y9oldta5c72xa99ubfa2n	.eJxVj8FywyAMRH-l42sTRmAw4GPvufXOyKDEbhxojD3TTqf_Xmh9SI_aXT2tvhqH2zq6LdPiptD0jWgOj9qA_kqxGuEN4yUxn-K6TAOrEba7mZ1SoPllz_4DjJjHsq3RSBrQWE1cCQLbGVScWmuD9Mb7czB6ANkFMJx3XCsibUgZ9FKdpeQVminnKUVHH-_T8tn0cNhL1XPJzemSttXNmFe30H2jvNZ_QLRHMEcuX0H3XPStYLq1XNlngB6ggGvPiDcqaQy3KRbpF1KAZXhEPP0hhGS2NDdiR3z_AAArZPQ:1qVRke:Xcuw-ebCWI8AGZZftTE2BuAEDLvNafWXiu7DlLiXtRk	2023-08-28 12:42:32.739672+05:30
edcpp9r6ez2bvxwt6dq3efd2pzpc7km6	.eJxVzktywyAMBuCrdLxtw2AeAnuXnKF7Rjwcu3FhGmC66PTuhYwXzVK_pE_6GQzWspqaw91sfpiHcXj7n1l0txB7A_e9xwSdSzUW8pg52pmcWxVi2RyWLcXLsfVErZjX5mgEaQUIbsELjwB28hrsApPnwQXFW6gpE4sDxtmirJaIXDG3cJReddR_YLymTiezp2uqxeyYi7mHrxpyaUcYZfxE5WlU7xRmIecRCAit9PRK6UxpQ_pPET9Dm_4OtlctfDCN3OIT8nIgkjAttKYH8vsHJeRkBg:1pzAuS:zocC1MoLEsmL9YqXY5RX7HOHFQiGLc7CLvvFRf5OS48	2023-05-17 12:16:16.649346+05:30
ksy1z7g780f5nnwmrovel1q5i6drgk3s	.eJxVj8FOxDAMRH8F9cpu5LRJ4-bInRv3yE2820I3gaaVQIh_J0E9LEfPjJ_H342jfZvcnnl1c2hs0zane20k_8axGuGV4jUJn-K2zqOoEXG4WTynwMvTkf0HmChPZdsQKh4JB8NStwxDj6Qld8MQlEfvLwHNCKoPgFL20mhmg6yRvNIXpWSFZs55TtHx5_u8fjUWTkepei65JV3TvrmF8uZW_tg5b_UfaLsz4FmqFzC2Q6uNGDSClo8AFqCAa89INy5pCrc5FukPUoBluEc8VISxWgnVa1Ttgfj5BQOhZPw:1qVSAD:d9KDyCHBJ7LYxV_vS6SEEpKUPPJnT2TVJkeWjiyxOvA	2023-08-28 13:08:57.958618+05:30
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
2	http://192.168.51.111:8000/	amt.com
\.


--
-- Data for Name: firstapp_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firstapp_members (id, name, domain, authentication_url, description, logo_img, server, app_belongs, based_on, server_selection, server_status_on, is_active) FROM stdin;
2	VVmarine	marine.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Fmarine.ajax.tech%252Fweb%22%2C+%22d%22%3A+%22Marine13_live%22%7D&redirect_uri=https%3A%2F%2Fmarine.ajax.tech%2Fauth_oauth%2Fsignin&response_type=token&client_id=marineerp	Integrated ERP solution that deals all the bussiness process of VVMarine.	img/vvm1_VWFpIge.jpeg	OpenNebula Server	VV MARINE	odoo	live	live	t
12	VVPAINTS	erp.vvpaiint.com	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Ferp.vvpaiint.com%252Fweb%22%2C+%22d%22%3A+%22vvp13%22%7D&redirect_uri=https%3A%2F%2Ferp.vvpaiint.com%2Fauth_oauth%2Fsignin&response_type=token&client_id=vvpaiintcentral	Integrated ERP solution that deals all the bussiness process of VVPaiints.	img/vvpaint.png	AWS	VV PAIINT	odoo	live	live	t
15	MCS CRM - ERPNext	crm.mcs.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Fcrm.mcs.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vY3JtLm1jcy5hamF4LnRlY2giLCAidG9rZW4iOiAiNWU3OGJiMTYyMDg0NDBlMjUwMmUxYjBhNDU2NjFjYzQwNzg4NmZjMmRhOTIwODY0MGFiODU1ZDciLCAicmVkaXJlY3RfdG8iOiBudWxsfQ%3D%3D&response_type=code&scope=openid&client_id=crmmcs-erpnext		img/mcs_R5ONY9U.png	OpenNebula Server	MCS Global	odoo	live	live	t
14	SL MCS Account	sl.mcs.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Fsl.mcs.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vc2wubWNzLmFqYXgudGVjaCIsICJ0b2tlbiI6ICI1MjQ1ODY4YmJiYzAwYThiNTgxYzA1YmJhMjUxMzNjZTFjNzllMDI2Y2VkYWZmYThmYWUzNzRjMyIsICJyZWRpcmVjdF90byI6IG51bGx9&response_type=code&scope=openid&client_id=slaccmcs-erpnext		img/mcs.png	OpenNebula Server	MCS SL	odoo	live	live	t
16	MCS ERP - ERPNext	erp.mcs.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Fcrm.mcs.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vY3JtLm1jcy5hamF4LnRlY2giLCAidG9rZW4iOiAiNWU3OGJiMTYyMDg0NDBlMjUwMmUxYjBhNDU2NjFjYzQwNzg4NmZjMmRhOTIwODY0MGFiODU1ZDciLCAicmVkaXJlY3RfdG8iOiBudWxsfQ%3D%3D&response_type=code&scope=openid&client_id=crmmcs-erpnext		img/mcs_N1GmJUi.png	OpenNebula Server	MCS Global	odoo	live	live	t
7	VVLand Odoo	vvland15.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Fvvland15.ajax.tech%252Fweb%22%2C+%22d%22%3A+%22vvland_2022%22%7D&redirect_uri=https%3A%2F%2Fvvland15.ajax.tech%2Fauth_oauth%2Fsignin&response_type=token&client_id=vvlanderp	Odoo System that provides the details about lands in VV groups.	img/logo_BRgaf6N.png	OpenNebula Server	vvgroups	odoo	live	live	f
8	VVLand	land.ajax.tech	https://land.ajax.tech/component/viewlands	System provides the details about lands in VV groups.	img/logo_YRArECD.png	OpenNebula Server	vvgroups	odoo	live	live	f
9	Marine Payroll	hcm13.vvmarineproducts.com	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22d%22%3A+%22VVMarine_V13%22%2C+%22p%22%3A+5%2C+%22r%22%3A+%22https%253A%252F%252Fhcm13.vvmarineproducts.com%252Fweb%22%7D&redirect_uri=https%3A%2F%2Fhcm13.vvmarineproducts.com%2Fauth_oauth%2Fsignin&response_type=token&client_id=vvmarinepayroll	Integrated system to manage all the\r\nHR&amp;Payroll operations of VVmarine	img/marinepayroll.png	AWS	vvgroups	odoo	live	live	f
10	VV OPMS	opms.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Fopms.ajax.tech%252Fweb%22%2C+%22d%22%3A+%22OPMS_V13%22%7D&redirect_uri=https%3A%2F%2Fopms.ajax.tech%2Fauth_oauth%2Fsignin&response_type=token&client_id=opmspayroll		img/vvopms.png	OpenNebula Server	vvgroups	odoo	live	live	f
6	AJAX PMS	pms.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Fpms.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vcG1zLmFqYXgudGVjaCIsICJ0b2tlbiI6ICJhNTQwMzlhOTY3ZTQ3NmM0NWVhOWQ3ZjdmYjgxZTI3ZTM0ZGUxMGMyZjI4YzBiMGQyMDZiMDE2NiIsICJyZWRpcmVjdF90byI6IG51bGx9&response_type=code&scope=openid&client_id=ajaxpms	Project managent tool includes the leave mangement process of AMT	img/logo.png	OpenNebula Server	AMT	elasticsearch	live	live	t
18	Keyclock SSO	sso.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/account/#/		img/logo_912nxuT.png	OpenNebula Server	AMT	elasticsearch	live	live	t
20	Asset Management System	amtassets.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Famtassets.ajax.tech%252Fweb%22%2C+%22d%22%3A+%22Assets_Live%22%7D&redirect_uri=https%3A%2F%2Famtassets.ajax.tech%2Fauth_oauth%2Fsignin&response_type=token&client_id=amtajaxmanagement	Sytem is used to track the location, quantity, and maintenance  of the AMT's assets.	img/logo_XuCCKTx.png	OpenNebula Server	AMT	elasticsearch	live	alpha	t
32	AJAX PAYROLL	erp.ajax.tech	sso.ajax.tech		img/logo_hgTnEEu.png	OpenNebula Server	AMT	\N	live	live	t
37	VVSugars Payroll	vvshcm.ajax.tech	None		img/vvs_Cy2FwiR.png	OpenNebula Server	vvgroups	odoo	local	alpha	f
39	Vannamei Management	vms.ajax.tech	\N		img/vannmei.png	OpenNebula Server	vvgroups	odoo	local	alpha	f
45	Library vvcoe	lib.vvcoe.org	None		img/library.png	OpenNebula Server	ajax	odoo	local	\N	f
41	Font Unicode Convertion	103.152.181.75	\N		img/noimg.png	OpenNebula Server	ajax	odoo	local	live	f
43	DEV Ajax	dev.ajax.tech	\N		img/noimg_Avoj0U1.png	OpenNebula Server	ajax	odoo	local	alpha	f
47	Dashboard	dashboard.ajax.tech	https://dashboard.ajax.tech	ELK based dashboard system	img/amtlogo_3OSStN6.png	OpenNebula Server	ajax	\N	local	live	f
5	Keyclock SSO	https://central.ajax.tech/web	https://sso.ajax.tech/auth/realms/sugarserp/account/#/		img/keycloak.png	OpenNebula Server	ajax	odoo	live	live	f
3	Courts	https://courts.ajax.tech/	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+5%2C+%22r%22%3A+%22https%253A%252F%252Fcourts.ajax.tech%252Fweb%22%2C+%22d%22%3A+%22PDF_LIVE_001%22%7D&redirect_uri=https%3A%2F%2Fcourts.ajax.tech%2Fauth_oauth%2Fsignin&response_type=token&client_id=centrallivecourt	Court case alert system for the assigned search keys of various courts.	img/logo_XJNZtMj.png	OpenNebula Server	AMT	odoo	live	live	t
36	Transportation(TPT)	tpt.ajax.tech	\N		img/tpt.png	OpenNebula Server	vvgroups	odoo	local	live	f
38	Sanghvi Mills	erp.sanghvimills.com	\N		img/sanghvi.png	AWS	vvgroups	odoo	local	beta	f
42	Manam UAT Ajax	devicecontroller.ajax.tech	\N		img/manam.png	OpenNebula Server	ajax	odoo	local	alpha	f
44	EPT Server	ept.ajax.tech	\N		img/noimg_TGcjSgp.png	OpenNebula Server	ajax	odoo	local	alpha	f
46	Taiga/ HMS Testing Server	103.152.181.59	\N		img/noimg_IplgNb5.png	OpenNebula Server	ajax	odoo	local	beta	f
40	MCS Application	13.235.245.196	\N		img/mcs_MZRPHEk.png	AWS	mcs	odoo	local	beta	f
19	Superset Dashboard	newdashboards.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?response_type=code&client_id=superset_dashbboard&redirect_uri=http://newdashboards.ajax.tech/oauth-authorized/keycloak&scope=email&state=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuZXh0IjpbIiJdfQ.DS25DB4HuJfKNOqGQ1zCeWdjYBYN3ri3y9IidwbHB1M	Super set based dashboards	img/logo_mQtWERh.png	OpenNebula Server	AMT	elasticsearch	live	live	t
48	HCM Marine	hcm.vvm.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Fhcm.vvm.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vaGNtLnZ2bS5hamF4LnRlY2giLCAidG9rZW4iOiAiMzRjZDMwOWRhOWUwMDc2MGMxYzYxZGE5MzNhOTE1NzAyN2RlNDEzYzAyMDdjN2JhMDFjYTNkNGUiLCAicmVkaXJlY3RfdG8iOiBudWxsfQ%3D%3D&response_type=code&scope=openid&client_id=hcmmarine-erpnext		img/vvm_Cq43oWj.png	OpenNebula Server	VV MARINE	odoo	live	live	t
49	Marine Harvesting	https://aps.vvmp.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Faps.vvmp.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vYXBzLnZ2bXAuYWpheC50ZWNoIiwgInRva2VuIjogImE2NzFhNzcxNWNiZWIyMTMwYjg5YmFkZDNjYTI1MmI3MTQwZGIzODQwZTExNGRiZTE2Y2QxOGNiIiwgInJlZGlyZWN0X3RvIjogbnVsbH0%3D&response_type=code&scope=openid&client_id=aps-erpnext			OpenNebula Server	VV MARINE	odoo	live	live	t
17	Indtech PMS	indtech.ajax.tech	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?redirect_uri=https%3A%2F%2Findtech.ajax.tech%2Fapi%2Fmethod%2Ffrappe.integrations.oauth2_logins.custom%2Fkeycloak&state=eyJzaXRlIjogImh0dHBzOi8vaW5kdGVjaC5hamF4LnRlY2giLCAidG9rZW4iOiAiODk1NTliMDFkNWU3NDA1OWU0ZTA3YmEwZmI5MjRkYmRmNDFkNmU5MjAwYzIxYzZlNzllZjFiNjMiLCAicmVkaXJlY3RfdG8iOiBudWxsfQ%3D%3D&response_type=code&scope=openid&client_id=indtechpms	System provides the details about  inventory, timeline and production process.	img/mcs_b73BPwz.png	OpenNebula Server	MCS Global	odoo	live	live	t
1	VVSUGARS	erp.vvsugars.com	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+6%2C+%22r%22%3A+%22http%253A%252F%252Ferp.vvsugars.com%252Fweb%22%2C+%22d%22%3A+%22odoo1010_VVSLIVE%22%7D&redirect_uri=https%3A%2F%2Ferp.vvsugars.com%2Fauth_oauth%2Fsignin&response_type=token&client_id=centrallivesugars	Integrated ERP solution that deals all the bussiness process of VVSugars.	img/vvs_OnzyEYV.png	AWS	DS SUGARS	odoo	live	live	t
11	VVCOLLEGE	mgmt.vvcoe.org	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Fopms.ajax.tech%252Fweb%22%2C+%22d%22%3A+%22OPMS_V13%22%7D&redirect_uri=https%3A%2F%2Fopms.ajax.tech%2Fauth_oauth%2Fsignin&response_type=token&client_id=vvcollege		img/vvcollege.png	OpenNebula Server	vvgroups	odoo	live	live	f
13	VVTI SAFETY	safety.vvtipigments.com	https://sso.ajax.tech/auth/realms/sugarserp/protocol/openid-connect/auth?nonce=false?scope=user_id&state=%7B%22p%22%3A+4%2C+%22r%22%3A+%22https%253A%252F%252Ferp.vvpaiint.com%252Fweb%22%2C+%22d%22%3A+%22vvp13%22%7D&redirect_uri=https%3A%2F%2Ferp.vvpaiint.com%2Fauth_oauth%2Fsignin&response_type=token&client_id=vvtisafety		img/vvtisafety.png	AWS	vvgroups	odoo	live	live	f
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id, id_token_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated, algorithm) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated, code_challenge, code_challenge_method, nonce, claims) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_idtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_idtoken (id, jti, expires, scope, created, updated, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
5	keycloak	15a5c498-d83b-4079-8f44-9109d966abd9	2023-05-09 15:20:14.079271+05:30	2023-05-09 14:25:42.568061+05:30	{"sub": "15a5c498-d83b-4079-8f44-9109d966abd9", "email_verified": false, "name": "G P Karthick Single_signon", "preferred_username": "karthick.gp@ajaxmediatech.com", "given_name": "G P Karthick", "family_name": "Single_signon", "email": "karthick.gp@ajaxmediatech.com"}	33
7	keycloak	4300c735-c660-4f35-b4b8-5c363fe0f452	2023-05-17 10:47:08.873831+05:30	2023-05-11 17:30:53.43733+05:30	{"sub": "4300c735-c660-4f35-b4b8-5c363fe0f452", "email_verified": false, "name": "Anusuya R", "preferred_username": "anusuya", "given_name": "Anusuya", "family_name": "R", "email": "anusiya@ajaxmediatech.com"}	38
8	google	116986582648-1u1393cre6op8pji3o5cdsta9heh6o2o.apps.googleusercontent.com	2023-05-12 14:29:59.386952+05:30	2023-05-12 14:29:59.386966+05:30	{}	1
1	keycloak	0f7a5863-ef9d-4b0c-8ef7-f5fe88c7d39a	2023-05-17 12:17:21.645332+05:30	2023-03-08 11:37:38.292519+05:30	{"sub": "0f7a5863-ef9d-4b0c-8ef7-f5fe88c7d39a", "email_verified": false, "preferred_username": "webuser"}	1
6	keycloak	8175562a-497f-4544-b15b-0e6d8a89b366	2023-05-17 12:41:55.124221+05:30	2023-05-09 15:24:51.215922+05:30	{"sub": "8175562a-497f-4544-b15b-0e6d8a89b366", "email_verified": false, "name": "Sanjay Kumar A P", "preferred_username": "sanjaykumar@ajaxmediatech.com", "given_name": "Sanjay Kumar", "locale": "en", "family_name": "A P", "email": "sanjaykumar@ajaxmediatech.com"}	35
11	keycloak	f280d57e-7c30-49ea-b35f-3f480e470f66	2023-08-07 16:00:56.564254+05:30	2023-08-07 16:00:56.56427+05:30	{}	43
12	keycloak	3b63aa32-a50a-477e-94c1-d021fc0f6cfb	2023-08-07 16:08:38.225428+05:30	2023-08-07 16:08:38.225441+05:30	{}	44
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	google	Djangocore	116986582648-1u1393cre6op8pji3o5cdsta9heh6o2o.apps.googleusercontent.com	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	
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: sso_server_consumer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sso_server_consumer (id, name, private_key, public_key) FROM stdin;
\.


--
-- Data for Name: sso_server_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sso_server_token (id, request_token, access_token, "timestamp", redirect_to, consumer_id, user_id) FROM stdin;
\.


--
-- Data for Name: userlogin_myprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userlogin_myprofile (id, first_name, last_name, email, description, company, job, country, address, phone, twitter, facebook, instagram, linkedin, profile_img, user_id) FROM stdin;
1	webuser	primary	webuser@gmail.com	About the web user user solutions edit	AMT Solutions	Web Designer	Indian	A108 Adam Street, pin - 535022	(436) 486-3538 x29072	https://twitter.com/#	https://facebook.com/#	https://instagram.com/#	https://linkedin.com/#	profile/noimg.png	1
4	karthick	G P	karthick.gp@ajaxmediatech.com	Test	AMT	Sr. Developer	India	A108 Adam Street, pin - 535022	(436) 486-3538 x29071	https://twitter.com/#	https://facebook.com/#	https://instagram.com/#	https://linkedin.com/#	profile/profile-icon_z36uzfs.png	33
2	-	-	admin@gmail.com	test user	AMT	Web Designer	India	A108 Adam Street, pin - 535022	(436) 486-3538 x29071	https://twitter.com/#	https://facebook.com/#	https://instagram.com/#	https://linkedin.com/#	profile/profile-icon_8iz343m.png	2
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 3, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: addapp_account_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addapp_account_applications_id_seq', 432, true);


--
-- Name: addapp_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addapp_account_id_seq', 30, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 44, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 84, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_cron_cronjoblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_cron_cronjoblock_id_seq', 1, false);


--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_cron_cronjoblog_id_seq', 1, false);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 59, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 2, true);


--
-- Name: firstapp_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firstapp_members_id_seq', 49, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_idtoken_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 12, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: sso_server_consumer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sso_server_consumer_id_seq', 1, false);


--
-- Name: sso_server_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sso_server_token_id_seq', 1, false);


--
-- Name: userlogin_myprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userlogin_myprofile_id_seq', 4, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: addapp_account_applications addapp_account_applications_account_id_members_id_d1bb5bbd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account_applications
    ADD CONSTRAINT addapp_account_applications_account_id_members_id_d1bb5bbd_uniq UNIQUE (account_id, members_id);


--
-- Name: addapp_account_applications addapp_account_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account_applications
    ADD CONSTRAINT addapp_account_applications_pkey PRIMARY KEY (id);


--
-- Name: addapp_account addapp_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account
    ADD CONSTRAINT addapp_account_pkey PRIMARY KEY (id);


--
-- Name: addapp_account addapp_account_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account
    ADD CONSTRAINT addapp_account_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_cron_cronjoblock django_cron_cronjoblock_job_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_cron_cronjoblock
    ADD CONSTRAINT django_cron_cronjoblock_job_name_key UNIQUE (job_name);


--
-- Name: django_cron_cronjoblock django_cron_cronjoblock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_cron_cronjoblock
    ADD CONSTRAINT django_cron_cronjoblock_pkey PRIMARY KEY (id);


--
-- Name: django_cron_cronjoblog django_cron_cronjoblog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_cron_cronjoblog
    ADD CONSTRAINT django_cron_cronjoblog_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: firstapp_members firstapp_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firstapp_members
    ADD CONSTRAINT firstapp_members_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_id_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_id_token_id_key UNIQUE (id_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_key UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_key UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_jti_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_jti_key UNIQUE (jti);


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: sso_server_consumer sso_server_consumer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_consumer
    ADD CONSTRAINT sso_server_consumer_name_key UNIQUE (name);


--
-- Name: sso_server_consumer sso_server_consumer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_consumer
    ADD CONSTRAINT sso_server_consumer_pkey PRIMARY KEY (id);


--
-- Name: sso_server_consumer sso_server_consumer_private_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_consumer
    ADD CONSTRAINT sso_server_consumer_private_key_key UNIQUE (private_key);


--
-- Name: sso_server_consumer sso_server_consumer_public_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_consumer
    ADD CONSTRAINT sso_server_consumer_public_key_key UNIQUE (public_key);


--
-- Name: sso_server_token sso_server_token_access_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_token
    ADD CONSTRAINT sso_server_token_access_token_key UNIQUE (access_token);


--
-- Name: sso_server_token sso_server_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_token
    ADD CONSTRAINT sso_server_token_pkey PRIMARY KEY (id);


--
-- Name: sso_server_token sso_server_token_request_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_token
    ADD CONSTRAINT sso_server_token_request_token_key UNIQUE (request_token);


--
-- Name: userlogin_myprofile userlogin_myprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin_myprofile
    ADD CONSTRAINT userlogin_myprofile_pkey PRIMARY KEY (id);


--
-- Name: userlogin_myprofile userlogin_myprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin_myprofile
    ADD CONSTRAINT userlogin_myprofile_user_id_key UNIQUE (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: addapp_account_applications_account_id_4d458142; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addapp_account_applications_account_id_4d458142 ON public.addapp_account_applications USING btree (account_id);


--
-- Name: addapp_account_applications_members_id_487d333a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addapp_account_applications_members_id_487d333a ON public.addapp_account_applications USING btree (members_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_cron_cronjoblock_job_name_fb6ce879_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblock_job_name_fb6ce879_like ON public.django_cron_cronjoblock USING btree (job_name varchar_pattern_ops);


--
-- Name: django_cron_cronjoblog_code_48865653; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_code_48865653 ON public.django_cron_cronjoblog USING btree (code);


--
-- Name: django_cron_cronjoblog_code_48865653_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_code_48865653_like ON public.django_cron_cronjoblog USING btree (code varchar_pattern_ops);


--
-- Name: django_cron_cronjoblog_code_is_success_ran_at_time_84da9606_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_code_is_success_ran_at_time_84da9606_idx ON public.django_cron_cronjoblog USING btree (code, is_success, ran_at_time);


--
-- Name: django_cron_cronjoblog_code_start_time_4fc78f9d_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_code_start_time_4fc78f9d_idx ON public.django_cron_cronjoblog USING btree (code, start_time);


--
-- Name: django_cron_cronjoblog_code_start_time_ran_at_time_8b50b8fa_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_code_start_time_ran_at_time_8b50b8fa_idx ON public.django_cron_cronjoblog USING btree (code, start_time, ran_at_time);


--
-- Name: django_cron_cronjoblog_end_time_7918602a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_end_time_7918602a ON public.django_cron_cronjoblog USING btree (end_time);


--
-- Name: django_cron_cronjoblog_ran_at_time_7fed2751; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_ran_at_time_7fed2751 ON public.django_cron_cronjoblog USING btree (ran_at_time);


--
-- Name: django_cron_cronjoblog_start_time_d68c0dd9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cron_cronjoblog_start_time_d68c0dd9 ON public.django_cron_cronjoblog USING btree (start_time);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_idtoken_application_id_08c5ff4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_idtoken_application_id_08c5ff4f ON public.oauth2_provider_idtoken USING btree (application_id);


--
-- Name: oauth2_provider_idtoken_user_id_dd512b59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_idtoken_user_id_dd512b59 ON public.oauth2_provider_idtoken USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: sso_server_consumer_name_d64029ac_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_consumer_name_d64029ac_like ON public.sso_server_consumer USING btree (name varchar_pattern_ops);


--
-- Name: sso_server_consumer_private_key_065b025c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_consumer_private_key_065b025c_like ON public.sso_server_consumer USING btree (private_key varchar_pattern_ops);


--
-- Name: sso_server_consumer_public_key_e3892d11_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_consumer_public_key_e3892d11_like ON public.sso_server_consumer USING btree (public_key varchar_pattern_ops);


--
-- Name: sso_server_token_access_token_99038f82_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_token_access_token_99038f82_like ON public.sso_server_token USING btree (access_token varchar_pattern_ops);


--
-- Name: sso_server_token_consumer_id_09eb6bbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_token_consumer_id_09eb6bbb ON public.sso_server_token USING btree (consumer_id);


--
-- Name: sso_server_token_request_token_edeede6d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_token_request_token_edeede6d_like ON public.sso_server_token USING btree (request_token varchar_pattern_ops);


--
-- Name: sso_server_token_user_id_644f8aa7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sso_server_token_user_id_644f8aa7 ON public.sso_server_token USING btree (user_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: addapp_account_applications addapp_account_appli_account_id_4d458142_fk_addapp_ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account_applications
    ADD CONSTRAINT addapp_account_appli_account_id_4d458142_fk_addapp_ac FOREIGN KEY (account_id) REFERENCES public.addapp_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: addapp_account_applications addapp_account_appli_members_id_487d333a_fk_firstapp_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account_applications
    ADD CONSTRAINT addapp_account_appli_members_id_487d333a_fk_firstapp_ FOREIGN KEY (members_id) REFERENCES public.firstapp_members(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: addapp_account addapp_account_user_id_96002528_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addapp_account
    ADD CONSTRAINT addapp_account_user_id_96002528_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr FOREIGN KEY (id_token_id) REFERENCES public.oauth2_provider_idtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_idtoken oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_user_id_dd512b59_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_user_id_dd512b59_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sso_server_token sso_server_token_consumer_id_09eb6bbb_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_token
    ADD CONSTRAINT sso_server_token_consumer_id_09eb6bbb_fk FOREIGN KEY (consumer_id) REFERENCES public.sso_server_consumer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sso_server_token sso_server_token_user_id_644f8aa7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sso_server_token
    ADD CONSTRAINT sso_server_token_user_id_644f8aa7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userlogin_myprofile userlogin_myprofile_user_id_9d8750a4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin_myprofile
    ADD CONSTRAINT userlogin_myprofile_user_id_9d8750a4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

