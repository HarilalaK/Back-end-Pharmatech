PGDMP                          |        
   PHARMATECH    15.4    15.4 q    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    50170 
   PHARMATECH    DATABASE     �   CREATE DATABASE "PHARMATECH" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Madagascar.1252';
    DROP DATABASE "PHARMATECH";
                postgres    false            c           1247    50250    enum_commande_statut    TYPE     �   CREATE TYPE public.enum_commande_statut AS ENUM (
    'en attente',
    'en cours',
    'expediee',
    'livree',
    'annulee'
);
 '   DROP TYPE public.enum_commande_statut;
       public          postgres    false            o           1247    50344    enum_facture_statut_paiement    TYPE     �   CREATE TYPE public.enum_facture_statut_paiement AS ENUM (
    'en attente',
    'paye',
    'partiellement paye',
    'rembourse'
);
 /   DROP TYPE public.enum_facture_statut_paiement;
       public          postgres    false            l           1247    50315    enum_livraison_statut_livraison    TYPE        CREATE TYPE public.enum_livraison_statut_livraison AS ENUM (
    'En attente',
    'En transit',
    'Livree',
    'Retour'
);
 2   DROP TYPE public.enum_livraison_statut_livraison;
       public          postgres    false            f           1247    50280    enum_paiement_mode_paiement    TYPE     l   CREATE TYPE public.enum_paiement_mode_paiement AS ENUM (
    'carte',
    'virement',
    'mobile money'
);
 .   DROP TYPE public.enum_paiement_mode_paiement;
       public          postgres    false            i           1247    50288    enum_paiement_statut_paiement    TYPE     h   CREATE TYPE public.enum_paiement_statut_paiement AS ENUM (
    'en attente',
    'paye',
    'echec'
);
 0   DROP TYPE public.enum_paiement_statut_paiement;
       public          postgres    false            r           1247    50433    enum_panier_statut    TYPE     v   CREATE TYPE public.enum_panier_statut AS ENUM (
    'actif',
    'pret',
    'valide',
    'commande',
    'ferme'
);
 %   DROP TYPE public.enum_panier_statut;
       public          postgres    false            `           1247    50177    enum_utilisateur_role    TYPE     P   CREATE TYPE public.enum_utilisateur_role AS ENUM (
    'admin',
    'client'
);
 (   DROP TYPE public.enum_utilisateur_role;
       public          postgres    false            �            1259    50171    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            �            1259    57701    adresse    TABLE     E  CREATE TABLE public.adresse (
    id integer NOT NULL,
    pays character varying(50) NOT NULL,
    ville character varying(50) NOT NULL,
    code_postal integer NOT NULL,
    code_adresse character varying(50) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.adresse;
       public         heap    postgres    false            �            1259    57700    adresse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.adresse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.adresse_id_seq;
       public          postgres    false    238            �           0    0    adresse_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.adresse_id_seq OWNED BY public.adresse.id;
          public          postgres    false    237            �            1259    57506 	   categorie    TABLE     �   CREATE TABLE public.categorie (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.categorie;
       public         heap    postgres    false            �            1259    57505    categorie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categorie_id_seq;
       public          postgres    false    218            �           0    0    categorie_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;
          public          postgres    false    217            �            1259    57563    commande    TABLE     �  CREATE TABLE public.commande (
    id integer NOT NULL,
    utilisateur_id integer,
    panier_id integer,
    date_commande timestamp with time zone,
    statut public.enum_commande_statut DEFAULT 'en attente'::public.enum_commande_statut,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.commande;
       public         heap    postgres    false    867    867            �            1259    57682    commandeProduit    TABLE     �  CREATE TABLE public."commandeProduit" (
    id integer NOT NULL,
    commande_id integer,
    produit_id integer,
    prix_unitaire numeric,
    quantite integer,
    "prixHTtotal" numeric,
    tva_pourcentage numeric,
    "prixTVA" numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
 %   DROP TABLE public."commandeProduit";
       public         heap    postgres    false            �            1259    57681    commandeProduit_id_seq    SEQUENCE     �   CREATE SEQUENCE public."commandeProduit_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."commandeProduit_id_seq";
       public          postgres    false    236            �           0    0    commandeProduit_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."commandeProduit_id_seq" OWNED BY public."commandeProduit".id;
          public          postgres    false    235            �            1259    57562    commande_id_seq    SEQUENCE     �   CREATE SEQUENCE public.commande_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.commande_id_seq;
       public          postgres    false    226            �           0    0    commande_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;
          public          postgres    false    225            �            1259    57667    facture    TABLE     �  CREATE TABLE public.facture (
    id integer NOT NULL,
    commande_id integer NOT NULL,
    numero_facture character varying(255) NOT NULL,
    date_emission timestamp with time zone NOT NULL,
    montant_total numeric(20,2) NOT NULL,
    statut_paiement public.enum_facture_statut_paiement DEFAULT 'en attente'::public.enum_facture_statut_paiement NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.facture;
       public         heap    postgres    false    879    879            �            1259    57666    facture_id_seq    SEQUENCE     �   CREATE SEQUENCE public.facture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.facture_id_seq;
       public          postgres    false    234            �           0    0    facture_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.facture_id_seq OWNED BY public.facture.id;
          public          postgres    false    233            �            1259    57605 	   livraison    TABLE     n  CREATE TABLE public.livraison (
    id integer NOT NULL,
    commande_id integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    adresse character varying(255) NOT NULL,
    prescription character varying(255),
    ville character varying(255) NOT NULL,
    code_postal character varying(255) NOT NULL,
    date_livraison timestamp with time zone,
    transporteur character varying(255),
    numero_suivi character varying(255),
    statut_livraison public.enum_livraison_statut_livraison DEFAULT 'En attente'::public.enum_livraison_statut_livraison,
    methode_livraison_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.livraison;
       public         heap    postgres    false    876    876            �            1259    57604    livraison_id_seq    SEQUENCE     �   CREATE SEQUENCE public.livraison_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.livraison_id_seq;
       public          postgres    false    232            �           0    0    livraison_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.livraison_id_seq OWNED BY public.livraison.id;
          public          postgres    false    231            �            1259    57596    methodeLivraison    TABLE     =  CREATE TABLE public."methodeLivraison" (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    description text NOT NULL,
    prix numeric(10,2) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
 &   DROP TABLE public."methodeLivraison";
       public         heap    postgres    false            �            1259    57595    methodeLivraison_id_seq    SEQUENCE     �   CREATE SEQUENCE public."methodeLivraison_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."methodeLivraison_id_seq";
       public          postgres    false    230            �           0    0    methodeLivraison_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."methodeLivraison_id_seq" OWNED BY public."methodeLivraison".id;
          public          postgres    false    229            �            1259    57581    paiement    TABLE     �  CREATE TABLE public.paiement (
    id integer NOT NULL,
    commande_id integer,
    montant numeric,
    date_paiement timestamp with time zone,
    mode_paiement public.enum_paiement_mode_paiement,
    reference character varying(50) NOT NULL,
    statut_paiement public.enum_paiement_statut_paiement DEFAULT 'en attente'::public.enum_paiement_statut_paiement,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.paiement;
       public         heap    postgres    false    873    870    873            �            1259    57580    paiement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paiement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.paiement_id_seq;
       public          postgres    false    228            �           0    0    paiement_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.paiement_id_seq OWNED BY public.paiement.id;
          public          postgres    false    227            �            1259    57531    panier    TABLE     >  CREATE TABLE public.panier (
    id integer NOT NULL,
    utilisateur_id integer,
    statut public.enum_panier_statut DEFAULT 'actif'::public.enum_panier_statut NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.panier;
       public         heap    postgres    false    882    882            �            1259    57544    panierProduit    TABLE     1  CREATE TABLE public."panierProduit" (
    id integer NOT NULL,
    panier_id integer,
    produit_id integer,
    quantite integer,
    prix_unitaire numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
 #   DROP TABLE public."panierProduit";
       public         heap    postgres    false            �            1259    57543    panierProduit_id_seq    SEQUENCE     �   CREATE SEQUENCE public."panierProduit_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."panierProduit_id_seq";
       public          postgres    false    224            �           0    0    panierProduit_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."panierProduit_id_seq" OWNED BY public."panierProduit".id;
          public          postgres    false    223            �            1259    57530    panier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.panier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.panier_id_seq;
       public          postgres    false    222            �           0    0    panier_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.panier_id_seq OWNED BY public.panier.id;
          public          postgres    false    221            �            1259    57513    produit    TABLE     _  CREATE TABLE public.produit (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    description text NOT NULL,
    prix numeric(10,2) NOT NULL,
    image character varying(250) NOT NULL,
    categorie_id integer NOT NULL,
    marque character varying(100) NOT NULL,
    numero_serie character varying(100),
    caracteristique_principale text NOT NULL,
    reduction numeric(5,2) DEFAULT 0,
    tva_pourcentage numeric(5,2) DEFAULT 20 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.produit;
       public         heap    postgres    false            �            1259    57512    produit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produit_id_seq;
       public          postgres    false    220            �           0    0    produit_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.produit_id_seq OWNED BY public.produit.id;
          public          postgres    false    219            �            1259    57494    utilisateur    TABLE       CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    motdepasse character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    role public.enum_utilisateur_role DEFAULT 'client'::public.enum_utilisateur_role NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.utilisateur;
       public         heap    postgres    false    864    864            �            1259    57493    utilisateur_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.utilisateur_id_seq;
       public          postgres    false    216            �           0    0    utilisateur_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;
          public          postgres    false    215            �           2604    57704 
   adresse id    DEFAULT     h   ALTER TABLE ONLY public.adresse ALTER COLUMN id SET DEFAULT nextval('public.adresse_id_seq'::regclass);
 9   ALTER TABLE public.adresse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    57509    categorie id    DEFAULT     l   ALTER TABLE ONLY public.categorie ALTER COLUMN id SET DEFAULT nextval('public.categorie_id_seq'::regclass);
 ;   ALTER TABLE public.categorie ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    57566    commande id    DEFAULT     j   ALTER TABLE ONLY public.commande ALTER COLUMN id SET DEFAULT nextval('public.commande_id_seq'::regclass);
 :   ALTER TABLE public.commande ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    57685    commandeProduit id    DEFAULT     |   ALTER TABLE ONLY public."commandeProduit" ALTER COLUMN id SET DEFAULT nextval('public."commandeProduit_id_seq"'::regclass);
 C   ALTER TABLE public."commandeProduit" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    57670 
   facture id    DEFAULT     h   ALTER TABLE ONLY public.facture ALTER COLUMN id SET DEFAULT nextval('public.facture_id_seq'::regclass);
 9   ALTER TABLE public.facture ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    57608    livraison id    DEFAULT     l   ALTER TABLE ONLY public.livraison ALTER COLUMN id SET DEFAULT nextval('public.livraison_id_seq'::regclass);
 ;   ALTER TABLE public.livraison ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    57599    methodeLivraison id    DEFAULT     ~   ALTER TABLE ONLY public."methodeLivraison" ALTER COLUMN id SET DEFAULT nextval('public."methodeLivraison_id_seq"'::regclass);
 D   ALTER TABLE public."methodeLivraison" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    57584    paiement id    DEFAULT     j   ALTER TABLE ONLY public.paiement ALTER COLUMN id SET DEFAULT nextval('public.paiement_id_seq'::regclass);
 :   ALTER TABLE public.paiement ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    57534 	   panier id    DEFAULT     f   ALTER TABLE ONLY public.panier ALTER COLUMN id SET DEFAULT nextval('public.panier_id_seq'::regclass);
 8   ALTER TABLE public.panier ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    57547    panierProduit id    DEFAULT     x   ALTER TABLE ONLY public."panierProduit" ALTER COLUMN id SET DEFAULT nextval('public."panierProduit_id_seq"'::regclass);
 A   ALTER TABLE public."panierProduit" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    57516 
   produit id    DEFAULT     h   ALTER TABLE ONLY public.produit ALTER COLUMN id SET DEFAULT nextval('public.produit_id_seq'::regclass);
 9   ALTER TABLE public.produit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    57497    utilisateur id    DEFAULT     p   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);
 =   ALTER TABLE public.utilisateur ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    50171    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    214   L�       �          0    57701    adresse 
   TABLE DATA           g   COPY public.adresse (id, pays, ville, code_postal, code_adresse, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    238   �       �          0    57506 	   categorie 
   TABLE DATA           S   COPY public.categorie (id, nom, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    218   �       �          0    57563    commande 
   TABLE DATA              COPY public.commande (id, utilisateur_id, panier_id, date_commande, statut, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    226   v�       �          0    57682    commandeProduit 
   TABLE DATA           �   COPY public."commandeProduit" (id, commande_id, produit_id, prix_unitaire, quantite, "prixHTtotal", tva_pourcentage, "prixTVA", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    236   ޔ       �          0    57667    facture 
   TABLE DATA           �   COPY public.facture (id, commande_id, numero_facture, date_emission, montant_total, statut_paiement, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    234   W�       �          0    57605 	   livraison 
   TABLE DATA           �   COPY public.livraison (id, commande_id, nom, prenom, email, phone, adresse, prescription, ville, code_postal, date_livraison, transporteur, numero_suivi, statut_livraison, methode_livraison_id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    232   �       �          0    57596    methodeLivraison 
   TABLE DATA           o   COPY public."methodeLivraison" (id, nom, description, prix, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    230   ��       �          0    57581    paiement 
   TABLE DATA           �   COPY public.paiement (id, commande_id, montant, date_paiement, mode_paiement, reference, statut_paiement, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    228   Ɨ       �          0    57531    panier 
   TABLE DATA           c   COPY public.panier (id, utilisateur_id, statut, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    222   �       �          0    57544    panierProduit 
   TABLE DATA           �   COPY public."panierProduit" (id, panier_id, produit_id, quantite, prix_unitaire, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    224   M�       �          0    57513    produit 
   TABLE DATA           �   COPY public.produit (id, nom, description, prix, image, categorie_id, marque, numero_serie, caracteristique_principale, reduction, tva_pourcentage, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    220   Ø       �          0    57494    utilisateur 
   TABLE DATA           }   COPY public.utilisateur (id, nom, prenom, email, motdepasse, phone, role, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    216   ��       �           0    0    adresse_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.adresse_id_seq', 1, false);
          public          postgres    false    237            �           0    0    categorie_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.categorie_id_seq', 2, true);
          public          postgres    false    217            �           0    0    commandeProduit_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."commandeProduit_id_seq"', 3, true);
          public          postgres    false    235            �           0    0    commande_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.commande_id_seq', 2, true);
          public          postgres    false    225            �           0    0    facture_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.facture_id_seq', 4, true);
          public          postgres    false    233            �           0    0    livraison_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.livraison_id_seq', 1, true);
          public          postgres    false    231            �           0    0    methodeLivraison_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."methodeLivraison_id_seq"', 3, true);
          public          postgres    false    229            �           0    0    paiement_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.paiement_id_seq', 1, false);
          public          postgres    false    227            �           0    0    panierProduit_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."panierProduit_id_seq"', 3, true);
          public          postgres    false    223            �           0    0    panier_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.panier_id_seq', 2, true);
          public          postgres    false    221            �           0    0    produit_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.produit_id_seq', 3, true);
          public          postgres    false    219            �           0    0    utilisateur_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.utilisateur_id_seq', 2, true);
          public          postgres    false    215            �           2606    50175     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    214            �           2606    57706    adresse adresse_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.adresse DROP CONSTRAINT adresse_pkey;
       public            postgres    false    238            �           2606    57511    categorie categorie_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categorie DROP CONSTRAINT categorie_pkey;
       public            postgres    false    218            �           2606    57689 $   commandeProduit commandeProduit_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."commandeProduit"
    ADD CONSTRAINT "commandeProduit_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."commandeProduit" DROP CONSTRAINT "commandeProduit_pkey";
       public            postgres    false    236            �           2606    57569    commande commande_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pkey;
       public            postgres    false    226            �           2606    57675 "   facture facture_numero_facture_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_numero_facture_key UNIQUE (numero_facture);
 L   ALTER TABLE ONLY public.facture DROP CONSTRAINT facture_numero_facture_key;
       public            postgres    false    234            �           2606    57673    facture facture_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.facture DROP CONSTRAINT facture_pkey;
       public            postgres    false    234            �           2606    57613    livraison livraison_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.livraison DROP CONSTRAINT livraison_pkey;
       public            postgres    false    232            �           2606    57603 &   methodeLivraison methodeLivraison_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."methodeLivraison"
    ADD CONSTRAINT "methodeLivraison_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."methodeLivraison" DROP CONSTRAINT "methodeLivraison_pkey";
       public            postgres    false    230            �           2606    57589    paiement paiement_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.paiement DROP CONSTRAINT paiement_pkey;
       public            postgres    false    228            �           2606    57551     panierProduit panierProduit_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."panierProduit"
    ADD CONSTRAINT "panierProduit_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."panierProduit" DROP CONSTRAINT "panierProduit_pkey";
       public            postgres    false    224            �           2606    57537    panier panier_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.panier DROP CONSTRAINT panier_pkey;
       public            postgres    false    222            �           2606    57524     produit produit_numero_serie_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_numero_serie_key UNIQUE (numero_serie);
 J   ALTER TABLE ONLY public.produit DROP CONSTRAINT produit_numero_serie_key;
       public            postgres    false    220            �           2606    57522    produit produit_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produit DROP CONSTRAINT produit_pkey;
       public            postgres    false    220            �           2606    57504 !   utilisateur utilisateur_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_email_key;
       public            postgres    false    216            �           2606    57502    utilisateur utilisateur_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pkey;
       public            postgres    false    216            �           2606    57690 0   commandeProduit commandeProduit_commande_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."commandeProduit"
    ADD CONSTRAINT "commandeProduit_commande_id_fkey" FOREIGN KEY (commande_id) REFERENCES public.commande(id);
 ^   ALTER TABLE ONLY public."commandeProduit" DROP CONSTRAINT "commandeProduit_commande_id_fkey";
       public          postgres    false    226    236    3290            �           2606    57695 /   commandeProduit commandeProduit_produit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."commandeProduit"
    ADD CONSTRAINT "commandeProduit_produit_id_fkey" FOREIGN KEY (produit_id) REFERENCES public.produit(id);
 ]   ALTER TABLE ONLY public."commandeProduit" DROP CONSTRAINT "commandeProduit_produit_id_fkey";
       public          postgres    false    236    3284    220            �           2606    57575     commande commande_panier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_panier_id_fkey FOREIGN KEY (panier_id) REFERENCES public.panier(id);
 J   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_panier_id_fkey;
       public          postgres    false    222    3286    226            �           2606    57570 %   commande commande_utilisateur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);
 O   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_utilisateur_id_fkey;
       public          postgres    false    3278    226    216            �           2606    57676     facture facture_commande_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_commande_id_fkey FOREIGN KEY (commande_id) REFERENCES public.commande(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.facture DROP CONSTRAINT facture_commande_id_fkey;
       public          postgres    false    234    3290    226            �           2606    57614 $   livraison livraison_commande_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_commande_id_fkey FOREIGN KEY (commande_id) REFERENCES public.commande(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.livraison DROP CONSTRAINT livraison_commande_id_fkey;
       public          postgres    false    226    3290    232            �           2606    57619 -   livraison livraison_methode_livraison_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_methode_livraison_id_fkey FOREIGN KEY (methode_livraison_id) REFERENCES public."methodeLivraison"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.livraison DROP CONSTRAINT livraison_methode_livraison_id_fkey;
       public          postgres    false    230    232    3294            �           2606    57590 "   paiement paiement_commande_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_commande_id_fkey FOREIGN KEY (commande_id) REFERENCES public.commande(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.paiement DROP CONSTRAINT paiement_commande_id_fkey;
       public          postgres    false    226    228    3290            �           2606    57552 *   panierProduit panierProduit_panier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."panierProduit"
    ADD CONSTRAINT "panierProduit_panier_id_fkey" FOREIGN KEY (panier_id) REFERENCES public.panier(id);
 X   ALTER TABLE ONLY public."panierProduit" DROP CONSTRAINT "panierProduit_panier_id_fkey";
       public          postgres    false    3286    222    224            �           2606    57557 +   panierProduit panierProduit_produit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."panierProduit"
    ADD CONSTRAINT "panierProduit_produit_id_fkey" FOREIGN KEY (produit_id) REFERENCES public.produit(id);
 Y   ALTER TABLE ONLY public."panierProduit" DROP CONSTRAINT "panierProduit_produit_id_fkey";
       public          postgres    false    224    3284    220            �           2606    57538 !   panier panier_utilisateur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);
 K   ALTER TABLE ONLY public.panier DROP CONSTRAINT panier_utilisateur_id_fkey;
       public          postgres    false    3278    216    222            �           2606    57525 !   produit produit_categorie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_categorie_id_fkey FOREIGN KEY (categorie_id) REFERENCES public.categorie(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.produit DROP CONSTRAINT produit_categorie_id_fkey;
       public          postgres    false    220    218    3280            �   �   x�]��� E���-q��@՚����t{i�s{o[ �YF��+�&JsW�%��b��L��S�o��P^�n��-b�ý����&�-~�y=�m�Z������>l(Ű��~�������D�����(#��<�o�cLi��z!���i�      �      x������ � �      �   V   x�3��M,I-�L�Q�MM�LN�I�4202�5��54S04�25�20�36��60�'��e�	1#75�S������)VSR@Sb���� �@!L      �   X   x�3�4�4�4202�5��54S04�25�21�313�60�L�SH�/-*ơ���T�P�U����P����	N+����Z���� @h(z      �   i   x��̻� ��H���|����爱%�H�9�N���\��؞b�%�T6BϵK�R�����Y�d�Ys�Ȃ?tR�E�q7�V�:�1��R)=����T0�      �   �   x���1� Fg��M��qG6c����Ł�S���Ӂ�}��CC�z��G�(�
��! !: $I�~2� ��s &/�c]��Jܔ�p�曥}B@~%H��
?�P�^�k�w�o�*��RL���	�JҚ�MB �:5�D�
�$��w��S��gg�}/�j�      �   �   x�}�Ak�@Fϓ_1wIؙ����ՊՀ������6��mS�\�����#`����9՗�$�^z��S�|��a����P�V��%kx	��=n݄;��OI�� ���1��5�1�୥%W�^L�������vP�$~&�� ������L��QRj}j���\�r��yͫ5���P�_���Y���VC       �   �   x����N�0Dk�+��@���A�
�kg#-���ڎ��|e~#�H�u�3��k�Ie���#I&Q6�2+I��_R�0�p�E!ǒ`��Y|�C��8t�;{�v�m�]��/:=5n����u��E�e�C��C��Ea��Pp���+�.�f)Y�A����.Z7��x�R}׏�%��5�Tmz�W*2S���x��i�Ox��Q      �      x������ � �      �   Z   x�u�;
�0 й9��4$!mc�	��:V���Iq~�8H��֦mY��h�!r�<e�Jܓ����d�:��-�d.��>�M�`R{�� p �	      �   f   x�}���@Dѳ���#��ׂ-�
迎 �V9���ha2p�����!F���d~�ұ�8!���%uW����z$�C9�8��X���t'mQ�txk�ʉ(�      �   *  x����n� �g��y�l�!x͜��٧�
��O���GiT%�����F�f
>N~E��	�A��t�1��p̵_`A��&��#h�5fca�d#hY-�$���9�#�\tR�����1گ�@�/i����%�1�a��j�	��r��D� Wşr�s#8��O$��דwU��г���R�{�ɮ�C�ۆ�@�N��L�ǯ������Z٫~���!:;=�sI�3�Y^�����P�k���~�����QN�aJ!�~�"�:���&[����S�jl���<��X      �   �   x�u��N�@ ������Ng�,'�J]�5�Ҥ��V�0L�*O�1����?�ep��eZQ�^IѪB�e-ja\<KQ�0W��Q�H��Ƅ9�7c�d��!��^ڀ�E{,�J���1��ޛ��qDbؤ���"��	�'xv���-�h�#�X�)���(�i�?����?Us��oG#��]6Ϩ���	RO��Upnߊ���\F�L�]>*�S��������Ab�:��J��5�4�t�eE     