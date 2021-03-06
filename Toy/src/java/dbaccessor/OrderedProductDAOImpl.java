/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbaccessor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.Order;
import model.OrderedProduct;

/**
 *
 * @author Ninad
 */

public class OrderedProductDAOImpl implements OrderedProductDAO
{
    DataSource ds;
    Connection conn;
    ResultSet rs;
    
    public OrderedProductDAOImpl()
    {
        try
        {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            ds = (DataSource)envCtx.lookup("jdbc/toy");
        }
        catch (NamingException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<OrderedProduct> getAll()
    {
        List<OrderedProduct> ret = new ArrayList<OrderedProduct>();
        try
        {
            this.conn = ds.getConnection();
            this.rs = conn.prepareStatement("SELECT * FROM ordered_product;").executeQuery();
            while(this.rs.next())
            {
                OrderedProduct order = new OrderedProduct();
                OrderHistoryDAO orderHistoryDAO = new OrderHistoryDAOImpl();
                order.setOrderHistory(orderHistoryDAO.getOrderHistoryFromID(this.rs.getString("order_id")));
                ProductDAO productDAO = new ProductDAOImpl();
                order.setProduct(productDAO.getProductFromID(this.rs.getString("product_id")));
                order.setQuantity(this.rs.getInt("quantity"));
                ret.add(order);
            }
            
            if (rs != null)
            {
                rs.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public OrderedProduct getOrderHistoryFromID(String order_id, String product_id)
    {
        OrderedProduct ret = null;
        try
        {
            this.conn = ds.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM ordered_product"
                    + " WHERE order_id = ? AND product_id = ?;");
            ps.setString(1, order_id);
            ps.setString(2, product_id);
            this.rs = ps.executeQuery();
            while(this.rs.next())
            {
                OrderedProduct order = new OrderedProduct();
                OrderHistoryDAO orderHistoryDAO = new OrderHistoryDAOImpl();
                order.setOrderHistory(orderHistoryDAO.getOrderHistoryFromID(this.rs.getString("order_id")));
                ProductDAO productDAO = new ProductDAOImpl();
                order.setProduct(productDAO.getProductFromID(this.rs.getString("product_id")));
                order.setQuantity(this.rs.getInt("quantity"));
                ret = order;
            }
            
            if (rs != null)
            {
                ps.close();
                rs.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }

    public List<OrderedProduct> getOrderHistoryFromID(String order_id)
    {
        List<OrderedProduct> ret = new ArrayList<OrderedProduct>();
        try
        {
            this.conn = ds.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM ordered_product"
                    + " WHERE order_id = ?;");
            ps.setString(1, order_id);
            this.rs = ps.executeQuery();
            while(this.rs.next())
            {
                OrderedProduct order = new OrderedProduct();
                OrderHistoryDAO orderHistoryDAO = new OrderHistoryDAOImpl();
                order.setOrderHistory(orderHistoryDAO.getOrderHistoryFromID(this.rs.getString("order_id")));
                ProductDAO productDAO = new ProductDAOImpl();
                order.setProduct(productDAO.getProductFromID(this.rs.getString("product_id")));
                order.setQuantity(this.rs.getInt("quantity"));
                ret.add(order);
            }
            
            if (rs != null)
            {
                ps.close();
                rs.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public int getTotalQuantityFromProductID(String product_id)
    {
        int ret = 0;
        try
        {
            this.conn = ds.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT SUM(quantity)"
                    + " FROM ordered_product WHERE product_id = ?;");
            ps.setString(1, product_id);
            this.rs = ps.executeQuery();
            while(this.rs.next())
            {
                ret = this.rs.getInt("SUM(quantity)");
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public int getTotalQuantityOfProductSold()
    {
        int ret = 0;
        try
        {
            this.conn = ds.getConnection();
            this.rs = conn.prepareStatement("SELECT SUM(quantity) as total"
                    + " FROM ordered_product;").executeQuery();
            while(this.rs.next())
            {
                ret = this.rs.getInt("total");
            }
            
            if (rs != null)
            {
                rs.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }

    public int addOrder(String orderID, List<Order> order)
    {
        int rows = 0;
        try
        {
            this.conn = ds.getConnection();
            PreparedStatement ps = null;
            for(Order ordered: order)
            {
                ps = conn.prepareStatement("INSERT INTO ordered_product "
                        + "(order_id, product_id, quantity) "
                        + "VALUES(?, ?, ?)");
                ps.setString(1, orderID);
                ps.setString(2, ordered.getProductID());
                ps.setInt(3, ordered.getQuantity());
                
                ProductDAO productDAO = new ProductDAOImpl();
                int quantity = productDAO.getQuantityById(ordered.getProductID())
                        - ordered.getQuantity();
                productDAO.updateQuantity(ordered.getProductID(), quantity);

                rows = ps.executeUpdate();
            }
            
            if (rs != null)
            {
                rs.close();
            }
            if(ps != null)
            {
                ps.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rows;
    }
    
    public List<OrderedProduct> getByFilter(String productId, String orderId)
    {
        String query = getQueryFromFilter(productId, orderId);
        
        List<OrderedProduct> ret = new ArrayList<OrderedProduct>();
        try
        {
            this.conn = ds.getConnection();
            this.rs = conn.prepareStatement(query).executeQuery();
            while(this.rs.next())
            {
                OrderedProduct order = new OrderedProduct();
                OrderHistoryDAO orderHistoryDAO = new OrderHistoryDAOImpl();
                order.setOrderHistory(orderHistoryDAO.getOrderHistoryFromID(this.rs.getString("order_id")));
                ProductDAO productDAO = new ProductDAOImpl();
                order.setProduct(productDAO.getProductFromID(this.rs.getString("product_id")));
                order.setQuantity(this.rs.getInt("quantity"));
                ret.add(order);
            }
            
            if (rs != null)
            {
                rs.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(OrderedProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public String getQueryFromFilter(String productId, String orderId)
    {
        List<String> query = new ArrayList<String>();
        query.add("SELECT * FROM order_id");
        query.add(" WHERE");
        
        if(!productId.equalsIgnoreCase(""))
        {
            query.add(" product_id LIKE '%" + productId + "%'");
        }
        if(!orderId.equalsIgnoreCase(""))
        {
            query.add(" order_id LIKE '%" + orderId + "%'");
        }
        
        query.add(";");
        
        String ret = "";
        
        ret += query.get(0) + query.get(1);
        
        for(int i = 2; i <= (query.size() - 2); i++)
        {
            ret += query.get(i);
            if(!(query.get(i + 1).equalsIgnoreCase(";")))
            {
                ret += " AND";
            }
        }
        
        ret += query.get(query.size() - 1);
        
        return ret;
    }
}
